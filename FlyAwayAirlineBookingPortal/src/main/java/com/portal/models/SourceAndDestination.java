package com.portal.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SourceAndDestination")
public class SourceAndDestination {
 @Id
 @GeneratedValue
	private int s_id;
 @Column(unique = true)
 private String city;
public int getS_id() {
	return s_id;
}
public void setS_id(int s_id) {
	this.s_id = s_id;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}

 
}
