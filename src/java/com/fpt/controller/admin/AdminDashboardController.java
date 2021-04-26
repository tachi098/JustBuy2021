package com.fpt.controller.admin;

import com.fpt.model.Bill;
import com.fpt.model.Product;
import com.fpt.model.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminDashboardController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

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
                        case "update":
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
    }

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query qCountUser = em.createNativeQuery("SELECT count (*) FROM users WHERE role = 1");
        request.setAttribute("countUser", qCountUser.getSingleResult());
        Query qCountBill = em.createNativeQuery("SELECT count (*) FROM bill WHERE bStatus != 4");
        request.setAttribute("countBill", qCountBill.getSingleResult());
        Query qCountProduct = em.createNativeQuery("SELECT count (*) FROM product where deleteDate IS null");
        request.setAttribute("countProduct", qCountProduct.getSingleResult());
        Query qCountCategory = em.createNativeQuery("SELECT count (*) FROM category where deleteDate IS null");
        request.setAttribute("countCategory", qCountCategory.getSingleResult());
        Query qBill = em.createNativeQuery("SELECT TOP 6 * FROM bill WHERE bStatus != 4 ORDER BY id DESC", Bill.class);
        request.setAttribute("listBill", qBill.getResultList());
        Query qProduct = em.createNativeQuery("SELECT TOP 6 * FROM product WHERE deleteDate IS NULL ORDER BY id DESC", Product.class);
        request.setAttribute("listProduct", qProduct.getResultList());
        request.getRequestDispatcher("admin/page/Dashboard/index.jsp").forward(request, response);
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
