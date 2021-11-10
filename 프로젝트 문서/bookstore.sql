--사용자
create table USER(
	user_id varchar(30) primary key not null,
	user_pass varchar(30) not null,
	user_name varchar(20) not null,
	gender varchar(10) not null,
	birthday date not null,
	point int default 0 not null,
	addr varchar(100) not null,
	hp varchar(30) not null
);

--책
create table BOOK(
	book_id int primary key auto_increment,
	book_name varchar(30) not null,
	book_image varchar(30) not null,
	writer varchar(30) not null,
	content text not null,
	publisher varchar(30) not null,
	ea int not null,
	book_price int not null,
	chapter text not null,
	accum int not null,
	year date not null
);

--주문
create table ORDERED(
	order_id int auto_increment not null,
	user_id varchar(30) not null,
	book_id int not null,
	recipient varchar(20) not null,
	location varchar(100) not null,
	book_price int not null, --합계
	pay_day date not null,
	ea int not null,
	pay_method varchar(30),
	primary key(order_id, user_id, book_id),
	foreign key(user_id) references USER(user_id) on delete cascade on update cascade,
	foreign key(book_id) references BOOK(book_id) on delete cascade on update cascade
);

--장바구니
create table CART(
	user_id varchar(30) not null,
	book_id int not null,
	ea int not null,
	primary key(user_id, book_id),
	foreign key(user_id) references USER(user_id) on delete cascade on update cascade,
	foreign key(book_id) references BOOK(book_id) on delete cascade on update cascade
);

--리뷰
create table REVIEW(
	user_id varchar(30) not null,
	book_id int not null,
	rating double not null,
	writeday date not null,
	content varchar(5000),
	primary key(user_id, book_id),
	foreign key(user_id) references USER(user_id) on delete cascade on update cascade,
	foreign key(book_id) references BOOK(book_id) on delete cascade on update cascade
);

--댓글
create table COMMENT(
	comment_num int auto_increment not null,
	user_id varchar(30) not null,
	re_user_id varchar(30) not null,
	book_id int not null,
	content varchar(5000) not null,
	writeday date not null,
	primary key(comment_num, user_id, re_user_id, book_id),
	foreign key(user_id) references USER(user_id) on delete cascade on update cascade,
	foreign key(re_user_id) references REVIEW(user_id) on delete cascade on update cascade,
	foreign key(book_id) references BOOK(book_id) on delete cascade on update cascade
);


--추천
create table HEART(
	like_user_id varchar(30) not null,
	re_user_id varchar(30) not null,
	book_id int not null,
	primary key(like_user_id, re_user_id, book_id),
	foreign key(like_user_id) references USER(user_id) on delete cascade on update cascade,
	foreign key(re_user_id) references REVIEW(user_id) on delete cascade on update cascade,
	foreign key(book_id) references REVIEW(book_id) on delete cascade on update cascade
);