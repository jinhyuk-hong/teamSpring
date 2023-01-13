package com.library.controller.mylib;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.member.MemberDTO;
import com.library.model.mylib.CartDTO;
import com.library.page.Criteria;
import com.library.service.mylib.CartService;
import com.library.service.search.AladinApi;

@Controller
@RequestMapping("/search")
public class CartController {

	@Autowired
	private AladinApi api;
	@Autowired
	private CartService service;

	
	//============================== 찜하기 추가 ==========================================
	// 대출자 상태 체크
		@ResponseBody
	@PostMapping("/cart")
	public String cart(Model model, Criteria cri, CartDTO book, @RequestParam String detail, Principal principal) {

		// 로그인 된 user_id 받아오기
		String id = principal.getName();

		// id 세팅
		book.setUser_id(id);

		System.out.println("\n======================== 찜하기 ========================");
		System.out.println("아이디 : " + book.getUser_id());
		System.out.println("찜한 책 제목 : " + book.getBook_title());
		System.out.println("찜한 책 ISBN : " + book.getBook_isbn());
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("========================================================\n");

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/search/book";
		}
		
		// 대출
		service.cart(book); //insert into loan_history

		if (detail.equals("true")) {

			return "redirect:/search/best-book-detail?book_isbn=" + book.getBook_isbn();

		} else {
			return "redirect:/search/book-detail?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&type="
					+ cri.getType() + "&keyword=" + keyword + "&book_isbn=" + book.getBook_isbn();
		}

	}
	

public @ResponseBody String addGoodsInCart(@PathVariable("productId") int productId, HttpSession session) {
		
		MemberDTO vo = (MemberDTO) session.getAttribute("login");
		String userid = vo.getUser_id();
		/* 로그인 되어있는 정보를 이용해서 userid를 가져온다 */
		CartDTO cartDTO = new CartDTO();
		/* cart객체를 생성하고*/
		cartDTO.setUser_id(userid);
		cartDTO.setProduceId(productId);
		/* 객체 안에 userid와 productId를 set해준다 */

		boolean istAlreadyExisted = service.findCartGoods(cartDTO);
        /* 이미 해당 상품이 카트에 존재하는지 여부를 판별해주는 메서드 */
		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
		
		if (istAlreadyExisted) {
			return "already_existed";
            /* 만약 이미 카트에 저장되어있다면, already_existed를 리턴 */
		} else {
			service.addGoodsInCart(cartDTO);
			return "add_success";
             /* 카트에 없으면 카트에 저장 후, add_success를 리턴  */
		}

	}

}
