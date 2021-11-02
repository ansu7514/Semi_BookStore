package db;

import java.sql.Blob;
import java.sql.Date;

public class BookDTO {
	
	private String book_id;
	private String book_name;
	private Blob book_image;
	private String writer;
	private String content;
	private String publisher;
	private Date year;
	private int ea;
	private int book_price;
	private String chapter;
	private int accum; // 누적판매량
	
	//개별 저장을 위한 디폴트 생성자
	public BookDTO() {}
	
	//한번에 저장하기 위한 생성자
	public BookDTO(String book_id, String book_name, Blob book_image, String writer, String content, String publisher,
			Date year, int ea, int book_price, String chapter, int accum) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_image = book_image;
		this.writer = writer;
		this.content = content;
		this.publisher = publisher;
		this.year = year;
		this.ea = ea;
		this.book_price = book_price;
		this.chapter = chapter;
		this.accum = accum;
	}
	
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public Blob getBook_image() {
		return book_image;
	}
	public void setBook_image(Blob book_image) {
		this.book_image = book_image;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public int getAccum() {
		return accum;
	}
	public void setAccum(int accum) {
		this.accum = accum;
	}
	
	
}
