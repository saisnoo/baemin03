<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");

	//int shopNo=Integer.parseInt((String)session.getAttribute("shopNo"));
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
	function sleep(delay) {
		var start = new Date().getTime();
		while (new Date().getTime() < start + delay)
			;
	}

	function refresh() {
		$("#tab1").load("NewOrderList.jsp?shopNo=1");
		$("#tab2").load("BaesongList.jsp?shopNo=1");
		$("#tab3").load("EndList.jsp?shopNo=1");
		setTimeout(countcount, 1000);
		setTimeout(countcount, 2000);
	}
	// 스크립트

	setInterval(function() {
		refresh();
	}, 1500)

	function countcount() {
		var a = document.getElementsByClassName("count0").length;
		var a1 = document.getElementsByClassName("count1").length;
		var a2 = document.getElementsByClassName("count2").length;
		var a3 = document.getElementsByClassName("count3").length;
		//console.log(a +"/"+ a1);
		document.getElementById("NewOrderCount").innerText = (a + "/" + a1);
		document.getElementById("BaesongCount").innerText = (a2);
		document.getElementById("EndListCount").innerText = (a3);
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
							배달중<br /> <strong id="BaesongCount"></strong>
						</button>
						<button class="w3-button w3-block w3-border tablinks"
							onclick="openTab(event, 'tab3')">
							완료<br /> <strong id="EndListCount"></strong>
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


	<!-- 배달시작 Modal시작 -->
	<div class="w3-modal" id="jumunReady">
		<div class="w3-modal-content" style="width: 400px; height: 500px;">
			<div class="w3-container">
				<div
					onclick="document.getElementById('jumunReady').style.display='none'"
					class="w3-button w3-display w3-right">닫기</div>
				주문번호:<span id="jumunNo"></span><br><input id="shop" type="hidden" />
				배달 소요 시간:<span id="time">0</span>분<br>
				<!-- 주문 접수시간 -->
				<!-- 배달 도착시간입력 -->
				<div class="w3-tag w3-container w3-row">
					<div class="w3-col">
						<button class="w3-button w3-yellow h100" onClick="time(this)"
							value="15">15분</button>
						<button class="w3-button w3-yellow h100" onClick="time(this)"
							value="30">30분</button>
					</div>
				</div>
				<div class="w3-tag w3-container w3-row">
					<div class="w3-col">
						<button class="w3-button w3-yellow h100" onClick="time(this)"
							value="45">45분</button>
						<button class="w3-button w3-yellow h100" onClick="time(this)"
							value="60">60분</button>
					</div>
				</div>
				<!-- 배달 도착시간입력 -->
				<button class="w3-label w3-green" onClick="CookOk(this)">조리시작</button>
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
			document.getElementById("time").innerText = 0;
		}//baesongBtn

		function CookOk(e) {
			var no = e.parentNode.children[1].innerText;
			var minute = e.parentNode.children[4].innerText;
			console.log(no);
			console.log(minute);
			$.ajax({
						type : "post",
						url : "CheckOrderPro.jsp",
						data : {
							"no" : no,
							"minute" : minute
						},
						success : function(result) {
							console.log(result);
							if (result == 1) {
								//alert("조리시작");
								document.getElementById("jumunReady").style.display = "none";
							} else {
								alert("조리X");
							}//else
						}//success
					});//ajax
			refresh(); // 새로고침
		}//CookOk
	</script>


	<!--주문 취소 Modal시작 -->
	<div class="w3-modal" id="jumunCancel">
		<div class="w3-modal-content">
			<div class="w3-container">
			취소번호: <span id="cancelNo"></span><br>
			 <input id="shop" type="hidden" />
			취소사유: <span id="CancelWhy"></span>
				  <span align="right"
					onclick="document.getElementById('jumunCancel').style.display='none'"
					class="w3-button w3-display">X</span><br>
				<div class="cancelText">
				<button class="w3-button w3-yellow h100" onClick="CancelWhy(this)"
							value="영업종료">영업종료</button>
				<button class="w3-button w3-yellow h100" onClick="CancelWhy(this)"
							value="재료 소진">재료 소진</button>
				<button class="w3-button w3-yellow h100" onClick="CancelWhy(this)"
							value="배달불가지역">배달불가지역</button>
				<button class="w3-button w3-yellow h100" onClick="CancelWhy(this)"
							value="고객요청">고객요청</button>
				</div>
				<button class="w3-label w3-green" onClick="CancelOk(this)">주문취소</button>
			</div>
			<!-- w3-container 끝-->
		</div>
	</div>
	<%--주문 취소 Modal끝 --%>
	<script>
	function CancelWhy(e){
		var e = e.value;
		console.log(e);
		document.getElementById("CancelWhy").innerText = e;
	}
	
	function cancelBtn(e) {
		var cancelNo = e.parentNode.parentNode.children[0].children[1].value;
		console.log(cancelNo);
		//모달창에 값넣기
		document.getElementById("cancelNo").innerText=cancelNo;
		document.getElementById("jumunCancel").style.display = "block";
	}//cancelBtn
	function CancelOk(e){
		var no = e.parentNode.children[0].innerText;
		var whyCancel = e.parentNode.children[2].innerText;
		$.ajax({
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
					alert("취소");
				}//else
			}//success
		});//ajax
	}
	
	</script>

</body>
</html>