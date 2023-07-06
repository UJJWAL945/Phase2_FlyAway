package com.portal.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.dbconnection.GetDBConnection;
import com.portal.models.Airline;
import com.portal.models.CustomerDetails;

public class CustomerDetailsService {
	private SessionFactory sFactory = null;
	public CustomerDetailsService() {
		 sFactory = GetDBConnection.getSessionFactory();
	}
	public void addCustomerDetails( CustomerDetails customerDetails) {
		Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(customerDetails);
		transaction.commit();
		session.close();
	}
	public List<CustomerDetails> showAllCustomer(){
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("From CustomerDetails");
		List<CustomerDetails> call = qry.getResultList();
		return call;
	}
	public List<CustomerDetails> searchCustomerDetails(String emailid){
		List<CustomerDetails> call = new ArrayList<CustomerDetails> ();
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("From CustomerDetails where email=:emailid");
		qry.setParameter("emailid", emailid);
		call = qry.getResultList();
		if(call.isEmpty()) {
			return null;
		}
		else {
		return call;
	}
}
}