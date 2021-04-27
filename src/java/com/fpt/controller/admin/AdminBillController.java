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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("userAdmin");
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
        EntityManager em = emf.createEntityManager();
        try {
            Query q = em.createNativeQuery("SELECT * FROM bill WHERE bStatus != 4", Bill.class);
            Query qAmountList = em.createNativeQuery("SELECT b.id AS id, sum(p.price*(1-bd.discount)*bd.quantity) AS amount FROM Bill b, BillDetail bd, Product p WHERE b.id = bd.billId AND p.id = bd.productId GROUP BY b.id", Amount.class);
            request.setAttribute("list", q.getResultList());
            request.setAttribute("listAmount", qAmountList.getResultList());

        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        request.getRequestDispatcher("admin/page/Bill/show.jsp").forward(request, response);

    }

    private void showBillDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Query q = em.createNamedQuery("Bill.findById");
            q.setParameter("id", id);
            request.setAttribute("bill", q.getSingleResult());
            Query qD = em.createNamedQuery("BillDetail.findByBillId");
            qD.setParameter("id", id);
            request.setAttribute("billDetail", qD.getResultList());

        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
        request.getRequestDispatcher("admin/page/Bill/detail.jsp").forward(request, response);
    }

//    private void updateBill(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        EntityManager em = emf.createEntityManager();
//        try {
//            int id = Integer.parseInt(request.getParameter("id"));
//            Query q = em.createNamedQuery("Bill.findById");
//            q.setParameter("id", id);
//            request.setAttribute("bill", q.getSingleResult());
//
//            Query qD = em.createNamedQuery("BillDetail.findByBillId");
//            qD.setParameter("id", id);
//            request.setAttribute("billDetail", qD.getResultList());
//
//            Query qU = em.createNamedQuery("Users.findAll");
//            request.setAttribute("listUser", qU.getResultList());
//
//            Query qP = em.createNamedQuery("Product.findAll");
//            request.setAttribute("listProduct", qP.getResultList());
//
//        } catch (Exception e) {
//            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
//            em.getTransaction().rollback();
//        } finally {
//            em.close();
//        }
//        request.getRequestDispatcher("admin/page/Bill/update.jsp").forward(request, response);
//    }

    private void updateBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            Bill bill = em.find(Bill.class, id);
            bill.setbStatus(status);
            em.getTransaction().begin();
            em.merge(bill);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
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
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

}
