package com.fpt.controller.admin;

import com.fpt.files.FileAny;
import com.fpt.model.Category;
import com.fpt.model.Discount;
import com.fpt.model.Image;
import com.fpt.model.Product;
import com.fpt.model.Users;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@SuppressWarnings("unchecked")
public class AdminProductController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
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
                        case "showdeal":
                            showdeal(request, response);
                            break;
                        case "dealdis":
                            dealdis(request, response);
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
        Query q = em.createNamedQuery("Product.findAll");
        request.setAttribute("listProduct", q.getResultList());
        request.getRequestDispatcher("admin/page/Product/show.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        Query q = em.createNamedQuery("Category.findAll");
        List<Category> categories = q.getResultList();
        categories = categories.stream().filter(c -> c.getDeleteDate() == null).collect(Collectors.toList());
        request.setAttribute("listCategory", categories);
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
                et.begin();
                em.persist(product);
                et.commit();
            }
        } else {
            String nameImg = "";
            for (int i = 0; i < parts.size(); i++) {
                if (i == 0) {
                    String filename = FileAny.upload(request, parts.get(i), "admin/assets/img");
                    nameImg = filename;
                    product.setImage(filename);
                    et.begin();
                    em.persist(product);
                    et.commit();
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
                et.begin();
                em.persist(img);
                et.commit();
            }
        }
        request.getRequestDispatcher("AdminProductController?view=show").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = em.find(Product.class, id);
        if (product.getDeleteDate() != null) {
            product.setDeleteDate(null);
        } else {
            product.setDeleteDate(new Date());
        }
        et.begin();
        em.merge(product);
        et.commit();
        response.sendRedirect("AdminProductController?view=show");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = em.find(Product.class, id);
        Query q = em.createNamedQuery("Category.findAll");
        List<Category> categories = q.getResultList();
        categories = categories.stream().filter(c -> c.getDeleteDate() == null).collect(Collectors.toList());
        request.setAttribute("listCategory", categories);
        request.setAttribute("product", product);
        request.getRequestDispatcher("admin/page/Product/form.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = em.find(Product.class, id);
        //Process discount table
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String dt = dtf.format(now);
        Calendar c = Calendar.getInstance();
        try {
            c.setTime(sdf.parse(dt));
        } catch (ParseException ex) {
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }

        String endDate = request.getParameter("endDate");
        String percent = request.getParameter("percent");
        if ((!"default".equals(endDate)) && (!"default".equals(percent))) {
            //Check discount exist
            Discount discount = new Discount();
            Query qDis = em.createNamedQuery("Discount.findAll");
            List<Discount> discs = qDis.getResultList();
            discs = discs.stream().filter(d -> d.getProductId().getId() == id).collect(Collectors.toList());
            if (discs.size() == 1) {
                for (Discount disc : discs) {
                    discount = disc;
                }
            }
            c.add(Calendar.DATE, Integer.parseInt(endDate));
            dt = sdf.format(c.getTime());
            try {
                Date d2 = sdf.parse(dt);
                discount.setEndDate(d2);
            } catch (ParseException ex) {
                Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
            discount.setPercents(Double.parseDouble(percent));
            discount.setProductId(product);
            et.begin();
            em.persist(discount);
            et.commit();
        }
        List<Part> parts = request.getParts().stream().filter(part -> "images".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
        String name = request.getParameter("name");
        int cateId = Integer.parseInt(request.getParameter("category"));
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");

        product.setName(name);
        Category category = em.find(Category.class, cateId);
        product.setCateId(category);
        product.setPrice(price);
        product.setStock(stock);
        product.setDescription(description);
        if (parts.size() > 0) {
            Product prod = em.find(Product.class, id);
            FileAny.delete(request, prod.getImage());
            Query q = em.createNamedQuery("Image.findAll");
            List<Image> listImg = q.getResultList();
            List<Image> listImgDel = listImg.stream().filter(i -> i.getProductId().getId() == id).collect(Collectors.toList());
            for (Image image : listImgDel) {
                FileAny.delete(request, image.getLink());
                et.begin();
                em.remove(image);
                et.commit();
            }
            if (parts.size() <= 1) {
                for (int i = 0; i < parts.size(); i++) {
                    String filename = FileAny.upload(request, parts.get(i), "admin/assets/img");
                    product.setImage(filename);
                    et.begin();
                    em.persist(product);
                    et.commit();
                }
            } else {
                for (int i = 0; i < parts.size(); i++) {
                    if (i == 0) {
                        String filename = FileAny.upload(request, parts.get(i), "admin/assets/img");
                        product.setImage(filename);
                        et.begin();
                        em.persist(product);
                        et.commit();
                    }
                }
                for (int j = 1; j < parts.size(); j++) {
                    Image img = new Image();
                    String filename = FileAny.upload(request, parts.get(j), "admin/assets/img");
                    img.setLink(filename);
                    img.setProductId(prod);
                    et.begin();
                    em.persist(img);
                    et.commit();
                }
            }
        }
        em.getTransaction().begin();
        em.merge(product);
        em.getTransaction().commit();
        request.getRequestDispatcher("AdminProductController?view=show").forward(request, response);
    }

    private void showdeal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dt;
        try {
            dt = sdf.parse(dtf.format(now));
            request.setAttribute("today", dt);
        } catch (ParseException ex) {
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }

        Query q = em.createNamedQuery("Discount.findAll");
        request.setAttribute("listDiscount", q.getResultList());
        request.getRequestDispatcher("admin/page/Product/showDeal.jsp").forward(request, response);
    }

    private void dealdis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Discount dis = em.find(Discount.class, id);
        dis.setEndDate(null);
        et.begin();
        em.merge(dis);
        et.commit();
        response.sendRedirect("AdminProductController?view=showdeal");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
