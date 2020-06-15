<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CancelList.jsp");

Object no=session.getAttribute("no");
int shopNo=Integer.parseInt(no+""); 
System.out.println(request.getParameter("shopNo"));
OrderListDAO dao= OrderListDAO.getInstance();

List<OrderListDTO> orderList = dao.getListOfCancel(shopNo);
System.out.println(shopNo);
int CancelListCount =orderList.size();
for(int i=0;i<CancelListCount;i++){
	OrderListDTO dto =orderList.get(i);
	int count=1;
	StringTokenizer str=new StringTokenizer(dto.getMenu_String(),"/",true);
	while(str.hasMoreTokens()){
		String data=str.nextToken();
		//System.out.println(data);
		if(data.equals("/")){ count++;}
		//System.out.println(count);
		
	}
%>

<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<strong><font size="6"><%=dto.getOrderDate()%></font></strong>
				<input type="hidden" value="<%=dto.getNo()%>">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 100px; padding: 0px;">
				<div class="count4" style="display: none;"><%=dto.getStatus() %></div>
			</div>
			<!-- 오른쪽-->
			
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 <%=count %>개]</strong> &nbsp;<%=dto.getName() %>
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