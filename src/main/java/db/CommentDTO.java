package db;

import java.sql.Date;

public class CommentDTO {
	
	private String user_id;
	private String re_user_id;
	private String book_id;
	private String content;
	private Date writeday;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRe_user_id() {
		return re_user_id;
	}
	public void setRe_user_id(String re_user_id) {
		this.re_user_id = re_user_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteday() {
		return writeday;
	}
	public void setWriteday(Date writeday) {
		this.writeday = writeday;
	}
	
	
}
