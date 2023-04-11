package com.nay.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nay.springdemo.entity.Customer;
import com.nay.springdemo.util.SortUtils;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> getCustomers() {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query ... sort by last name
		Query<Customer> theQuery = currentSession.createQuery("from Customer order by lastName", Customer.class);

		// execute query and get result list
		List<Customer> customers = theQuery.getResultList();

		// return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theCustomer);

	}

	@Override
	public Customer getCustomer(int theId) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// now retrieve/read from database using the primary key
		Customer theCustomer = currentSession.get(Customer.class, theId);

		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", theId);

		theQuery.executeUpdate();
	}

	@Override
	public List<Customer> getCustomers(int theSortField) {
		
		 String name =nameConverter(theSortField);

		Session currentSession = sessionFactory.getCurrentSession();

		Query<Customer> query = currentSession.createQuery("from Customer order by " + name, Customer.class);

		List<Customer> customers = query.getResultList();
		// TODO Auto-generated method stub
		return customers;
	}

	private String nameConverter(int theSortField) {
		String name = null;
		switch (theSortField) {
		case SortUtils.FIRST_NAME:
			name = "firstName";
			break;
		case SortUtils.LAST_NAME:
			name = "lastName";
			break;
		case SortUtils.EMAIL:
			name = "email";
			break;
		}
		return name;
	}

	@Override
	public List<Customer> searchCustomer(String theSearchName) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Customer> query=null;
		if(theSearchName!=null && theSearchName.trim().length()>0) {
			query = currentSession.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName",Customer.class);
			query.setParameter("theName","%" + theSearchName.toLowerCase() + "%");
		}
		else {
			 query =currentSession.createQuery("from Customer", Customer.class);
		}
		List<Customer> customers=query.getResultList();
		
		return customers;
	}

}
