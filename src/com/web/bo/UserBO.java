package com.web.bo;

import com.web.database.Connection;
import com.web.database.Database;
import com.web.entity.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class UserBO implements AutoCloseable {

	private static final HashMap<Long, UserBO> bean = new HashMap<>();

	private long id;// ref
	private Database database;
	private User user;

	final private List<Person> people;
	final private List<Product> products;
	final private List<Transaction> transactions;

	public static UserBO getSession(long is) {
		return bean.get(is);
	}

	public UserBO(User user, Connection con) {

		database = new Database(con);
		this.id = user.getId();
		this.user = user;

		people = database.getRelation().get(id);
		products = database.getProduct().get(id);
		transactions = database.getTransaction().get(id);

		bean.putIfAbsent(user.getId(), this);

	}

	public long getId() {
		return id;
	}

	public List<Product> getProducts() {
		return products;
	}

	public List<Person> getSuppliers() {
		return people == null ? null
				: people.stream().filter(e -> e.getType() == Person.Type.SUPPLIER).collect(Collectors.toList());
	}

	public List<Person> getCustomers() {
		return people == null ? null
				: people.stream().filter(e -> e.getType() == Person.Type.CUSTOMER).collect(Collectors.toList());
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public List<Transaction> getTransactionsOn(int month, int year) {
		if (transactions == null)
			return null;
		else if (month == 0)
			return transactions.stream().filter(e -> e.getTransactionDate().contains(year + ""))
					.collect(Collectors.toList());
		else if (year == 0)
			return transactions.stream().filter(e -> e.getTransactionDate().contains(month + ""))
					.collect(Collectors.toList());
		else
			return transactions.stream().filter(e -> e.getTransactionDate().contains(month + "/" + year))
					.collect(Collectors.toList());

	}

	public List<Transaction> getTransactionsOf(int personId, int productId) {
		if (transactions == null)
			return null;
		else if (personId != -1 && productId != -1)
			return transactions.stream().filter(e -> (e.getPersonId() == personId && e.getProductId() == productId))
					.collect(Collectors.toList());
		else if (personId != -1)
			return transactions.stream().filter(e -> e.getPersonId() == personId).collect(Collectors.toList());
		else
			return transactions.stream().filter(e -> e.getProductId() == productId).collect(Collectors.toList());
	}

	public void addProduct(Product product) {
		product.ref = id;
		products.add(product);
		database.getProduct().newProduct(product);
	}

	public Product parseProductBean(ProductBean bean) {
		Product product = new Product();
		product.setProductId(products.size());
		product.setProductName(bean.getProductName());
		product.setQuantity(Integer.parseInt(bean.getQuantity()));
		return product;
	}

	public void addPerson(Person person, Person.Type type) {
		person.ref = id;
		person.setId(people.size());
		person.setType(type);
		people.add(person);
		database.getRelation().newPerson(person);
	}

	public void buyProduct(Product product, int pId, int q, double p) {
		
		double balance = user.getBalance();
		balance -= p * q;

		Transaction transaction = new Transaction().setBalance(balance).setProductId(product.getProductId())
				.setTransactionDate(LocalDateTime.now().toString()).setQuantity(q).setPrice(p)
				.setPersonId(pId);
		transaction.ref = id;
		product.ref=id;
		product.setQuantity(q+product.getQuantity());
		user.setBalance(balance);
		database.getTransaction().newTrans(transaction);
		database.getUser().updateUserDetail(user);
		transactions.add(transaction);
		updateProduct(product);
	}

	
	public void sellProduct(Product product, int pId, int q, double p) {
		double balance = user.getBalance();
		balance += p * q;
		Transaction transaction = new Transaction().setBalance(balance).setProductId(product.getProductId())
				.setTransactionDate(LocalDateTime.now().toString()).setQuantity(q).setPrice(p)
				.setPersonId(pId);
		transaction.ref = id;
		product.ref=id;
		product.setQuantity(product.getQuantity()-q);
		user.setBalance(balance);
		database.getTransaction().newTrans(transaction);
		database.getUser().updateUserDetail(user);
		transactions.add(transaction);
		updateProduct(product);
		
	}


	public void updateProduct(Product product) {
		var itr = products.iterator();
		while (itr.hasNext())
			if (itr.next().getProductId() == product.getProductId()) {
				itr.remove();
				break;
			}
		product.ref=id;
		products.add(product);
		database.getProduct().updateProductDetail(product);
	}

	public void updatePerson(Person person, Person.Type type) {
		person.ref=id;
		person.setType(type);
		people.remove(person);
		people.add(person);
		database.getRelation().updatePersonDetail(person);
	}

	public void removeProduct(int productId) {
		var itr = products.iterator();
		while (itr.hasNext())
			if (itr.next().getProductId() == productId) {
				itr.remove();
				break;
			}
		database.getProduct().deleteProduct(productId, id);
	}

	public void removePerson(int personId) {
		if (products != null) {
			var itr = people.iterator();
			while (itr.hasNext())
				if (itr.next().getId() == personId) {
					itr.remove();
					break;
				}
			database.getRelation().deletePerson(personId, id);
		}
	}

	public User getUser() {
		return user;
	}

	public void updateUser(User user) {
		user.setId(id);
		database.getUser().updateUserDetail(user);
	}

	@Override
	public void close() {
		database.close();
	}

	@Override
	public String toString() {
		return "UserBO [id=" + id + ", database=" + database + ", user=" + user + ", people=" + people + ", products="
				+ products + ", transactions=" + transactions + "]";
	}

}
