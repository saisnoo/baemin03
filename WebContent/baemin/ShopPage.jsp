<%@page import="java.util.*"%>
<%@page import="com.baemin.review.*"%>
<%@page import="com.baemin.menu.*"%>
<%@page import="com.baemin.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 태그를 이용해서 제어문 처리하도록 하는 설정 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="customtag" tagdir="/WEB-INF/tags"%>


<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ ShopPage.jsp --- ");

	int no = 0;
	String no_ = request.getParameter("shopNo");
	//response.sendRedirect("../index.html");
	System.out.println("no_ "+no_);
	
	no = Integer.parseInt((no_+"").trim());
	System.out.println("no "+no);
	
	
	ShopDAO shopdao = ShopDAO.getInstance();
	ShopDTO shopdto = shopdao.getShopInfo(no);
	
	MenuDAO menudao = MenuDAO.getInstance();
	List<MenuDTO> menu_list = menudao.getListByShopActive(no);
	System.out.println("menu_list.size="+menu_list.size());
	request.setAttribute("menuList",menu_list); 
	
	ReviewDAO reviewdao = ReviewDAO.getInstance();
	List<ReviewDTO> review_list = reviewdao.getListByShop(no, 10);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>ShopPage.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">

<style>
* {
	margin: 0px;
	padding: 0px;
}

