package com.portal.services;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.portal.dbconnection.GetDBConnection;
import com.portal.models.SourceAndDestination;

public class SourceAndDestinationService {
	private SessionFactory sFactory;

	public SourceAndDestinationService() {
		sFactory = GetDBConnection.getSessionFactory();
		if (sFactory == null) {
			throw new RuntimeException("SessionFactory initialization failed. Check Hibernate configuration.");
		}
	}

	public void addSourceAndDestination(SourceAndDestination sourceAndDestination) {
		Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(sourceAndDestination);
		transaction.commit();
		session.close();
	}

	public List<SourceAndDestination> showAllSourceAndDestination() {
		Session session = sFactory.openSession();
		Query<SourceAndDestination> query = session.createQuery("FROM SourceAndDestination", SourceAndDestination.class);
		List<SourceAndDestination> sall = query.getResultList();
		session.close();
		return sall;
	}
}
