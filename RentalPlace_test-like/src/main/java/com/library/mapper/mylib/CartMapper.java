package com.library.mapper.mylib;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.mylib.CartDTO;

import com.library.model.search.DateDTO;
import com.library.page.Criteria;

public interface CartMapper {

	public void cart(CartDTO dto);

	// 대출 중인 해당 도서 수 카운트
	public int count(String isbn);

	// 대출 베스트 출력
	public List<CartDTO> book_rank(DateDTO date);

	// 대출자 상태 체크
	public int statusCheck(String user_id);

	// 대출자 대출 수 증가
	public void increase_count(String user_id);

	// 회원이 대출 중인 도서인지 체크
	public int loan_check(@Param("user_id")String user_id, @Param("book_isbn")String book_isbn);
	
}
