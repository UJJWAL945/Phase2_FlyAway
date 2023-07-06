package com.portal.services;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.dbconnection.GetDBConnection;
import com.portal.models.AdminLogin;

public class AdminLoginServices {
  private SessionFactory sFactory = null;
  public AdminLoginServices() {
	sFactory = GetDBConnection.getSessionFactory();
}
  public void addAdmins(AdminLogin admin) {
	  Session session = sFactory.openSession();
	  Transaction transaction = session.beginTransaction();
	  session.save(admin);
	  transaction.commit();
  }
  
  public void changePassword(String newpassword, String username) {
	    Session session = sFactory.openSession();
	    Transaction transaction = session.beginTransaction();
	    TypedQuery<AdminLogin> qryQuery = session.createQuery("UPDATE AdminLogin SET password = :newPassword WHERE username = :username");
	    qryQuery.setParameter("newPassword", newpassword);
	    qryQuery.setParameter("username", username);
	    int updatedCount = qryQuery.executeUpdate();
	    transaction.commit();
	}
  public AdminLogin checkCredentials(String email , String password) {
	  Session session = sFactory.openSession();
	 
	  TypedQuery qryQuery = session.createQuery("from AdminLogin Where password =:password and username =:email");
	  qryQuery.setParameter("password",password);
	  qryQuery.setParameter("email", email);
	  List<AdminLogin> aall = qryQuery.getResultList();
	  return aall.get(0);
	  
  }
}
