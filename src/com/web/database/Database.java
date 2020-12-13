package com.web.database;


public class Database {

    private final UserTable user;
    private final  PersonTable relation;
    private final  ProductTable product;
    private final  TransactionTable transaction;
    private final  Connection connection;

    public Database(Connection connection) {
        this.connection = connection;
        user = new UserTable(connection);
        relation = new PersonTable(connection);
        product = new ProductTable(connection);
        transaction = new TransactionTable(connection);
    }

    public UserTable getUser() {
        return user;
    }

    public PersonTable getRelation() {
        return relation;
    }

    public ProductTable getProduct() {
        return product;
    }


    public TransactionTable getTransaction() {
        return transaction;
    }

    public void close() {
        if(connection!=null)
        connection.close();
    }
}
