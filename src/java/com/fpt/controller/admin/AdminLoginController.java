package com.fpt.controller.admin;

import com.fpt.model.Users;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String view = request.getParameter("view");

            if (view == null) {
                login(request, response);
            } else {
                switch (view) {
                    case "login":
                    default:
                        login(request, response);
                        break;
                }
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        Query q = em.createNamedQuery("Users.findAll");
        List<Users> users = q.getResultList();
        users = users.stream().filter(u -> (name.equals(u.getUsername())) && (pass.equals(u.getPassword()))).collect(Collectors.toList());
        if (users.size() > 0) {
            Users user = users.get(0);
            HttpSession session = request.getSession();
            if (user.getRole() == 0) {
                session.setAttribute("user", user);
            }
            request.getRequestDispatcher("AdminProductController?view=show").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin");
        }

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
