package com.fpt.controller.admin;

import com.fpt.model.Category;
import com.fpt.model.Users;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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

public class AdminCategoryController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
                            create(request, response);
                            break;
                        case "insert":
                            insert(request, response);
                            break;
                        case "delete":
                            delete(request, response);
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
    }

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query q = em.createNamedQuery("Category.findAll");
        request.setAttribute("listCategory", q.getResultList());
        request.getRequestDispatcher("admin/page/Category/show.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Category cate = new Category();
        cate.setName(name);
        et.begin();
        em.persist(cate);
        et.commit();
        response.sendRedirect("AdminCategoryController?view=show");
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/page/Category/form.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category cate = em.find(Category.class, id);
        if (cate.getDeleteDate() == null) {
            cate.setDeleteDate(new Date());
        } else {
            cate.setDeleteDate(null);
        }
        et.begin();
        em.merge(cate);
        et.commit();
        response.sendRedirect("AdminCategoryController?view=show");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category cate = em.find(Category.class, id);
        request.setAttribute("category", cate);
        request.getRequestDispatcher("admin/page/Category/form.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category cate = em.find(Category.class, id);
        String name = request.getParameter("name");
        cate.setName(name);
        et.begin();
        em.merge(cate);
        et.commit();
        response.sendRedirect("AdminCategoryController?view=show");
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
            em.close();
        }
    }

}
