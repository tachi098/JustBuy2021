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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        EntityManager ez = emf.createEntityManager();
        try {
            ez.getTransaction().begin();
            Query qNewProducts = ez.createNativeQuery("with abc as (select *, ROW_NUMBER() over (order by id desc) as Row_Int from product where deleteDate is NULL) select * from abc where Row_Int between ? and ? order by id desc ", Product.class);
            qNewProducts.setParameter(1, 1);
            qNewProducts.setParameter(2, 4);
            List<Product> products = qNewProducts.getResultList();
            request.setAttribute("newProducts", products);

            //Get new Items
            qNewProducts.setParameter(2, 3);
            products = qNewProducts.getResultList();
            request.setAttribute("newItems", products);

            //Get Best Seller
            Query qBestSeller = ez.createNativeQuery("select p.id from billDetail bd, product p where p.id = bd.productId group by p.id order by SUM(bd.quantity) desc");
            List<Product> productb = new ArrayList<>();
            List<Integer> productIds = qBestSeller.getResultList();
            for (int i = 0; i < 3; i++) {
                Product product = ez.find(Product.class, productIds.get(i));
                productb.add(product);
            }
            request.setAttribute("bestSeller", productb);
            
            //Get Item Deal
            Query qFindAll = ez.createNamedQuery("Product.findAll");
            List<Product> proAll = qFindAll.getResultList();
            proAll = proAll.stream().filter(p -> p.getDiscount() != null).collect(Collectors.toList());
            request.setAttribute("proDeal", proAll);
            
            ez.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            ez.getTransaction().rollback();
        } finally {
            ez.close();
        }
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
        EntityManager ez = emf.createEntityManager();
        try {
            ez.getTransaction().begin();
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = ez.find(Product.class, id);
            request.setAttribute("listImage", product.getImageCollection());
            request.setAttribute("productDetails", product);
            ez.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            ez.getTransaction().rollback();
        } finally {
            ez.close();
        }
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
