package db;

import java.sql.Date;

public class ReviewDTO {
	private String user_id;
	private String book_id;
	private double rating;
	private Date wrtieday;
	private String content;
	
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
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Date getWrtieday() {
		return wrtieday;
	}
	public void setWrtieday(Date wrtieday) {
		this.wrtieday = wrtieday;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