.clickedBtn {
	background: #45c1bf;
	font-weight: 500;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<!-- 3 main content start here!!!----------------------------------------------------------- -->
			<div class="w3-card-4 w3-center w3-margin w3-round-large">
				<p>&nbsp;</p>
				<h2>
					<strong><%=shopdto.getShopName()%></strong>
					<div id="shop_No" style="display: none"><%=shopdto.getNo()%></div>
				</h2>

				<div class="sw-center" style="text-align: center;">
					<div class="w3-row w3-center">

						<div class="w3-col s2">&nbsp;</div>

						<!-- ............................................................... -->
						<div class="w3-col s8">
							<customtag:starRank rank="<%=shopdto.getRank()%>" width="210" />
						</div>
						<!-- ............................................................... -->

						<div class="w3-col s2 w3-cell w3-cell-middle w3-right"
							style="padding: 16px;">
							<strong><%=shopdto.getRank()%></strong>
						</div>
					</div>
				</div>


				<input type="hidden" name="x1" id="x1" value="좌표값이들어가는데hidden 예정">
				<input type="hidden" name="y1" id="y1" value="좌표값이들어가는데hidden 예정">
				<br>
			</div>

		</div>
		<div class="sw-container-500">
			<!-- 3 main content start here!!!----------------------------------------------------------- -->

			<script>
				window.onload = function() {
					btn1click();
				}

				function btn1click() {
					tab1.style.display = "block";
					tab2.style.display = "none";
					tab3.style.display = "none";
					btn1.className = "w3-button w3-block clickedBtn";
					btn2.className = "w3-button w3-block";
					btn3.className = "w3-button w3-block";
					// TODO :  ajax load
				}

				function btn2click() {
					tab1.style.display = "none";
					tab2.style.display = "block";
					tab3.style.display = "none";
					btn1.className = "w3-button w3-block";
					btn2.className = "w3-button w3-block clickedBtn";
					btn3.className = "w3-button w3-block";
					// TODO :  ajax load
				}

				function btn3click() {
					tab1.style.display = "none";
					tab2.style.display = "none";
					tab3.style.display = "block";
					btn1.className = "w3-button w3-block";
					btn2.className = "w3-button w3-block";
					btn3.className = "w3-button w3-block clickedBtn";
					// TODO :  ajax load
				}
			</script>

			<div class="w3-border">
				<div class="w3-row">
					<div class="w3-col s4 w3-center">
						<!-- ................................... -->
						<button type="button" id="btn1" onclick="btn1click()"
							class="w3-button w3-block">메뉴</button>
					</div>
					<div class="w3-col s4 w3-center">
						<!-- ................................... -->
						<button type="button" id="btn2" onclick="btn2click()"
							class="w3-button w3-block">정보</button>
					</div>
					<div class="w3-col s4 w3-center">
						<!-- ................................... -->
						<button type="button" id="btn3" onclick="btn3click()"
							class="w3-button w3-block">리뷰</button>
					</div>
				</div>
				<div id="tab1" class="w3-row" style="display: none;">
					<div class="w3-container w3-border-bottom w3-border-top w3-padding"
						style="background-color: #EAEAEA;">
						<p>
							<b>메뉴 소개</b>
						</p>
					</div>

					<!-- 반복의 시작 ---------------------------------------------->
					<c:forEach items="${ menuList }" var="menudto">
						<div class="w3-row-padding w3-border-bottom w3-margin-top">
							<div class="w3-col w3-right w3-padding" style="width: 60px;">
								<button onclick="addCart(this)" type="button" class="w3-button"
									style="height: 100%">+</button>
							</div>
							<div class="w3-rest" style="padding-left: 10px;">
								<input type="hidden" value="${menudto.no}" />
								<div>${menudto.menuName }</div>
								<div class="w3-small w3-text-gray">${menudto.menuEx }</div>
								<div>${menudto.menuPrice }원</div>
							</div>
						</div>
					</c:forEach>
					<!-- 반복의 끝 ------------------------------------------------->

					<script>
						function addCart(e) {
							console.log(e);
							var select_no = e.parentNode.parentNode.children[1].children[0].value;
							console.log(select_no);
							var shop_No = document.getElementById("shop_No").innerText;

							// form data >>  JSON 
							var data = {
								// 항목이름 : 값(변수)
								shop_No : shop_No,
								menu_No : select_no,
								count : 1
							}
							// ajax +  post >> to SERVER
							$.ajax({
								type : "post",
								url : "AddCartPro.jsp",
								//dateType : "json",
								//contentType : "application/json; charset=utf-8",
								data : data,
								success : function(result) {
									//alert("성공적으로 댓글 등록이 되었습니다.");
									console.log("success");
									console.log(result);
									//console.log(status);
								},
								error : function(data) {
									//alert("댓글을 등록하는 중 오류가 발생되었습니다.");
									console.log("error");
									console.log(data);
								}
							});
						}
					</script>
				</div>
				<!-- tab 1 end------------------------------------------------ -->


				<div id="tab2" class="w3-row" style="display: none;">
					<div class="w3-container w3-border-bottom w3-border-top w3-padding"
						style="background-color: #EAEAEA;">
						<p>
							<b>가게 소개</b>
						</p>
					</div>
					<div class="w3-panel">
						<p>
							<%=shopdto.getShopEx()%>
						</p>
					</div>
					<div class="w3-container w3-border-bottom w3-border-top w3-padding"
						style="background-color: #EAEAEA;">
						<p>
							<b>가게 주소</b>
						</p>
					</div>
					<div class="w3-panel">
						<p>
							<%=shopdto.getShopAddr()%>
							&nbsp;
							<%=shopdto.getShopAddr2()%>
						</p>
					</div>
					<div class="w3-container w3-border-bottom w3-border-top w3-padding"
						style="background-color: #EAEAEA;">
						<p>
							<b>가게 전화번호</b>
						</p>
					</div>
					<div class="w3-panel">
						<p>
							<%=shopdto.getShopTel()%></p>
					</div>
				</div>
				<!-- tab 2 end------------------------------------------------ -->

				<div id="tab3" class="w3-row" style="display: none;">
					<div class="w3-container w3-border-bottom w3-border-top w3-padding"
						style="background-color: #EAEAEA;">
						<p>
							<b>리뷰/평점</b>
						</p>
					</div>

					<div class="w3-container w3-border-bottom" style="margin-top: 5px;">
						<div class="w3-row w3-center" style="margin-top: 5px;">
							<!-- --------------------------------------------------------------- -->
							<i class="material-icons star" onclick="star_click(0)"
								style="font-size: 36px; color: #eaeaea;">star</i>
							<!-- --------------------------------------------------------------- -->
							<i class="material-icons star" onclick="star_click(1)"
								style="font-size: 36px; color: #eaeaea;">star</i>
							<!-- --------------------------------------------------------------- -->
							<i class="material-icons star" onclick="star_click(2)"
								style="font-size: 36px; color: #eaeaea;">star</i>
							<!-- --------------------------------------------------------------- -->
							<i class="material-icons star" onclick="star_click(3)"
								style="font-size: 36px; color: #eaeaea;">star</i>
							<!-- --------------------------------------------------------------- -->
							<i class="material-icons star" onclick="star_click(4)"
								style="font-size: 36px; color: #eaeaea;">star</i>
							<!-- --------------------------------------------------------------- -->
						</div>

						<script>
							function star_click(e) {
								console.log("star " + e + "  click!!!");

								var rank = e + 1;
								document.getElementById("bbb").innerText = rank;

								for (var i = 0; i < 5; i++) {

									if (i <= e) {
										document.getElementsByClassName("star")[i].style.color = "#ffbb00";
									} else {
										document.getElementsByClassName("star")[i].style.color = "#eaeaea";
									}
								}

							}
						</script>
						<div class=" w3-row" style="margin-top: 5px;">
							<div class="w3-col w3-right"
								style="width: 10%; margin-right: 3%; margin-left: 2%; margin-top: 3%;">
								<input type="button"
									class="w3-btn w3-border w3-round-large w3-large"
									style="background-color: white;" value="등록">
							</div>

							<div class="w3-rest">
								<textarea rows="3" style="width: 100%; resize: none"
									id="content"></textarea>
							</div>
						</div>
						<input type="hidden" id="bbb" />
					</div>

					<%
						for (int i = 0; i < review_list.size(); i++) {
							ReviewDTO reviewDTO = review_list.get(i);
					%>
					<div class="w3-row w3-section">
						<div class="w3-col" style="margin-left: 2%;">
							<label>익명의 사용자</label><br>
							<customtag:starRank rank="<%=(double) reviewDTO.getRank()%>"
								width="105" />

							<label style="font-size: 12px;"><%=reviewDTO.getRegDate()%></label>
						</div>
						<div class="w3-container">
							<p style="margin-top: 5px;">
								<%=reviewDTO.getContent()%>
							</p>
						</div>
					</div>
					<%
						}
					%>



				</div>
				<!-- tab 3 end------------------------------------------------ -->
			</div>
		</div>

	</div>




	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />





</body>
</html>