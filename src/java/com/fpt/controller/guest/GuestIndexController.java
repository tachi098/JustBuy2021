package com.fpt.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fpt.model.Product;
import java.util.List;

public class GuestIndexController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

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
                    case "productDetails":
                        productDetails(request, response);
                        break;
                    case "showProduct":
                        showProduct(request, response);
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

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Query q = em.createNamedQuery("Product.findAll");
        request.setAttribute("productList", q.getResultList());
        request.getRequestDispatcher("guest/index.jsp").forward(request, response);

    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            // Get all products
            Query queryShowProduct = em.createNamedQuery("Product.findAll");
            List<Product> products = queryShowProduct.getResultList();
            request.setAttribute("products", products);
            request.getRequestDispatcher("guest/show.jsp").forward(request, response);
            em.getTransaction().commit();
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

    }

    private void productDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = em.find(Product.class, id);

//        response.getWriter().print(product.getImageCollection());
        request.setAttribute("listImage", product.getImageCollection());
        request.setAttribute("productDetails", product);

        request.getRequestDispatcher("guest/productdetails.jsp").forward(request, response);

    }

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
