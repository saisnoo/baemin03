<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%

if(session.getAttribute("id")==null){	//id가 없을때
	response.sendRedirect("../index.jsp");
}else{//id가 있을때

	Object no=session.getAttribute("no");
	int shopNo=Integer.parseInt(no+""); 
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");
	OrderListDAO orderlistdao=OrderListDAO.getInstance();
	int max_no = orderlistdao.getMaxNoOfShop_No(shopNo);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Main.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	height: 700px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

.tablinks {
	height: 100px;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border-left: none;
	height: 700px;
	width: 100%;
}

.tabcontent2 {
	display: none;
}

.scroll-box {
	overflow-y: auto;
}

#tabtab2 {
	height: 500px;
}

#tabtab3 {
	/* height: 500px; */
}

#menucell {
	height: 415px;
	overflow-y: auto;
}

.w90 {
	width: 90px;
}

#menuEx {
	resize: none;
}

.timeBtn {
	border-style: outset;
	width: 180px;
	height: 130px;
	margin: 0px;
}

.CookOkBtn {
	height: 60px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.CancelWhyBtn {
	border-style: outset;
	width: 180px;
	height: 130px;
	margin: 0px;
}

.CancelOkBtn {
	height: 60px;
	margin-top: 0px;
	margin-bottom: 0px;
}
#reviewCell {
	height: 370px;
	overflow-y: auto;
}
#reviewCell td{
	vertical-align:middle;
	text-align:center;
	padding: 0px 5px 0px 5px;
}
#reviewCell #reviewHead td{
	height:30px;
	vertical-align:middle;
	text-align:center;
}



</style>	
<script>
var max_no2=0;                   	
var max_no= 0;
	window.onload = function() {
		refresh();
		countcount();
		
	}

	function refresh() {
		$("#tab1").load("NewOrderList.jsp");
		$("#tab2").load("BaesongList.jsp");
		$("#tab3").load("EndList.jsp");
		$("#tab4").load("CancelList.jsp");
		$("#SM").load("ShopManage.jsp");
		setTimeout(countcount, 1000);
	}
	
	function tabtab2load(){
		if($(".check_view").find("#menu_status").val()==1){
			$(".check_view").attr("bgcolor","red");
			
		}
		$("#SM").load("ShopManage.jsp");
		openTab2(event, 'tabtab2');
		setTimeout(function() {
			document.getElementById("defaultOpen2").click();
			}, 1500);
	}

	
	function noticeload(no){
		$("#noticeList").load("NoticeView.jsp?no=" + no);
	}
	function noticeload2(){
		$("#noticeList").load("NoticeList.jsp");
	}

	// 스크립트

	function tab2Refresh(){
		console.log("배달중 새로고침");
		$("#tab2").load("BaesongList.jsp");	
	}
	function tab3Refresh(){
		console.log("완료 새로고침");
		$("#tab3").load("EndList.jsp");
	}
	function tab4Refresh(){
		console.log("취소 새로고침");
		$("#tab4").load("CancelList.jsp");
	}

	function countcount() {
		var a = document.getElementsByClassName("count0").length;
		var a1 = document.getElementsByClassName("count1").length;
		var a2 = document.getElementsByClassName("count2").length;
		var a3 = document.getElementsByClassName("count3").length;
		var a4 = document.getElementsByClassName("count4").length;
		//console.log(a +"/"+ a1);
		document.getElementById("NewOrderCount").innerText = (a + "/" + a1);
		document.getElementById("BaesongCount").innerText = (a2);
		document.getElementById("EndListCount").innerText = (a3);
		document.getElementById("CancelCount").innerText = (a4);
	}
	
	function reviewLoad(){
		$("#reviewList").load("reviewList.jsp");
		setTimeout(countSum,1000);
	}
		
	function countSum(){
			var r=document.getElementById("EndListCount").innerText;
			document.getElementById("countSum").innerText=r;
		}
	
	//-------------------------------------------------
   
	 
   $(function(){	
   	function reload(){
   		reload2();
   		//$("#tab1").load("NewOrderList.jsp");
   		//$("#tab2").load("BaesongList.jsp");
   		//$("#tab3").load("EndList.jsp");
   		countcount();
   		//$("#tabtab2").load("ShopManage.jsp");
    		//document.getElementById("defaultOpen").click();
   		//document.getElementById("jumoontab").click(); 
   	}
   	function load(){
   		$("#tab1").load("NewOrderList.jsp");
   	}
   	
   	setInterval(reload, 1000);
   	setTimeout(load,1000);
   	setTimeout(load,2000);
   	setTimeout(load,3000);
   	setTimeout(load,4000);
   });
   
   var audio = new Audio();
   var audio_start = 0;
   audio.src = "./baeminAlarm.mp3";
   
   function reload2(){
   	console.log("reload2 = > "+max_no+"/"+max_no2);
   	var data={
   			max_no:max_no
   	}
   	$.ajax({
			type : "post",
			url : "Reload.jsp",
			//data : JSON.stringify(reply),
			 data : data, 
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType: "json" ,
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result){
				max_no2=result;
				if(max_no!=max_no2){
					max_no=max_no2;
					
				$("#tab1").load("NewOrderList.jsp");
				if(audio_start!=0){audio.play();}
				audio_start++;
				}
			},
			error : function(xhr,status,error){
				console.log("주문리스트창 리로드 실패");
			}//error의 끝
		});//ajax의 끝
   }

