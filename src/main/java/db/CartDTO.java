package db;

public class CartDTO {

	private String user_id;
	private String book_id;
	private String book_name;
	private int book_price;
	private int ea;

	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public CartDTO(String user_id, String book_id) {
		this.user_id = user_id;
		this.book_id = book_id;
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
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	
	
}
