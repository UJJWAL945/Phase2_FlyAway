package com.portal.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Flight_info")
public class Flights {
	@Id @GeneratedValue
	private int flight_no;
	private String source;
	private String destination;
	private String date;
	private String time;
	private float price;
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	private int airline_id;
	@OneToMany(targetEntity = CustomerDetails.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "flight_no")
	private List<CustomerDetails> cdetails;
	public int getAirline_id() {
		return airline_id;
	}
	public void setAirline_id(int airline_id) {
		this.airline_id = airline_id;
	}
		public int getFlight_no() {
		return flight_no;
	}
	public void setFlight_no(int flight_no) {
		this.flight_no = flight_no;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public List<CustomerDetails> getCdetails() {
		return cdetails;
	}
	public void setCdetails(List<CustomerDetails> cdetails) {
		this.cdetails = cdetails;
	}
	
}
