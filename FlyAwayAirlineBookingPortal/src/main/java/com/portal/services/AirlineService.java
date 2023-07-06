package com.portal.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.dbconnection.GetDBConnection;
import com.portal.models.Airline;
import com.portal.models.Flights;

public class AirlineService {
 private SessionFactory sFactory = null;
 public AirlineService() {
	 sFactory = GetDBConnection.getSessionFactory();
 }
 public void addAirline( Airline airline ) {
	 Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(airline);
		transaction.commit();
		session.close();
 }
 public List<Airline> showallAirline(){
	 Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("From Airline");
		List<Airline> aall = qry.getResultList();
		return aall;
 }
 public Airline searchAirline(int a_id) {
	    Session session = sFactory.openSession();
	    TypedQuery<Airline> qry = session.createQuery("FROM Airline WHERE airline_id = :a_id", Airline.class);
	    qry.setParameter("a_id", a_id);
	    Airline airline = qry.getSingleResult();
	    session.close();
	    return airline;
	}

}
