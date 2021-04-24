package com.fpt.services;

import com.fpt.model.Product;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ProductServices {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("JustBuyPU");
    EntityManager em = emf.createEntityManager();

    public void persit(Product product) {
        try {
            em.getTransaction().begin();
            em.persist(product);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void merge(Product product) {
        try {
            em.getTransaction().begin();
            em.merge(product);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void delete(Product product) {
        try {
            em.getTransaction().begin();
            em.remove(product);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public List<Product> showAll() {
        try {
            em.getTransaction().begin();
            Query q = em.createNamedQuery("Product.findAll");
            em.getTransaction().commit();
            return q.getResultList();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
            return null;
        } finally {
            em.close();
        }
    }

        public Product searchById(int id) {
        try {
            em.getTransaction().begin();
            Query q = em.createNamedQuery("Product.findById");
            q.setParameter("id", id);
            em.getTransaction().commit();
            return (Product)q.getSingleResult();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
            return null;
        } finally {
            em.close();
        }
    }
}
