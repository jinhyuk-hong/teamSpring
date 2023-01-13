package com.library.model.mylib;

import lombok.Data;

@Data
public class CartDTO {
	// 검색된 도서 수
	private int total;

	// 대출 중 도서 수
	private int count;

	// 대출 베스트 도서 총 대출 수
	private int total_count;

	// 장바구니 번호
	private int cartId;

	// 대출자 아이디
	private String user_id;

	// 대출자 이메일
	private String user_email;

	// 대출 도서 명
	private String book_title;

	// 대출 도서 저자
	private String book_author;

	// 대출 도서 isbn
	private String book_isbn;

	// 대출 도서 표지 링크
	private String book_cover;

	// 대출 도서 출간일
	private String book_pubDate;

	// 대출 도서 출판사
	private String book_publisher;

	// 장바구니 담긴 일
	private String regDate;

	

	// 도서 가격(AladinAPI에서 받아올 때)
	private int priceStandard;
	
	// 도서
	private String description;
	
	private int produceId;
	
	private int cart_qty;

	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", user_id=" + user_id + ", regDate=" + regDate + ", produceID="
				+ produceId + ", cart_qty=" + cart_qty + "]";
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartDTO other = (CartDTO) obj;
		if (cartId != other.cartId)
			return false;
		return true;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartId;
		return result;
	}
	
	
}
