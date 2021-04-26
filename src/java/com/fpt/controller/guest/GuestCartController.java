package com.fpt.controller.guest;

import com.fpt.model.Bill;
import com.fpt.model.BillDetail;
import com.fpt.model.Product;
import com.fpt.model.Users;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestCartController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String view = request.getParameter("view");

            if (view == null) {
                show(request, response);
            } else {
                switch (view) {
                    case "add":
                        break;
                    case "checkout":
                        checkout(request, response);
                        break;
                    case "processCheckout":
                        processCheckout(request, response);
                        break;
                    case "remove":
                        remove(request, response);
                        break;
                    case "change":
                        change(request, response);
                        break;
                    case "show":
                    default:
                        show(request, response);
                        break;
                }
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    private void processCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            HttpSession session = request.getSession();
            int userId = ((Users) session.getAttribute("user")).getId();
            Users users = em.find(Users.class, userId);

            int billID = Integer.valueOf(request.getParameter("billId"));
            Bill bill = em.find(Bill.class, billID);
            bill.setbStatus(0);
            em.merge(bill);

            Query queryBillDetails = em.createNativeQuery("select * from billDetail where billId = ?", BillDetail.class);
            queryBillDetails.setParameter(1, billID);
            List<BillDetail> billDetails = queryBillDetails.getResultList();

            billDetails.stream().map(bd -> {
                Product product = em.find(Product.class, bd.getProductId().getId());
                int stockNew = bd.getProductId().getStock() - bd.getQuantity();
                product.setStock(stockNew);
                return product;
            }).forEachOrdered(product -> {
                em.merge(product);
            });

            session.setAttribute("payment", "Payment was successful, many thanks!");
            request.setAttribute("users", users);
            session.removeAttribute("countCart");
            em.getTransaction().commit();
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

        response.sendRedirect("GuestCartController?view=show");
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            int userID = 2;
            Users users = em.find(Users.class, userID);

            float subtotal = Float.valueOf(request.getParameter("subtotal"));
            int billId = Integer.valueOf(request.getParameter("billId"));

            request.setAttribute("billId", billId);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("users", users);

            em.getTransaction().commit();
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

        request.getRequestDispatcher("guest/checkout.jsp").forward(request, response);
    }

    private void remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            int billDetailId = Integer.valueOf(request.getParameter("billDetailId"));
            BillDetail billDetail = em.find(BillDetail.class, billDetailId);

            em.remove(billDetail);

            int billId = Integer.valueOf(request.getParameter("billId"));
            Query queryBilldetails = em.createNativeQuery("SELECT * FROM billDetail WHERE billId = ?", BillDetail.class);
            queryBilldetails.setParameter(1, billId);
            List<BillDetail> billDetails = queryBilldetails.getResultList();

            if (billDetails.isEmpty()) {
                Bill bill = em.find(Bill.class, billId);
                em.remove(bill);
            }

            em.getTransaction().commit();
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

        response.sendRedirect("GuestCartController?view=show");
    }

    private void change(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            int quantity = Integer.valueOf(request.getParameter("quantity"));
            int billDetailId = Integer.valueOf(request.getParameter("billDetailId"));
            int productId = Integer.valueOf(request.getParameter("productId"));

            // Get Product
            Product product = em.find(Product.class, productId);

            if (product.getStock() >= quantity) {

                // Get BillDetail
                BillDetail billDetail = em.find(BillDetail.class, billDetailId);
                billDetail.setQuantity(quantity);

                em.persist(billDetail);

                response.sendRedirect("GuestCartController?view=show");
            } else {

                session.setAttribute("errorQuantity", "Stock is not enough!");
                response.sendRedirect("GuestCartController?view=show");
            }

            em.getTransaction().commit();
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

    }

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            // Hard Code ID User
            HttpSession session = request.getSession();
            int userId = ((Users) session.getAttribute("user")).getId();

            // Get Bill
            Query queryBill = em.createNativeQuery("SELECT * FROM bill WHERE userId = ? AND bStatus = 4", Bill.class);
            queryBill.setParameter(1, userId);
            List<Bill> bills = queryBill.getResultList();

            if (bills.size() > 0) {

                Bill bill = (Bill) queryBill.getSingleResult();

                // Get Bill Details
                List<BillDetail> billDetail = (List<BillDetail>) bill.getBillDetailCollection();

                // Subtotal price(have discount)
                float subTotalDiscount = 0;
                for (BillDetail bd : billDetail) {
                    subTotalDiscount = (float) (subTotalDiscount + bd.getProductId().getPrice() * (1 - bd.getDiscount()) * bd.getQuantity());
                }

                // Get count cart
                int countCart = 0;
                countCart = billDetail.stream().map(bd -> bd.getQuantity()).reduce(countCart, Integer::sum);

                session.setAttribute("countCart", countCart);
                request.setAttribute("bill", bill);
                request.setAttribute("subTotal", subTotalDiscount);
                request.setAttribute("billDetail", billDetail);
            }
            
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

        request.getRequestDispatcher("guest/cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
