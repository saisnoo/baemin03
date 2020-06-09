<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");
	
	int shopNo=Integer.parseInt((String)session.getAttribute("shopNo"));
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
</style>
<script>
	// 스크립트

	function jumunBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[1].value;
		console.log(a1);
		document.getElementById("jumunSiganNo").value = a1;
		document.getElementById("jumunReady").style.display = "block";
	}
	function cancelBtn(e) {
		var a1 = e.parentNode.parentNode.children[0].children[1].value;
		console.log(a1);
		document.getElementById("jumunCancel").style.display = "block";
	}

	window.onload = function() {
		$("#tab1").load("NewOrderList.jsp?shopNo="+shopNo);
		$("#tab2").load("BaesongList.jsp?shopNo="+shopNo);
		$("#tab3").load("EndList.jsp?shopNo="+shopNo);
		
	}
	
	setInterval(function() {
		$("#tab1").load("NewOrderList.jsp?shopNo="+shopNo);
		$("#tab2").load("BaesongList.jsp?shopNo="+shopNo);
		$("#tab3").load("EndList.jsp?shopNo="+shopNo);
		countcount();
	},3000)
	
	function countcount(){
		var a = document.getElementsByClassName("count0").length;
		var a1 = document.getElementsByClassName("count1").length;
		//console.log(a +"/"+ a1);
		document.getElementById("NewOrderCount").innerText=(a+"/"+a1);
	}
	

</script>
</head>
<body>
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

				<div class="w3-row w3-black">
					<a href="#" class="w3-button">
						<h3>배달의 인종</h3>
					</a>
				</div>
				<div class="w3-row w3-gray">
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab1')" id="defaultOpen2"
							class="w3-button w3-block w3-baemint w3-border">
							<h4>주문접수</h4>
						</button>
					</div>
					<div class="w3-quarter tablink2">
						<button onclick="openTab2(event, 'tabtab2')"
							class="w3-button w3-block w3-black w3-border">
							<h4>매장관리</h4>
						</button>
					</div>
				</div>

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div id="tabtab1" class="w3-row w3-gray tabcontent2">
					<div class="tab w3-col" style="width: 100px;">
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab1')" id="defaultOpen">
							접수대기<br /> <strong id="NewOrderCount"></strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab2')">
							배달중<br /> <strong id="BaesongCount">3</strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab3')">
							완료<br /> <strong id="EndListCount">3</strong>
						</button>
					</div>
					<div class="w3-rest w3-white scroll-box">
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab1" class="tabcontent">

							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->
							<!-- 신규, 조리중 주문 목록  -->

							<!-- load  new order  -->
							<!-- load  new order  -->
							<!-- load  new order  -->

						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab2" class="tabcontent">


							<!-- 배달중 목록 --//--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/ -->
							<!-- load  new order --/--/-/-//-/--/-/-/-/-/-/-/-/-//-/-/-/ -->
							<!-- 배달중 목록 끝  -->
						</div>
						<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<div id="tab3" class="tabcontent">
							<!-- load  new order -/-/-/-/-/-/--/-/-/-/-/-/-/-/-/- -->


							<!-- load  new order /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ -->

						</div>
					</div>
				</div>
				<!--tabtab1 end-->

				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div id="tabtab2" class="w3-border tabcontent2">

					<div class="w3-row-padding w3-section">
						<!-- 왼쪽 half -->
						<div class="w3-half">
							<div class="w3-row">
								<div class="w3-col w3-left" style="width: 150px">
									<h2>메뉴구성</h2>
								</div>
							</div>
							<input class="w3-input w3-border w3-round-large" type="text"
								placeholder="Search for names.." id="myInput"
								onkeyup="myFunction()" style="width: 70%;">
							<div id="menucell">
								<table class="w3-table-all w3-margin-top" id="myTable">
									<tr>
										<th style="width: 20%;">이름</th>
										<th style="width: 80%;">재료</th>
									</tr>
									<tr>
										<td>김치찌개</td>
										<td>김치,물,돼지고기</td>
									</tr>
									<tr>
										<td>된장찌개</td>
										<td>된장,물,두부</td>
									</tr>
								</table>
							</div>
						</div>

						<!-- 오른쪽 half -->
						<div class="w3-half">
							<!-- 메뉴입력창 -->
							<div class="w3-row">
								<table class="w3-table" border="1">
									<tr>
										<th>목록</th>
										<th>입력창</th>
									</tr>
									<tr>
										<td>가격</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>카테고리</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td colspan="2">설명</td>
									</tr>
									<tr>
										<td colspan="2"><textarea name="menuEx" id="menuEx"
												class="w3-input w3-border" rows="10"></textarea></td>
									</tr>
								</table>
							</div>
							<!-- 메뉴입력창  끝-->
							<!-- 메뉴입력 추가버튼-->
							<div class="w3-row w3-right">
								<input type="button" value="메뉴추가"> <input type="reset"
									value="지우기">
							</div>
							<!-- 메뉴입력 버튼 끝 -->
						</div>
						<!-- 오른쪽 half 끝 -->
					</div>

				</div>

				<script>
					function myFunction() {
						var input, filter, table, tr, td, i;
						input = document.getElementById("myInput");
						filter = input.value.toUpperCase();
						table = document.getElementById("myTable");
						tr = table.getElementsByTagName("tr");
						for (i = 0; i < tr.length; i++) {
							td = tr[i].getElementsByTagName("td")[0];
							if (td) {
								txtValue = td.textContent || td.innerText;
								if (txtValue.toUpperCase().indexOf(filter) > -1) {
									tr[i].style.display = "";
								} else {
									tr[i].style.display = "none";
								}
							}
						}
					}
				</script>


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
						evt.currentTarget.className += " w3-baemint";
					}

					// Get the element with id="defaultOpen" and click on it
					document.getElementById("defaultOpen").click();
					document.getElementById("defaultOpen2").click();
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


	<!-- 주문접수 Modal시작 -->
	<div class="w3-modal" id="jumunReady">
		<div class="w3-modal-content">
			<div class="w3-container">
				<input id="jumunSiganNo" type="hidden" />
				<div class="w3-tag">주문접수시간</div>
				<div class="w3-tag w3-red">시간입력</div>
				<div class="w3-label w3-green">접수버튼처리</div>
				<div
					onclick="document.getElementById('jumunReady').style.display='none'"
					class="w3-button w3-display">닫기</div>
				<!-- w3-container 끝-->
			</div>
		</div>
	</div>
	<%--주문접수 모달 Modal끝 --%>
	<!--주문 취소 Modal시작 -->
	<div class="w3-modal" id="jumunCancel">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="whyCancel">취소사유</span> <span align="right"
					onclick="document.getElementById('jumunCancel').style.display='none'"
					class="w3-button w3-display">X</span><br>
				<div class="cancelText">
					<input type="button" value="영업종료" /> <input type="button"
						value="재료 소진" /> <input type="button" value="배달불가지역" /> <input
						type="button" value="고객요청" />
				</div>
			</div>
			<!-- w3-container 끝-->
		</div>
	</div>
	<%--주문 취소 Modal끝 --%>


</body>
</html>