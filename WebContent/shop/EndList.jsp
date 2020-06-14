<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------EndList.jsp");

int shopNo=Integer.parseInt((String)session.getAttribute("shopNo"));
//int shopNo=Integer.parseInt(request.getParameter("shopNo"));
System.out.println(request.getParameter("shopNo"));
OrderListDAO dao= OrderListDAO.getInstance();

List<OrderListDTO> orderList = dao.getListFinishToday(shopNo);
System.out.println(shopNo);
int EndListCount =orderList.size();
for(int i=0;i<EndListCount;i++){
	OrderListDTO dto =orderList.get(i);
%>

<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<strong><font size="10"><%=dto.getOrderDate()%></font></strong>
				<input type="hidden" value="<%=dto.getNo()%>">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 100px; padding: 0px;">
				<div class="count3" style="display: none;"><%=dto.getStatus() %></div>
			</div>
			<!-- 오른쪽-->
			
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 4개]</strong> &nbsp;<%=dto.getName() %>
					</div>
					<div class="w3-col">주문번호: <%=dto.getNo() %></div>
					<div class="w3-col">전화번호: <%=dto.getTel() %></div>
				</div>
				<div class="w3-row"><%=dto.getAddr() %> <%=dto.getAddr2() %></div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding"><%=dto.getMenu_String() %></div>
		</div>
		<!-- 하단 컨테이너 끝-->
	</div>
</div>
<%
}
%>