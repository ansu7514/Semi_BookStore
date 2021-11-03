package db;

import java.sql.Date;

public class OrderDTO {

	private String order_id;
	private String user_id;
	private String book_id;
	private String recipient;
	private String location;
	private Date payDay;
	private int ea;
	private String pay_method;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getRecipent() {
		return recipient;
	}
	public void setRecipent(String recipient) {
		this.recipient = recipient;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getPayDay() {
		return payDay;
	}
	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	
}
