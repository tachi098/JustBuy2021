package com.fpt.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author HT
 */
@Entity
public class Amount implements Serializable {
    @Id
    int id;
    double amount;

    public Amount() {
    }

    public Amount(int id) {
        this.id = id;
    }

    public Amount(int id, double amount) {
        this.id = id;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
}
