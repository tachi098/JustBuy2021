package com.fpt.controller.guest;

import com.fpt.model.Address;
import com.fpt.model.Bill;
import com.fpt.model.BillDetail;
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
                    case "create":
                        create(request, response);
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

                    int userId = ((Users) session.getAttribute("user")).getId();
                    
                    Query queryBill = ez.createNativeQuery("SELECT * FROM bill WHERE userId = ? AND bStatus = 4", Bill.class);
                    queryBill.setParameter(1, userId);
//                    Bill bill = (Bill) queryBill.getSingleResult();
                    List<Bill> bills = queryBill.getResultList();

                    int countCart = 0;
                    // Get Bill Details
                    if (bills.size() > 0) {
                        Bill bill = (Bill) queryBill.getSingleResult();
                        List<BillDetail> billDetail = (List<BillDetail>) bill.getBillDetailCollection();
                        for (BillDetail bd : billDetail) {
                            countCart += bd.getQuantity();
                        }
                    }

                    session.setAttribute("countCart", countCart);
                    response.sendRedirect("GuestIndexController?view=show");
                } else {
                    request.setAttribute("error", "not author");
                    request.getRequestDispatcher("guest/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Admin or password is wrong");
                request.getRequestDispatcher("guest/login.jsp").forward(request, response);
            }

            ez.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            ez.getTransaction().rollback();
        } finally {
            ez.close();
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            session.removeAttribute("user");
//            session.removeAttribute("countCart");
            request.getRequestDispatcher("GuestIndexController?view=show").forward(request, response);
        }
    }

    private void regis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("guest/registration.jsp").forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String address1 = request.getParameter("address");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cfpass = request.getParameter("cfpass");
        Query q = em.createNamedQuery("Users.findAll");
        List<Users> users = q.getResultList();
        users = users.stream().filter(u -> name.toLowerCase().equals(u.getUsername().toLowerCase())).collect(Collectors.toList());
        if (users.size() == 0) {
            if (pass.equals(cfpass)) {
                Users user = new Users();
                user.setName("User Account");
                user.setUsername(name);
                user.setEmail(email);
                user.setPassword(pass);
                user.setRole(1);
                
                Address address = new Address();
                address.setUserId(user);
                address.setLine1(address1);
                address.setLine2("");
                address.setCity("");
                address.setZipcode("");
                address.setState("");
                
                et.begin();
                em.persist(user);
                em.persist(address);
                et.commit();
                response.sendRedirect("GuestLoginController?view=login");
            } else {
                request.setAttribute("errorPass", "password and password confirm not match");
                request.getRequestDispatcher("guest/registration.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorUsername", "username is existed");
            request.getRequestDispatcher("guest/registration.jsp").forward(request, response);
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
