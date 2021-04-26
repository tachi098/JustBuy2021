package com.fpt.controller.guest;

import com.fpt.model.Amount;
import com.fpt.model.Bill;
import com.fpt.model.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestBillController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("GuestLoginController?view=login").forward(request, response);
        }
        try {
            String view = request.getParameter("view");

            if (view == null) {
                show(request, response);
            } else {
                switch (view) {
                    case "create":
                        break;
                    case "insert":
                        break;
                    case "delete":
                        break;
                    case "edit":
                        break;
                    case "detail":
                        detail(request, response);
                        break;
                    case "show":
                        show(request, response);
                    default:
                        show(request, response);
                        break;
                }
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        Query q = em.createNativeQuery("SELECT * from bill b where b.userId = ?", Bill.class);
        q.setParameter(1, user.getId());
        Query qAmountList = em.createNativeQuery("SELECT b.id AS id, sum(p.price*(100-bd.discount)/100*bd.quantity) AS amount FROM Bill b, BillDetail bd, Product p WHERE b.id = bd.billId AND p.id = bd.productId GROUP BY b.id", Amount.class);
        request.setAttribute("list", q.getResultList());
        request.setAttribute("listAmount", qAmountList.getResultList());
        request.getRequestDispatcher("guest/page/bill/show.jsp").forward(request, response);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        int id = Integer.parseInt(request.getParameter("id"));
        Query q = em.createNamedQuery("Bill.findById");
        q.setParameter("id", id);
        Bill bill = (Bill)q.getSingleResult();
        if(bill.getUserId().getId() != user.getId()){
            request.getRequestDispatcher("/").forward(request, response);
        }
        request.setAttribute("bill", bill);
        Query qAmountList = em.createNativeQuery("SELECT b.id AS id, sum(p.price*(100-bd.discount)/100*bd.quantity) AS amount FROM Bill b, BillDetail bd, Product p WHERE b.id = bd.billId AND p.id = bd.productId GROUP BY b.id", Amount.class);
        request.setAttribute("listAmount", qAmountList.getResultList());
        Query qD = em.createNamedQuery("BillDetail.findByBillId");
        qD.setParameter("id", id);
        request.setAttribute("billDetail", qD.getResultList());
        request.getRequestDispatcher("guest/page/bill/detail.jsp").forward(request, response);
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
