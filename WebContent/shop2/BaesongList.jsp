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
int shop_No=Integer.parseInt((String)session.getAttribute("shop_No"));
System.out.println(shop_No);
OrderListDAO orderListDAO = OrderListDAO.getInstance();
List<OrderListDTO> list = orderListDAO.getListOfGoing(shop_No);
CartDTO cartDTO=new CartDTO();
%>
<%

for(int i=0;i<list.size();i++)
{	
	OrderListDTO orderListDTO=list.get(i);
	String k="";
	k=Order2Cart.toMsg(orderListDTO.getOrderList());
	
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

			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 200px; padding: 0px;">
			
				<button class="w3-button w3-yellow h100"  onClick="cancelBtn(this)" data-toggle="modal" data-target="#jumoon_calcel">주문취소</button>
				<div class="count2" style="display:none;"><%=orderListDTO.getStatus() %></div>
			</div>
			<!-- 오른쪽-->
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 4개]</strong> &nbsp;<%=orderListDTO.getName()%>
					</div>
					<div class="w3-col">주문번호 5번</div>
				</div>
				<div class="w3-row"><%=orderListDTO.getAddr() +"  "+ orderListDTO.getAddr2() %></div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding"><%=k %></div>
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

	function jumunBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
	
	}
	function baesongBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
	}
	function cancelBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[0].value;
		console.log(a1);
		
	}
</script>
 
                  
                         <!--       load  new order 
                           load  new order 
                            <div class="w3-section">
                                <div class="w3-card w3-padding">
                                    <div class="w3-row">
                                        <div class="w3-col w3-container w3-left" style="width: 100px;">
                                            <h2>13:22</h2>
                                        </div>
                                        <div class="w3-col w3-container w3-right" style="width: 200px; padding: 0px;">
                                            <button class="w3-button w3-yellow h100" data-toggle="modal" data-target="#jumoon_calcel">주문취소
                                            </button>
                                        </div>
                                        <div class="w3-rest w3-container">
                                            <strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br/>
                                            	서울 구로구 구로동 구로빌딩 254-14 402호
                                            <hr/>
					                                            김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨
					                                            반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 /
					                                            고등어자반 5
                                        </div>
                                    </div>
                                </div>
                            </div>		
 -->