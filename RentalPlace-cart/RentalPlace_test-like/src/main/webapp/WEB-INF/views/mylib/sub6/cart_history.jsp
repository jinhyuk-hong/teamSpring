<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 >  장바구니</title>
<link rel="stylesheet" href="/resources/css/mylib/sub1/loan_history.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

	<div class="header">
    <jsp:include page="../../header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>장바구니</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li> 
                        <li>
                            <a href="/mylib/loan-history">나의도서관</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="../lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content" style="">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">
                            
                            <!-- 도서 수 -->
                            <div class="inline">
                                <form action="">
                                	
                                    <span style="margin-right: 10px;"> 장바구니 : 총 <b>${total }</b> 건</span>
                                    <select name="amount">
                                    	
	                                    <c:if test="${pageMaker.cri.amount == 10 }">
	                                    <option value="10" selected="selected">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 20 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20" selected="selected">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 30 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30" selected="selected">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 40 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40" selected="selected">40건씩 보기</option>
	                                    </c:if>
                                        
                                    </select>
                                    <input type="hidden" name="page" value="1">
                                    <button id="list_btn" class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                            	<c:if test="${not empty cart_history }">
                                <table>
                                    <thead>
                                        <tr>
                                        	<th style=""></th>
                                        	<th style="">책이미지</th>
                                            <th style="">도서명</th>
                                            <th style="">수량</th>
                                            <th style="width: 90px;">가격</th>
                                            <th style="width: 90px">출판사</th>
                                            <th style="width: 120px"></th>
	                                </tr>
                                    </thead>
                                    <tbody>
                                    
	                                    <c:forEach var="cart" items="${cart_history}">
										<tr>
											<td><input type="checkbox" /></td> 
											<td class="">
                                                <img src="${cart.book_cover }" style="width: 200px;">
                                            </td> 
											<td>${cart.book_title }</td> 
											 <td>${cart.bookCount} 
											<div>
											<button type="button" id="plus_btn" value="추가">+</button>
											<button type="button" id="minus_btn" value="감소">-</button>	
											<button class = "modify_btn" data-cartId="${cart.bookCount}"> 변경</button>
											</div>
											
											</td> 
											<td>${cart.priceStandard }원</td>
											<td>${cart.book_publisher }</td>
											<td>
												<button type="button" id="deleteBtn" value="삭제하기" data-cartid="${cart.cart_id }">삭제하기</button>
												<button type="button" id="addBagBtn" value="구매하기">구매하기</button>
											</td>
										</tr>
										</c:forEach>
	                                        
                                    </tbody>
                                </table>
                                
                                <br>
                                
                                <div class="pageInfo" style="">
	
									<c:if test="${pageMaker.prev }">
										<a class="not" href="${pageMaker.startPage - 1}">이전</a>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
										<a class="${pageMaker.cri.page == num ? "current":"not" }" href="${num }"><span>${num }</span></a>
									</c:forEach>
									
									<c:if test="${pageMaker.next }">
										<a class="not" href="${pageMaker.endPage + 1}">다음</a>
									</c:if>
								</div>
								</c:if>
								
                            </div>
                            <form action="/cart/update" method="post" class="quantity_update_form">
							<input type="hidden" name="cartId" class="update_cartId">
							<input type="hidden" name="bookCount" class="update_bookCount">
							<input type="hidden" name="memberId" value="${member.userId}">
							</form>
							<form action="/cart/delete" method="post" class="quantity_delete_form">
								<input type="hidden" name="cartId" class="delete_cartId">
								<input type="hidden" name="memberId" value="${member.userId}">
							</form>
                        </div>
						<br>
                        <c:if test="${empty cart_history }">
							<h2>장바구니가 비었습니다.</h2>
						</c:if>
                    </div>

                </div>
				
			</form>
            </div>
        </div>
    </div>
    
    <form method="get" class="moveForm"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
	</form>
    
    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>


	<script>
		
		$(function() {
			$(".sub1").addClass("active");
			$(".submenu1").addClass("active");
			
			let moveForm = $(".moveForm");
			
			//pageInfo의 a태그를 누르면 a태그의 href 속성을 가져와서 moveForm의 page에 넣고 moveForm이 submit됨
			$(".pageInfo a").on("click", function(e) {
				e.preventDefault();
				moveForm.find("input[name = 'page']").val($(this).attr("href"));
				moveForm.submit();
			});
			
			$(".plus_btn").on("click", function(){
				let quantity = $(this).parent("div").find("input").val();
				$(this).parent("div").find("input").val(++quantity);
			});
			$(".minus_btn").on("click", function(){
				let quantity = $(this).parent("div").find("input").val();
				if(quantity > 1){
					$(this).parent("div").find("input").val(--quantity);		
				}
			});
			$(".quantity_modify_btn").on("click", function(){
				let cart_id = $(this).data("cart_id");
				let bookCount = $(this).parent("td").find("input").val();
				$(".update_cartId").val(cart_id);
				$(".update_bookCount").val(bookCount);
				$(".quantity_update_form").submit();
				
			});
			$(".delete_btn").on("click", function(e){
				e.preventDefault();
				const cart_id = $(this).data("cart_id");
				$(".delete_cart_id").val(cart_id);
				$(".quantity_delete_form").submit();
			});
			 
		});
		
	</script>	


</body>
</html>