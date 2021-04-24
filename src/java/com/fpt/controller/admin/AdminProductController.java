package com.fpt.controller.admin;

import com.fpt.files.FileAny;
import com.fpt.model.Category;
import com.fpt.model.Image;
import com.fpt.model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AdminProductController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
                        break;
                    case "edit":
                        break;
                    case "update":
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

    private void show(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query q = em.createNamedQuery("Product.findAll");
        request.setAttribute("listProduct", q.getResultList());
        request.getRequestDispatcher("admin/page/Product/show.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query q = em.createNamedQuery("Category.findAll");
        request.setAttribute("listCategory", q.getResultList());
        request.getRequestDispatcher("admin/page/Product/form.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> "images".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
        String name = request.getParameter("name");
        int cateId = Integer.parseInt(request.getParameter("category"));
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setStock(stock);
        product.setDescription(description);
        product.setLaunchDate(new Date());
        Category category = em.find(Category.class, cateId);
        product.setCateId(category);

        if (parts.size() <= 1) {
            for (int i = 0; i < parts.size(); i++) {
                String filename = FileAny.upload(request, parts.get(i), "admin/assets/img");
                product.setImage(filename);
                em.getTransaction().begin();
                em.persist(product);
                em.getTransaction().commit();
            }
        } else {
            String nameImg = "";
            for (int i = 0; i < parts.size(); i++) {
                if (i == 0) {
                    String filename = FileAny.upload(request, parts.get(i), "admin/assets/img");
                    nameImg = filename;
                    product.setImage(filename);
                    em.getTransaction().begin();
                    em.persist(product);
                    em.getTransaction().commit();
                }
            }
            Query q = em.createNamedQuery("Product.findAll");
            List<Product> prods = q.getResultList();
            Product findProduct = null;
            for (Product prod : prods) {
                if (nameImg.equals(prod.getImage())) {
                    findProduct = prod;
                }
            }
            for (int j = 1; j < parts.size(); j++) {
                Image img = new Image();
                String filename = FileAny.upload(request, parts.get(j), "admin/assets/img");
                img.setLink(filename);
                img.setProductId(findProduct);
                em.getTransaction().begin();
                em.persist(img);
                em.getTransaction().commit();
            }
        }
        request.getRequestDispatcher("AdminProductController?view=show").forward(request, response);
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
