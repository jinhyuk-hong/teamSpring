<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 개인정보 > 마이페이지</title>
<link rel="stylesheet" href="/resources/css/mylib/sub5/mypage.css">
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
                    <h3>마이페이지</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif"> 
                            </a>
                        </li>
                        <li>
                            <a href="/mylib/loan-history">나의도서관</a>
                        </li>
                        <li>
                            <a href="/mylib/mypage">개인정보</a> 
                        </li>
                        <li>
                            <a href="/mylib/mypage">마이페이지</a>
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
                <div class="content">

                    <form id="join_form" method="POST" onsubmit="return false;">

                        <table>
                            <!-- ID -->
                            <tr>
                                <th class="first">
                                    아이디
                                </th>
                                <td class="last">
                                    <input class="id_input" autocomplete="off" name="user_id" value="${my.user_id }" readonly>
                                    <br>
                                </td>
                            </tr>

                            <!-- name -->
                            <tr>
                                <th class="first">
                                    이름
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="박준모" value="${my.user_name }"
                                        readonly> <br>
                                </td>
                            </tr>

                            <!-- BHD -->
                            <tr>
                                <th class="first">
                                    생년월일
                                </th>
                                <td class="last">
                                    <input type="text" class="birth_input" style="width: 169px;" name="user_birth"
                                        value="${my.user_birth }" readonly>
                                    <br>
                                </td>
                            </tr>

                            <!-- tel -->
                            <tr>
                                <th class="first">
                                    전화번호
                                </th>
                                <td class="last">
                                    <input class="phone_input" autocomplete="off" maxlength="11" name="user_tel"
                                        value="${my.user_tel}" readonly> <br>
                                </td>
                            </tr>


                            <!-- email -->
                            <tr>
                                <th class="first">
                                    이메일
                                </th>
                                <td class="last">
                                    <input class="mail_input" style="width: 50%;" autocomplete="off" name="user_email"
                                        value="${my.user_email }" readonly>
                                </td>
                            </tr>

                            <!-- add -->
                            <tr>
                                <th class="first">
                                    주소
                                </th>
                                <td class="last">
                                    <div>
                                        <p>
                                            <input class="address_input_1" style="width: 80px;" title="우편번호"
                                                readonly="readonly" autocomplete="off" name="user_zip"
                                                value="${my.user_zip }">
                                        </p>
                                        <p>
                                            <input class="address_input_2" style="width: 80%; margin-bottom: 5px;"
                                                readonly="readonly" autocomplete="off" name="user_address"
                                                value="${my.user_address }">
                                            <input class="address_input_3" style="width: 80%; margin-bottom: 3px;"
                                                autocomplete="off" name="user_address_detail"
                                                value="${my.user_address_detail }" readonly> <br>
                                        </p>
                                    </div>
                                </td>
                            </tr>
							<!-- able_loan -->
                            <tr>
                                <th class="first">
                                    대출 가능 도서 수
                                </th>
                                <td class="last">
                                
									<input class="able_loan_input" autocomplete="off" name="user_able_loan"
                                    value="${my.user_able_loan }권" readonly> <br>
                                    
                                </td>
                            </tr>
                            <!-- book_count -->
                            <tr>
                                <th class="first">
                                    대출 중 도서 수
                                </th>
                                <td class="last">

                                    <input class="book_count_input" autocomplete="off" name="user_book_count" 
                                    value="${my.user_book_count }권" readonly> <br>

                                </td>
                            </tr>

                            <!-- overdue_date -->
                            <tr>
                                <th class="first">
                                    대출불가
                                </th>
                                <td class="last">
									<c:if test="${my.user_overdue_date == 0 }">
									<input class="overdue_input" autocomplete="off" name="user_overdue_date"
                                    value="대출가능" readonly> <br>
									</c:if>
									
									<c:if test="${my.user_overdue_date != 0 }">
									<input class="overdue_input" autocomplete="off" name="user_overdue_date"
                                    value="${my.user_overdue_date }일" readonly> <br>
									</c:if>
                                </td>
                            </tr>

                            <!-- reg_date -->
                            <tr>
                                <th class="first">
                                    회원가입일
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="user_name" value="${my.user_reg_date }"
                                        readonly> <br>
                                </td>
                            </tr>

                        </table>
                    </form>

                    <br>

                    <div class="member_modify_wrap">
                        <form action="/mylib/modify" method="get">
                            <button class="btn">수정</button>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>

    <script>
        $(function () {
            $(".sub5").addClass("active");
            $(".submenu3").addClass("active");

        })
    </script>

</body>

</html>