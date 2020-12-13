package com.web.entity;

import java.util.Objects;

public class Person {

    public enum Type {
        SUPPLIER("Supplier"), CUSTOMER("Customer");
        String name;

        Type(String name) {
            this.name = name;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    private int id;
    private String name;
    private String phoneNumber;
    private Type type;

    public long ref;



    public int getId() {
        return id;
    }

    public Person setId(int id) {
        this.id = id;
        return this;
    }

   
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Type getType() {
        return type;
    }

    public Person setType(Type type) {
        this.type = type;
        return this;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Person)) return false;
        Person person = (Person) o;
        return Objects.equals(id, person.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Person{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
