<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.baemin.orderlist.cart.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.baemin.orderlist.*" %>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------BaesongList.jsp");
//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
Object no=session.getAttribute("no");
	 int shop_No=Integer.parseInt(no+""); 
System.out.println(shop_No);
OrderListDAO orderListDAO = OrderListDAO.getInstance();
List<OrderListDTO> list = orderListDAO.getListOfGoing(shop_No);
%>
<%

for(int i=0;i<list.size();i++)
{	
	OrderListDTO orderListDTO=list.get(i);

	
	%>
	    <!-- load  new order  -->
	<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 끝 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<h1><big><strong><%=orderListDTO.getOrderDate()%></strong></big></h1>
				<input type="hidden" value="<%=orderListDTO.getNo()%>">
				<input type="hidden" id="shop_No" value="<%=shop_No %>">
				<input type="hidden" id="orderdate" value="<%=orderListDTO.getOrderDate() %>">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 200px; padding: 0px;">
			
				<button class="w3-button w3-yellow h100"  onClick="cancelBtn2(this)" data-toggle="modal" data-target="#jumoon_cancel1">주문취소</button>
				<div class="count2" style="display:none;"><%=orderListDTO.getStatus() %></div>
			</div>
			<!-- 오른쪽-->
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 4개]</strong> &nbsp;<%=orderListDTO.getName()%>
					</div>
					<div class="w3-col"></div>
				</div>
				<div class="w3-row"><%=orderListDTO.getAddr() +"  "+ orderListDTO.getAddr2() %></div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding"><%=orderListDTO.getMenu_String() %></div>
			<div class="w3-row w3-padding"><%=orderListDTO.getComment() %></div>
		</div>
		<!-- 하단 컨테이너 끝-->
	</div>
</div>
<!-- 접수대기 리스트 끝 -->
<%
	}//for end
%>


<script>
	// 스크립트
console.log("------BaesongList.jsp");
	function jumunBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
	
	}
	function baesongBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
	}
	function cancelBtn2(e) {
		var orderList_No = e.parentNode.parentNode.children[0].children[1].value;
		var shop_No = e.parentNode.parentNode.children[0].children[2].value;
		var getOrderDate = e.parentNode.parentNode.children[0].children[3].value;
		document.getElementById("order_no2").value = orderList_No;
			console.log(shop_No + "/"+orderList_No);
	} 
	
</script>
 
                  