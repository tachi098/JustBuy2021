package com.fpt.controller.admin;

import com.fpt.model.Users;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class AdminUserController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String view = request.getParameter("view");

            if (view == null) {
                show(request, response);
            } else {
                switch (view) {
                    case "status":
                        status(request, response);
                        break;
                    case "details":
                        details(request, response);
                        break;
                    case "edit":
                        edit(request, response);
                        break;
                    case "update":
                        update(request, response);
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

    private void details(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Users users = em.find(Users.class, id);
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin/page/Users/details.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Users users = em.find(Users.class, id);
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin/page/Users/form.jsp").forward(request, response);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.getWriter().print("aaa");
    }

    private void status(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Users users = em.find(Users.class, id);

        int role = users.getRole();

        users.setRole(role == 2 ? 1 : 2);

        try {
            et.begin();
            em.merge(users);
            et.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            et.rollback();
        }

        response.sendRedirect("AdminUserController?view=show");
    }

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query query = em.createNamedQuery("Users.findAll");
        List<Users> listUsers = query.getResultList();
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("admin/page/Users/show.jsp").forward(request, response);
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
            et.rollback();
        }
    }

}
