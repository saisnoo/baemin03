<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.baemin.orderlist.cart.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.baemin.orderlist.*" %>

 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NewOrderList.jsp");
//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	Object no=session.getAttribute("no");
	 int shop_No=Integer.parseInt(no+""); 
System.out.println(shop_No+shop_No);
OrderListDAO orderListDAO = OrderListDAO.getInstance();
List<OrderListDTO> list = orderListDAO.getListOfCurrent(shop_No);

%>
<script type="text/javascript">
console.log("------NewOrderList.jsp----");
</script>
<%

for(int i=0;i<list.size();i++)
{	
	OrderListDTO orderListDTO=list.get(i);
	int count=1;
	StringTokenizer str=new StringTokenizer(orderListDTO.getMenu_String(),"/",true);
	while(str.hasMoreTokens()){
		String data=str.nextToken();
		System.out.println(data);
		if(data.equals("/")){ count++;}
		System.out.println(count);
		
	}
		System.out.println("메뉴하나 완료");
	
	%>
	    <!-- load  new order  -->
	<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 끝 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<h1><%=orderListDTO.getOrderDate()%></h1>
				<input type="hidden" id="orderList_No" name="orderList_No" value="<%=orderListDTO.getNo()%>">
				<input type="hidden" id="shop_No" value="<%=shop_No %>">
				<input type="hidden" id="orderdate" value="<%=orderListDTO.getOrderDate() %>">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 200px; padding: 0px;">
				<%
					if(orderListDTO.getStatus()==0){
				%>
				<button class="w3-button w3-blue h100"  onclick="jumunBtn(this)" data-toggle="modal" data-target="#take_over">조리버튼</button>
				<div class="count0" style="display:none;"><%=orderListDTO.getStatus() %></div>
				<%
					}else if(orderListDTO.getStatus()==1){
				%>
				<button class="w3-button w3-blue h100" onclick="baesongBtn(this)">배달출발</button>
				<div class="count1" style="display:none;"><%=orderListDTO.getStatus() %></div>
				<%
					}
				%>
				<button class="w3-button w3-yellow h100"  onClick="cancelBtn(this)" data-toggle="modal" data-target="#jumoon_calcel">주문취소</button>
			</div>
			<!-- 오른쪽-->
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 <%=count %>개]</strong> &nbsp;<%=orderListDTO.getName()%><br>
						주문번호 :<%=orderListDTO.getNo() %>
					</div>
					<div class="w3-col">전화번호 :<%=orderListDTO.getTel() %></div>
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
function jumunBtn(e) {
	orderList_No = e.parentNode.parentNode.children[0].children[1].value;
	shop_No = e.parentNode.parentNode.children[0].children[2].value;
	getOrderDate = e.parentNode.parentNode.children[0].children[3].value;
	console.log(orderList_No);
	document.getElementById("order_no1").value = orderList_No;
	
	/*  $("#take_cancle").click(function(){
			$('.modal').on('hidden.bs.modal', function (e) {
			    $(this).find('form')[0].reset()
			});
		});
		$('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset()
		});
 */
}
function baesongBtn(e) {
	var orderList_No = e.parentNode.parentNode.children[0].children[1].value;
	//var shop_No = e.parentNode.parentNode.children[0].children[2].value;
	//var getOrderDate = e.parentNode.parentNode.children[0].children[3].value;
/* 	var 시 = Math.floor((간격 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	var 분 = Math.floor((간격 % (1000 * 60 * 60)) / (1000 * 60));
	var 초 = Math.floor((간격 % (1000 * 60)) / 1000);

	console.log( 시 +"시간 "+ 분 +"분 "+ 초 +"초" ); */
	console.log(orderList_No);
	 //$("#take_overbtn").click(function(){
		/*  var estimated_time = $(":input:radio[name=estimated_time]:checked").val(); */
		
		 
		 var data={
				//항목이름: 값(변수)
			//	no:no,
				//rno:rno,
			
				orderList_No:orderList_No,
				
		}
		//alert(JSON.stringify(reply));
		//ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기.
		
		$.ajax({
			type : "post",
			url : "BaesongSelect.jsp",
			//data : JSON.stringify(reply),
			data : data,
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType: "text" ,
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result,status,xhr){
				console.log("배달접수 완료");
			},
			error : function(xhr,status,error){
				console.log("배달접수 실패");
			}//error의 끝
			
		});//ajax의 끝*/
	//});  
			
}
function cancelBtn(e) {
		var orderList_No = e.parentNode.parentNode.children[0].children[1].value;
		var shop_No = e.parentNode.parentNode.children[0].children[2].value;
		var getOrderDate = e.parentNode.parentNode.children[0].children[3].value;
		document.getElementById("order_no2").value = orderList_No;
		console.log(orderList_No);
		
		/*  $("#take_cancle2").click(function(){
				$('.modal').on('hidden.bs.modal', function (e) {
				   $(this).find('form')[0].reset()
				});
				});
				$('.modal').on('hidden.bs.modal', function (e) {
				    $(this).find('form')[0].reset()
				});
		
		 */
		
	}
</script>