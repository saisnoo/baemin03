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
			
				<button class="w3-button w3-yellow h100"  onClick="cancelBtn2(this)" data-toggle="modal" data-target="#jumoon_calcel">주문취소</button>
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
	/* 	var 시 = Math.floor((간격 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var 분 = Math.floor((간격 % (1000 * 60 * 60)) / (1000 * 60));
		var 초 = Math.floor((간격 % (1000 * 60)) / 1000);

		console.log( 시 +"시간 "+ 분 +"분 "+ 초 +"초" ); */
		
		 $("#jumoon_calcel_btn").click(function(){
			 var whyCancel = $(":input:radio[name=whyCancel]:checked").val();
			
			 
			 var data={
					//항목이름: 값(변수)
				//	no:no,
					//rno:rno,
				
					orderList_No:orderList_No,
					whyCancel:whyCancel
			}
			//alert(JSON.stringify(reply));
			//ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기.
			$.ajax({
				type : "post",
				url : "CancelOrderPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("취소접수 완료");
				},
				error : function(xhr,status,error){
					console.log("취소접수 실패");
				}//error의 끝
				
			});//ajax의 끝*/
		}); 
		
		
		
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