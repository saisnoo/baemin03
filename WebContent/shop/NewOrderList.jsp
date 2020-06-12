<%@page import="com.baemin.orderlist.cart.Order2Cart"%>
<%@page import="com.baemin.orderlist.cart.CartDTO"%>
<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NewOrderList.jsp");

System.out.println(request.getParameter("shopNo"));
int shopNo=Integer.parseInt(request.getParameter("shopNo"));
OrderListDAO dao= OrderListDAO.getInstance();

List<OrderListDTO> orderList = dao.getListOfCurrent(shopNo);
System.out.println(shopNo);
CartDTO cart = new CartDTO();

int NewOrderCount =orderList.size();
for(int i=0;i<NewOrderCount;i++){
	OrderListDTO dto =orderList.get(i);
	String MenuList="";
	MenuList=Order2Cart.toMsg(dto.getOrderList());
%>

<!-- 접수대기 리스트 -->
<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 끝 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<div><%=dto.getOrderDate()%></div>
				<input type="hidden" value="<%=dto.getNo()%>">
				<input id="shopNo" type="hidden" value="<%=dto.getShop_NO()%>">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 200px; padding: 0px;">
				<%
					if(dto.getStatus()==0){
				%>
				<button class="w3-button w3-blue h100" onclick="CookBtn(this)">주문접수<br>조리시작</button>
				<div class="count0" style="display:none;"><%=dto.getStatus() %></div>
				<%
					}else if(dto.getStatus()==1){
				%>
				<button class="w3-button w3-blue h100" onclick="baesongBtn(this)">배달출발</button>
				<div class="count1" style="display:none;"><%=dto.getStatus() %></div>
				<%
					}
				%>
				<button class="w3-button w3-yellow h100" onClick="cancelBtn(this)">주문취소</button>
			</div>
			<!-- 오른쪽-->
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 4개]</strong> &nbsp;<%=dto.getName()%>
					</div>
					<div class="w3-col">주문번호: <%=dto.getNo() %></div>
				</div>
				<div class="w3-row"><%=dto.getAddr() %> <%=dto.getAddr2() %> </div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding">
			<%=MenuList%>
			</div>
			<div class="w3-row w3-padding"><%=dto.getComment() %></div>
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

	function baesongBtn(e) {
		var jumunNo = e.parentNode.parentNode.children[0].children[1].value;
		console.log(jumunNo);
		document.getElementById("jumunNo").innerText = jumunNo;
		$.ajax({
			type: "post",
			url : "BaesongSelect.jsp",
			data: {"no" : jumunNo},
			success : function(result){
				console.log(result);
				if(result==1){
					alert("배달시작");
				}else{
					alert("조리X");
				}//else
			}//success
		});//ajax
		refresh(); // 새로고침
	}//CookBtn

</script>