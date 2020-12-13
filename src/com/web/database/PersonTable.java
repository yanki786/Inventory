package com.web.database;

import com.mongodb.client.MongoCollection;
import com.web.entity.Person;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

@SuppressWarnings("unchecked")
public class PersonTable {

    private final MongoCollection<Person> personCol;

    private static final String coll_name = "person_collection";

    PersonTable(Connection connection) {
        personCol = (MongoCollection<Person>) connection.getCollection(coll_name, Person.class);
    }

    public List<Person> get(long ref) {
        return personCol.find(eq("ref", ref)).into(new ArrayList<>());
    }

    public void newPerson(Person p) {
        if (p != null) personCol.insertOne(p);
    }

    public void updatePersonDetail(Person p) {
    	deletePerson(p.getId(),p.ref);
    	newPerson(p);
    }

    public void deletePerson(int pId, long ref) {
        personCol.findOneAndDelete(and(eq("_id", pId), eq("ref", ref)));
    }

}
