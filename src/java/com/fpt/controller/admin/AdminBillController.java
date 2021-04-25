package com.fpt.controller.admin;

import com.fpt.model.Amount;
import com.fpt.model.Bill;
import com.fpt.model.BillDetail;
import com.fpt.model.Product;
import com.fpt.model.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminBillController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            try {
                String view = request.getParameter("view");

                if (view == null) {
                    showAllBills(request, response);
                } else {
                    switch (view) {
                        case "showBillDetail":
                            showBillDetail(request, response);
                            break;
                        case "processUpdateBill":
                            processUpdateBill(request, response);
                            break;
                        case "updateBill":
                            updateBill(request, response);
                            break;
                        case "showAllBills":
                            showAllBills(request, response);
                        default:
                            showAllBills(request, response);
                            break;
                    }
                }
            } catch (IOException | ServletException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    private void showAllBills(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //em.clear();
        Query q = em.createNamedQuery("Bill.findAll");
        //Query qAmountList = em.createNamedQuery("BillDetail.countAmount");
        Query qAmountList = em.createNativeQuery("SELECT b.id AS id, sum(p.price*(100-bd.discount)/100*bd.quantity) AS amount FROM Bill b, BillDetail bd, Product p WHERE b.id = bd.billId AND p.id = bd.productId GROUP BY b.id", Amount.class);
        request.setAttribute("list", q.getResultList());
        request.setAttribute("listAmount", qAmountList.getResultList());
        request.getRequestDispatcher("admin/page/Bill/show.jsp").forward(request, response);
    }

    private void showBillDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Query q = em.createNamedQuery("Bill.findById");
        q.setParameter("id", id);
        request.setAttribute("bill", q.getSingleResult());
        Query qD = em.createNamedQuery("BillDetail.findByBillId");
        qD.setParameter("id", id);
        request.setAttribute("billDetail", qD.getResultList());
        request.getRequestDispatcher("admin/page/Bill/detail.jsp").forward(request, response);
    }

    private void updateBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Query q = em.createNamedQuery("Bill.findById");
        q.setParameter("id", id);
        request.setAttribute("bill", q.getSingleResult());

        Query qD = em.createNamedQuery("BillDetail.findByBillId");
        qD.setParameter("id", id);
        request.setAttribute("billDetail", qD.getResultList());

        Query qU = em.createNamedQuery("Users.findAll");
        request.setAttribute("listUser", qU.getResultList());

        Query qP = em.createNamedQuery("Product.findAll");
        request.setAttribute("listProduct", qP.getResultList());
        request.getRequestDispatcher("admin/page/Bill/update.jsp").forward(request, response);
    }

    private void processUpdateBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int billId = Integer.parseInt(request.getParameter("billId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            int status = Integer.parseInt(request.getParameter("status"));
            Date pDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("pDate"));
            Bill bill = em.find(Bill.class, billId);
            bill.setUserId(new Users(userId));
            bill.setPurchaseDate(pDate);
            bill.setbStatus(status);
            em.getTransaction().begin();
            em.merge(bill);
            em.getTransaction().commit();

            Query q = em.createNamedQuery("BillDetail.findByBillId");
            q.setParameter("id", billId);
            List<BillDetail> list = q.getResultList();

            for (BillDetail b : list) {
                int productId = Integer.parseInt(request.getParameter("product" + b.getId()));
                int quantity = Integer.parseInt(request.getParameter("quantity" + b.getId()));
                double discount = Double.valueOf(request.getParameter("discount" + b.getId()));
                BillDetail bd = em.find(BillDetail.class, b.getId());

                bd.setProductId(new Product(productId));
                bd.setQuantity(quantity);
                bd.setDiscount(discount);
                em.getTransaction().begin();
                em.merge(bd);
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        }

        //showAllBills(request, response);
        response.sendRedirect("AdminBillController?view=show");
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        }
    }

}
