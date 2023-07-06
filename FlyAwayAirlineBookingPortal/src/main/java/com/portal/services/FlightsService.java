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
import com.portal.models.Flights;

public class FlightsService {
	private SessionFactory sFactory = null;
	public FlightsService() {
		 sFactory = GetDBConnection.getSessionFactory();
	}
	public void addFlights( Flights flights) {
		Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(flights);
		transaction.commit();
		session.close();
	}
	public List<Flights> showAllFlights(){
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("From Flights");
		List<Flights> fall = qry.getResultList();
		return fall;
	}
	public List<Flights> searchFlights(String source, String destination, String date){
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("From Flights where source=:source and destination=:destination and date=:date");
		qry.setParameter("source",source);
		qry.setParameter("destination",destination);
		qry.setParameter("date",date);
		List<Flights> flights = qry.getResultList();
		return flights;
	}
	public Flights getFlightDetails(int f_id) {
	    Session session = sFactory.openSession();
	    TypedQuery<Flights> qry = session.createQuery("FROM Flights WHERE airline_id = :f_id", Flights.class);
	    qry.setParameter("f_id", f_id);
	    Flights flights = qry.getSingleResult();
	    session.close();
	    return flights;
	}
}
