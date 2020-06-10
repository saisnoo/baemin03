<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------BaesongList.jsp");

System.out.println(request.getParameter("shopNo"));
int shopNo=Integer.parseInt(request.getParameter("shopNo"));
OrderListDAO dao= OrderListDAO.getInstance();

List<OrderListDTO> orderList = dao.getListOfGoing(shopNo);
System.out.println(shopNo);
int BaesongCount =orderList.size();
for(int i=0;i<BaesongCount;i++){
	OrderListDTO dto =orderList.get(i);
%>

							<div class="w3-section">
								<div class="w3-card w3-padding">
									<!-- 상단 컨테이너 끝 -->
									<div class="w3-row">
										<!-- 왼쪽 -->

										<div class="w3-col w3-container w3-left" style="width: 150px;">
											<%=dto.getOrderDate()%>
											<input type="hidden" value="<%=dto.getNo()%>">
										</div>
										
										<!-- 왼쪽 끝 -->

										<!-- 오른쪽-->
										<div class="w3-col w3-container w3-right"
											style="width: 100px; padding: 0px;">
											<button class="w3-button w3-orange w90 h100"
												onClick="cancelBtn(this)">주문취소</button>
											<div class="count2" style="display:none;"><%=dto.getStatus() %></div>
										</div>
										<!-- 오른쪽-->
										<!-- 가운데 -->
										<div class="w3-rest w3-container">
											<div class="w3-row">
												<div class="w3-col">
													<strong>[메뉴 4개]</strong> &nbsp;<%=dto.getName() %>
												</div>
												<div class="w3-col">주문번호 5번</div>
											</div>
											<div class="w3-row">서울시 구로구 구로5동 경영기술개발원</div>
										</div>
										<!-- 가운데 끝 -->
									</div>
									<!-- 상단 컨테이너 끝 -->
									<!-- 하단 컨테이너 -->
									<div>
										<div class="w3-row w3-padding">김치찌개 2 / 된장찌개 2 / 후라이드치킨
											2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 / 고등어자반 5김치찌개 2 /
											된장찌개 2 / 후라이드치킨 2 / 양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 /
											고등어자반 5</div>
										<div class="w3-row w3-padding">젓가락 두개 주세요</div>
									</div>
									<!-- 하단 컨테이너 끝-->
								</div>
							</div>
<%	
}//for end
%>

<script>
	// 스크립트
	function cancelBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
		document.getElementById("jumunCancel").style.display = "block";
	}
</script>