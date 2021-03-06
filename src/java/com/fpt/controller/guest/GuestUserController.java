package com.fpt.controller.guest;

import com.fpt.files.FileAny;
import com.fpt.model.Address;
import com.fpt.model.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class GuestUserController extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("GuestLoginController?view=login").forward(request, response);
        }
        try {
            String view = request.getParameter("view");

            if (view == null) {
                show(request, response);
            } else {
                switch (view) {
                    case "changePass":
                        changePass(request, response);
                        break;
                    case "processChangePass":
                        processChangePass(request, response);
                        break;
                    case "delete":
                        break;
                    case "processUpdate":
                        processUpdate(request, response);
                        break;
                    case "update":
                        update(request, response);
                        break;
                    case "show":
                        show(request, response);
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
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        Users users = em.find(Users.class, user.getId());
        request.setAttribute("users", users);
        request.getRequestDispatcher("guest/page/user/show.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        Users users = em.find(Users.class, user.getId());
        request.setAttribute("user", users);
        request.getRequestDispatcher("guest/page/user/update.jsp").forward(request, response);
    }

    private void processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Part avatar = request.getPart("avatar");

        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        String state = request.getParameter("state");
        String line1 = request.getParameter("line1");
        String line2 = request.getParameter("line2");

        int id = Integer.valueOf(request.getParameter("id"));
        Users users = em.find(Users.class, id);

        users.setName(name);
        users.setEmail(email);
        users.setPhone(phone);

        if (!avatar.getSubmittedFileName().isEmpty()) {
            if (!"admin/assets/img/avatar.png".equals(users.getAvatar())) {
                FileAny.delete(request, users.getAvatar());
            }
            String fileName = FileAny.upload(request, avatar, "admin/assets/img");
            users.setAvatar(fileName);
        }

        Query queryAddress = em.createNativeQuery("SELECT * FROM address WHERE userId = ?", Address.class);
        queryAddress.setParameter(1, id);
        
        Address address = (Address) queryAddress.getSingleResult();

        address.setLine1(line1);
        address.setLine2(line2);
        address.setCity(city);
        address.setState(state);
        address.setZipcode(zipcode);

        try {
            et.begin();
            em.merge(users);
            em.merge(address);
            et.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            et.rollback();
        }

        response.sendRedirect("GuestUserController?view=show");
    }

    private void changePass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        Users users = em.find(Users.class, user.getId());
        request.setAttribute("users", users);
        request.getRequestDispatcher("guest/page/user/changePass.jsp").forward(request, response);
    }

    private void processChangePass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String newPass2 = request.getParameter("newPass2");

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        Users users = em.find(Users.class, user.getId());

        if (newPass.equals(newPass2) && users.getPassword().equals(oldPass)) {
            users.setPassword(newPass);
            try {
                et.begin();
                em.merge(users);
                et.commit();
            } catch (Exception e) {
                Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
                et.rollback();
            }
            response.sendRedirect("GuestUserController?view=show");
        } else {
            if (users.getPassword() == null ? oldPass != null : !users.getPassword().equals(oldPass)) {
                request.setAttribute("errorOP", "Old password is incorrect");
            }
            if (newPass == null ? newPass2 != null : !newPass.equals(newPass2)) {
                request.setAttribute("errorNP", "Retype password is not matched!");
            }
            request.getRequestDispatcher("guest/page/user/changePass.jsp").forward(request, response);
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        }
    }
}
