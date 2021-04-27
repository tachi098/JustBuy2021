package com.fpt.controller.guest;

import com.fpt.model.Feedback;
import com.fpt.model.Users;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestContactController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String view = request.getParameter("view");

            if (view == null) {
                contact(request, response);
            } else {
                switch (view) {
                    case "process":
                        process(request, response);
                        break;
                    case "show":
                    default:
                        contact(request, response);
                        break;
                }
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    private void contact(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("guest/contact.jsp").forward(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subject = request.getParameter("subject");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        Feedback feedback = new Feedback();
        String content = "[" + subject + "][" + email + "]" + message;
        feedback.setStatus(true);
        feedback.setContent(content);
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        feedback.setUserId(user);
        feedback.setDateCreate(new Date());
        em.getTransaction().begin();
        em.persist(feedback);
        em.getTransaction().commit();
        response.sendRedirect("GuestIndexController?view=show");
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

    public void persist(Object object) {

        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
//            em.close();
        }
    }

}
