package com.web.database;

import com.mongodb.client.MongoCollection;
import com.web.entity.Transaction;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;

@SuppressWarnings("unchecked")
public class TransactionTable {

    private final MongoCollection<Transaction> trans;
    private static final String coll_name = "transaction_collection";

     TransactionTable(Connection connection) {
        trans = (MongoCollection<Transaction>) connection.getCollection(coll_name, Transaction.class);
    }

    public void newTrans(Transaction t) {
        if (t != null) trans.insertOne(t);
    }

    public List<Transaction> get(long ref) {
        return trans.find(eq("ref", ref)).into(new ArrayList<>());
    }

}
