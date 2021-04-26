package com.fpt.controller.guest;

import com.fpt.model.Users;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestLoginController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        try {
            String view = request.getParameter("view");

            if (view == null) {
                login(request, response);
            } else {
                switch (view) {
                    case "process":
                        process(request, response);
                        break;
                    case "regis":
                        regis(request, response);
                        break;
                    case "logout":
                        logout(request, response);
                        break;
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
        request.getRequestDispatcher("guest/login.jsp").forward(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        EntityManager ez = emf.createEntityManager();
        try {
            ez.getTransaction().begin();
            Query q = ez.createNativeQuery("select * from users", Users.class);

            List<Users> users = (List<Users>) q.getResultList();
            users = users.stream().filter(u -> name.toLowerCase().equals(u.getUsername().toLowerCase()) && pass.equals(u.getPassword())).collect(Collectors.toList());
            if (users.size() == 1) {
                Users user = users.get(0);
                if (user.getRole() == 1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("GuestIndexController?view=show").forward(request, response);
                } else {
                    request.setAttribute("error", "Admin not author");
                    request.getRequestDispatcher("GuestLoginController?view=login").forward(request, response);
                }
            }
            request.setAttribute("error", "Admin or password is wrong");
            request.getRequestDispatcher("GuestLoginController?view=login").forward(request, response);
            ez.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            session.removeAttribute("user");
            request.getRequestDispatcher("GuestIndexController?view=show").forward(request, response);
        }
    }

    private void regis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("guest/registration.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("guest/registration.jsp").forward(request, response);
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
            et.begin();
            em.persist(object);
            et.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
//            em.close();
        }
    }

}
