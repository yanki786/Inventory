package com.web.entity;

public class Transaction {

    private String transactionDate;//date+time

    private int productId;
    private int personId;
    private int quantity;
    private double price;
    private double balance;
    public long ref;

    public int getProductId() {
        return productId;
    }

    public Transaction setProductId(int productId) {
        this.productId = productId;
        return this;
    }

    public String getTransactionDate() {
        return transactionDate;
    }

    public Transaction setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
        return this;
    }

    public int getPersonId() {
        return personId;
    }

    public Transaction setPersonId(int personId) {
        this.personId = personId;
        return this;
    }

    public int getQuantity() {
        return quantity;
    }

    public Transaction setQuantity(int quantity) {
        this.quantity = quantity;
        return this;
    }

    public double getPrice() {
        return price;
    }

    public Transaction setPrice(double price) {
        this.price = price;
        return this;
    }

    public double getBalance() {
        return balance;
    }

    public Transaction setBalance(double balance) {
        this.balance = balance;
        return this;
    }
}
