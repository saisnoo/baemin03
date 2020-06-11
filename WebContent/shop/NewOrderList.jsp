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
int NewOrderCount =orderList.size();
for(int i=0;i<NewOrderCount;i++){
	OrderListDTO dto =orderList.get(i);
%>

<!-- 접수대기 리스트 -->
<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 끝 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<%=dto.getOrderDate()%>
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
				<button class="w3-button w3-blue h100" onclick="CookBtn(this)">조리버튼</button>
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
			<div class="w3-row w3-padding">김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 /
				양념치킨 반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 / 고등어자반 5김치찌개 2 / 된장찌개 2김치찌개 2
				/ 된장찌개 2 / 후라이드치킨2 / 양념치킨 반마리 1 된장찌개 2</div>
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

	function CookBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
		//모달창에 값넣기
		document.getElementById("jumunSiganNo").value = a1;
		var sid = document.getElementById("shopNo").value;
		//모달창띄우기
		document.getElementById("jumunReady").style.display = "block";
		
		$.ajax({
			type: "post",
			url : "CheckOrderPro.jsp",
			data: "shopNo="+sid,
			success : function(result){
				console.log(result);
				if(result==1){
					alert("조리O");
				}else{
					alert("조리X");
				}//else
			}//success
		});//ajax
	}
	function baesongBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
		
		$.ajax({
			type: "post",
			url : "BaesongSelect.jsp",
			data: {
				"shopNo" : shopNo,
				"minute" : minute
			},
			success : function(result){
				console.log(result);
				if(result==1){
					
				}else{
					
				}//else
			}//success
		});//ajax
	}
	function cancelBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
		document.getElementById("jumunCancel").style.display = "block";
	}
</script>