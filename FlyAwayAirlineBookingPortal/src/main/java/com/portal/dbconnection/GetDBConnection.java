package com.portal.dbconnection;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.portal.models.AdminLogin;
import com.portal.models.Airline;
import com.portal.models.CustomerDetails;
import com.portal.models.Flights;
import com.portal.models.SourceAndDestination;

public class GetDBConnection {
private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try
			{
				Configuration  cfg = new Configuration();
				Properties settings = new Properties();
				
				settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/phase2db");
				settings.put(Environment.USER, "root");
				settings.put(Environment.PASS, "root");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
				settings.put(Environment.SHOW_SQL, "true");
				settings.put(Environment.HBM2DDL_AUTO, "update");
				
				cfg.setProperties(settings);
				//settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

				cfg.addAnnotatedClass(SourceAndDestination.class);
				cfg.addAnnotatedClass(Airline.class);
				cfg.addAnnotatedClass(CustomerDetails.class);
				cfg.addAnnotatedClass(Flights.class);
			
				cfg.addAnnotatedClass(AdminLogin.class);
				
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(cfg.getProperties()).build();
				
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionFactory = cfg.buildSessionFactory(serviceRegistry);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		return sessionFactory;
	}
}
