package com.nay.springdemo.dao;

import java.util.List;

import com.nay.springdemo.entity.Customer;

public interface CustomerDAO {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId);

	public void deleteCustomer(int theId);

	public List<Customer> getCustomers(int theSortField);

	public List<Customer> searchCustomer(String theSearchName);
	
}