//-------------------------------------------------
</script>
</head>
<body>

<input type="hidden" name="max_no" value="<%=max_no %>">
<input type="hidden" name="max_no2" value="<%=max_no %>">
	<!-- 내용 -->
	<!-- 배달 주문 처리하는 메인 페이지-->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-1200">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<div class="w3-row">
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab1')" id="defaultOpen"
							class="w3-button w3-block w3-border tablink2">
							<h4>주문접수</h4>
						</button>
					</div>
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab2')"id="defaultOpen2"

							class="w3-button w3-block w3-border tablink2">
							<h4>메뉴관리</h4>
						</button>
					</div>
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab3');reviewLoad();"
							class="w3-button w3-block w3-border tablink2">
							<h4>리뷰</h4>
						</button>
					</div>
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab4');"

							class="w3-button w3-block w3-border tablink2">
							<h4>공지사항</h4>
						</button>
					</div>
				</div>

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div id="tabtab1" class="w3-row tabcontent2" onClick="refresh()">
					<div class="w3-col" style="width: 100px;">
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab1')" id="jumoontab">
							접수대기<br /> <strong id="NewOrderCount"></strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab2');tab2Refresh();" id="tab2Btn">
							배달중<br /> <strong id="BaesongCount"></strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab3');tab3Refresh();" id="tab3Btn">
							완료<br /> <strong id="EndListCount"></strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab4');tab4Refresh();" id="tab4Btn">
							취소<br /> <strong id="CancelCount"></strong>
						</button>
					</div>
					<div class="w3-rest w3-white">
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab1" class="tabcontent scroll-box">

							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->

							<!-- load  new order  -->
							<!-- load  new order  -->
							<!-- load  new order  -->

						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab2" class="tabcontent scroll-box">


							<!-- 배달중 목록 --//--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/ -->
							<!-- load  new order --/--/-/-//-/--/-/-/-/-/-/-/-/-//-/-/-/ -->
							<!-- 배달중 목록 끝  -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab3" class="tabcontent scroll-box">
							<!-- load  new order -/-/-/-/-/-/--/-/-/-/-/-/-/-/-/- -->


							<!-- load  new order /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ -->

						</div>
						<div id="tab4" class="tabcontent scroll-box">
							<!-- cancel order -/-/-/-/-/-/--/-/-/-/-/-/-/-/-/- -->


							<!-- cancel order /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ -->

						</div>
					</div>
				</div>
				<!--tabtab1 end-->

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 매장관리탭 -->

				<div id="SM" >
						<jsp:include page="ShopManage.jsp"/>	
				</div>
				<!-- 매장관리탭 끝 -->
				<!-- 리뷰탭 -->
				<div id="tabtab3" class="tabcontent2">
					<div id="reviewList">
					
					</div>
				</div>
				<div id="tabtab4" class="w3-border tabcontent2">
					<div id="noticeList">
					<jsp:include page="NoticeList.jsp"/>
					</div>
				</div>

				
				<!-- 리뷰탭 끝 -->

				<script>
					function openTab(evt, tabName) {
						var i, tabcontent, tablinks;
						tabcontent = document
								.getElementsByClassName("tabcontent");
						for (i = 0; i < tabcontent.length; i++) {
							tabcontent[i].style.display = "none";
						}
						tablinks = document.getElementsByClassName("tablinks");
						for (i = 0; i < tablinks.length; i++) {
							tablinks[i].className = tablinks[i].className
									.replace(" w3-white", "");
						}
						document.getElementById(tabName).style.display = "block";
						evt.currentTarget.className += " w3-white";
					}

					function openTab2(evt, tab2Name) {
						// Declare all variables
						var i, tabcontent2, tablink2;

						// Get all elements with class="tabcontent" and hide them
						tabcontent2 = document
								.getElementsByClassName("tabcontent2");
						for (i = 0; i < tabcontent2.length; i++) {
							tabcontent2[i].style.display = "none";
						}

						// Get all elements with class="tablink2" and remove the class "active"
						tablink2 = document.getElementsByClassName("tablink2");
						for (i = 0; i < tablink2.length; i++) {
							tablink2[i].className = tablink2[i].className
									.replace(" w3-baemint", "");
						}

						// Show the current tab, and add an "active" class to the button that opened the tab
						document.getElementById(tab2Name).style.display = "block";
						evt.currentTarget.className += "";
					}

					// Get the element with id="defaultOpen" and click on it
					document.getElementById("defaultOpen").click();
					document.getElementById("jumoontab").click();
				</script>
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->
	<script>
		window.onresize = responsiveMenuClose;
		function responsiveMenuPopUp() {
			var x = document.getElementById("topNav");
			if (x.className === "topnav w3-card-4") {
				x.className += " responsive";
			} else {
				x.className = "topnav w3-card-4";
			}
		}

		function responsiveMenuClose() {
			var x = document.getElementById("topNav");
			x.className = "topnav w3-card-4";
		}
	</script>
	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	<!-- 매장 main페이지는 별도의 상단바 필요할지도....????? -->
	<jsp:include page="../sw_css/topnav.jsp" />


	<!-- 배달시작 Modal시작 -->
	<div class="w3-modal" id="jumunReady">
		<div class="w3-modal-content" style="width: 450px; height: 600px;">
			<div class="w3-panel w3-black w3-display-container">
				<span
					onclick="document.getElementById('jumunReady').style.display='none'"
					class="w3-button w3-black w3-large w3-display-topright"><font>X</font></span>
				<p class="w3-wide w3-xlarge" style="height: 41px;">접수대기</p>
			</div>
			<div class="w3-container w3-section" style="height: 560px;">
				<div>
					<b class="w3-xxlarge">주문번호:</b><span id="jumunNo"
						class="w3-xxlarge"></span><br> <input id="shop" type="hidden" /><b
						class="w3-xlarge">배달 소요 시간:</b> <span id="time" class="w3-xlarge">0</span>
					<b class="w3-xlarge">분</b><br>
					<!-- 주문 접수시간 -->
				</div>
				<!-- 배달 도착시간입력 -->
				<div class="w3-row w3-margin-top">
					<button
						class="w3-button  w3-light-grey w3-text-grey w3-col w3-half w3-section timeBtn"
						onClick="time(this)" value="15">
						<b class="w3-xxxlarge">15분</b>
					</button>
					<button
						class="w3-button  w3-light-grey w3-text-grey w3-col w3-half w3-section timeBtn"
						onClick="time(this)" value="30">
						<b class="w3-xxxlarge">30분</b>
					</button>
				</div>
				<div class="w3-row">
					<button
						class="w3-button  w3-light-grey w3-text-grey w3-col w3-half w3-section timeBtn"
						onClick="time(this)" value="45">
						<b class="w3-xxxlarge">45분</b>
					</button>
					<button
						class="w3-button w3-light-grey w3-text-grey w3-col w3-half w3-section timeBtn"
						onClick="time(this)" value="60">
						<b class="w3-xxxlarge">60분</b>
					</button>
					<br>
				</div>
				<!-- 배달 도착시간입력 -->
				<div class="w3-row">
					<button
						class="w3-panel w3-cyan w3-text-white w3-xlarge w3-col CookOkBtn"
						onClick="CookOk(this)">조리시작</button>
				</div>
			</div>
			<!-- w3-container 끝-->
		</div>
	</div>
	<%--배달시작 모달 Modal끝 --%>

	<script>
		function time(e) {
			var e = e.value;
			console.log(e);
			document.getElementById("time").innerText = e;
		}

		function CookBtn(e) {
			var jumunNo = e.parentNode.parentNode.children[0].children[1].value;
			var shop = e.parentNode.parentNode.children[0].children[2].value;
			console.log(jumunNo);
			console.log(shop);
			//모달창에 값넣기
			document.getElementById("jumunNo").innerText = jumunNo;
			document.getElementById("shop").value = shop;
			//모달창띄우기
			document.getElementById("jumunReady").style.display = "block";
			document.getElementById("time").innerText = "---";
		}//baesongBtn

		function CookOk(e) {
			var no = e.parentNode.parentNode.children[0].children[1].innerText;
			var minute = e.parentNode.parentNode.children[0].children[5].innerText;
			console.log(no);
			console.log(minute);
			$
					.ajax({
						type : "post",
						url : "CheckOrderPro.jsp",
						data : {
							"no" : no,
							"minute" : minute
						},
						success : function(result) {
							console.log(result);
							if (result == 1) {
								document.getElementById("jumunReady").style.display = "none";
							} else {
								alert("배달 실패X");
							}//else
						}//success
					});//ajax
			setTimeout(refresh,1200); // 새로고침
			setTimeout(refresh,1200); // 새로고침
		}//CookOk
	</script>


	<!--주문 취소 Modal시작 -->
	<div class="w3-modal" id="jumunCancel">
		<div class="w3-modal-content" style="width: 450px; height: 600px;">
			<!-- 위에 패널 -->
			<div class="w3-panel w3-black w3-display-container">
				<span
					onclick="document.getElementById('jumunCancel').style.display='none'"
					class="w3-button w3-black w3-large w3-display-topright"><font>X</font></span>
				<p class="w3-wide w3-xlarge" style="height: 41px;">주문거부사유</p>
			</div>
			<!-- 위에 패널 -->
			<!-- 밑에 버튼칸 -->
			<div class="w3-container">
				<div>
					<b class="w3-xxlarge">취소번호:</b><span id="cancelNo"
						class="w3-xxlarge"></span><br> <input id="shop" type="hidden" /><b
						class="w3-xlarge">취소사유:</b><span id="CancelWhy" class="w3-xlarge"></span>
				</div>
				<div class="w3-row w3-margin-top">
					<button class="w3-button w3-col w3-half w3-white CancelWhyBtn"
						onClick="CancelWhy(this)" value="영업종료">
						<b class="w3-xlarge">영업종료</b>
					</button>
					<button class="w3-button w3-col w3-half w3-white CancelWhyBtn"
						onClick="CancelWhy(this)" value="재료 소진">
						<b class="w3-xlarge">재료 소진</b>
					</button>
				</div>
				<div class="w3-row w3-margin-top">
					<button
						class="w3-button w3-col w3-half w3-white w3-section CancelWhyBtn"
						onClick="CancelWhy(this)" value="배달불가지역">
						<b class="w3-xlarge">배달불가지역</b>
					</button>
					<button
						class="w3-button w3-col w3-half w3-white w3-section CancelWhyBtn"
						onClick="CancelWhy(this)" value="고객요청">
						<b class="w3-xlarge">고객요청</b>
					</button>
				</div>
				<div class="w3-row">
					<button
						class="w3-panel w3-dark-grey w3-col w3-xlarge w3-wide CancelOkBtn "
						onClick="CancelOk(this)">주문취소</button>
				</div>
			</div>
			<!-- 밑에 버튼칸 -->
			<!-- w3-container 끝-->
		</div>
	</div>
	<%--주문 취소 Modal끝 --%>
	<script>
		function CancelWhy(e) {
			var e = e.value;
			console.log(e);
			document.getElementById("CancelWhy").innerText = e;
		}

		function cancelBtn(e) {
			var cancelNo = e.parentNode.parentNode.children[0].children[1].value;
			console.log(cancelNo);
			//모달창에 값넣기
			document.getElementById("cancelNo").innerText = cancelNo;
			document.getElementById("jumunCancel").style.display = "block";
			document.getElementById("CancelWhy").innerText = "[주문취소 사유 입력칸]"
		}//cancelBtn
		function CancelOk(e) {
			var no = e.parentNode.parentNode.children[0].children[1].innerText;
			var whyCancel = e.parentNode.parentNode.children[0].children[5].innerText;
			console.log(no);
			console.log(whyCancel);
			$
					.ajax({
						type : "post",
						url : "CancelOrderPro.jsp",
						data : {
							"no" : no,
							"whyCancel" : whyCancel
						},
						success : function(result) {
							console.log(result);
							if (result == 1) {
								document.getElementById("jumunCancel").style.display = "none";
							} else {
								alert("취소를취소");
							}//else
						}//success
					});//ajax
					setTimeout(refresh,1200); // 새로고침
					setTimeout(refresh,1200); // 새로고침
		}
	</script>
	<script>
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
				}else{
					alert("배달안됨")
				}//else
			}//success
		});//ajax
		refresh(); // 새로고침
	}//CookBtn
	</script>

 <!-- 두번째 메뉴관리 -->
   <div class="modal fade check_viewmenu" id="check_viewmenu" role="dialog">
   <div class="modal-dialog">
   
     <!-- Modal content 시작-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h3 class="modal-title">주문 메뉴 표시 유무</h3>
       </div>
       <div class="modal-body">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <label for="writer">주문 메뉴 표시 유무</label><br>
			    <input type="hidden" id="no5" name="no5" value="">
			    <input type="hidden" id="status5" name="status5" value="">
			    
			    <span id="status_check">123</span>
			    </div>
       </div>
       <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="check_viewmenu_btn" data-dismiss="modal">변경</button>
			</div> 
       </div>
     </div>
     <!-- Modal content end-->
   </div>
 </div>
   <div class="modal fade add_menu" id="add_menu" role="dialog">
   <div class="modal-dialog">
   
     <!-- Modal content 시작-->
     <div class="modal-content">
			 <div class="w3-container w3-card">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
			 <!-- 모달창 내용 -->
					<div class="w3-section w3-center">
					  <h2>메뉴추가</h2>
					</div>
       		
       		     </div>
       <div class="modal-body">
						  <p>
						  	<label><b>메뉴이름</b></label>
							  <input type="text" class="w3-input w3-border" name="menuName">
						  </p>
						  <p>
						  	<label><b>메뉴카테고리</b></label>
							  <input type="text" class="w3-input w3-border" name="menuCategory">
						  </p>
						  <p>
						  	<label><b>메뉴설명</b></label>
						  	<textarea id="menuEx2" rows="5" class="w3-input w3-border" name="menuEx"></textarea>
						  </p>
						  <p>
						  	<label><b>메뉴가격</b></label>
							  <input type="text" class="w3-input w3-border" name="menuPrice">
						  </p>
			</div>

		<!-- 모달창 내용 end -->
  
       <div class="modal-footer">
			  <button class="w3-button w3-baemint" id="add_menu_btn">추가</button>
			  <button type="button" class="w3-button w3-baemint" data-dismiss="modal" id="take_cancle4" >닫기</button>
       </div>
      </div>
     </div>
     <!-- Modal content end-->
   </div>
 </div>
 <script>
  $("#take_cancle4").click(function(){
	   tabtab2load();
 }); 
	// 스크립트
	//데이터를 변경하는 함수 -update	
	 $("#add_menu_btn").click(function(){
		 var menuName = $(":input:text[name=menuName]").val();
		 var menuCategory = $(":input:text[name=menuCategory]").val();
		 //var menuEx = $(":input:text[name=menuEx]").val();
		 var menuEx = $("#menuEx2").val();
		 var menuPrice = $(":input:text[name=menuPrice]").val();
		 console.log(menuName+"/"+menuCategory+"/"+menuEx+"/"+menuPrice);
		 var data={
				 menuName:menuName,
				 menuCategory:menuCategory,
				 menuEx:menuEx,
				 menuPrice:menuPrice
			}
		 $.ajax({
				type : "post",
				url : "AddMenuPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				async : false,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("메뉴추가 완료");
					$(":input:text[name=menuName]").val("");
					 $(":input:text[name=menuCategory]").val("");
					 $("#menuEx2").val("");
					 $(":input:text[name=menuPrice]").val("");
				},
				error : function(xhr,status,error){
					console.log("메뉴추가 실패");
				}//error의 끝
				
			});//ajax의 끝*/
	 });
	 
	
	 $("#check_viewmenu_btn").click(function(){
		 var menu_no = $(":input:hidden[name=no5]").val();
		 var menu_status = $(":input:hidden[name=status5]").val();
		 console.log("check_viewmenu2 = "+menu_no + "/"+ menu_status);
			var data={
					menuno:menu_no,
					menustatus:menu_status
			}
			$.ajax({
				type : "post",
				url : "MenuStatusPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("menuStatus 변경 완료");
					tabtab2load();
					
					
				},
				error : function(xhr,status,error){
					console.log("menuStatus 변경 실패");
				}//error의 끝
				
			});//ajax의 끝*/
		});	
   
 </script>
 
<!-- 두번째 메뉴관리 -->

<%
}//else 메인 불러오기
%>




</body>
</html>