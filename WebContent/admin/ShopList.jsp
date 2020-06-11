<%@page import="com.baemin.shop.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
System.out.println("------ ShopListAll.jsp --- ");



ShopDAO dao=ShopDAO.getInstance();
List<ShopDTO> list = dao.getListAll();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>ShopList.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

.contentLine:HOVER {
	background-color: #eeeeee;
	cursor: pointer;
}

#ys {
	height: 400px;
	overflow-y: auto;
}

.th-text {
	position: absolute;
	width: inherit;
	top: 135px;
}

  .btn {
    background-color: #45c1bf;
    color: white;
  }



</style>


<script>
	// 스크립트
	$(function() {
		$(".contentLine").click(function() {
			var shopNo = $(this).find(".shopNoNo").text().trim();
			console.log(shopNo);
			//location.href="ShopView.jsp?shopNo="+shopNo;	
			document.getElementById("id01").style.display = "block";		
			$("#swsw").load("ShopView.jsp?shopNo="+shopNo);

		});
	});

	function myFunction() {
		var input, filter, table, tr, td, i;

		var k = document.getElementById("selec").value;
		//console.log("k="+k);

		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[k];
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
</head>
<body>
	<!-- 내용 -->
	<h2>ShopListAll.jsp</h2>
	<br>
	<%
		
	%>



	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-1000">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->


				<div id="ys">
					<table class="w3-table w3-bordered" id="myTable">

						<tr class="first">
							<th width="10%"><div class="th-text">매장번호</div></th>
							<th width="20%"><div class="th-text">매장이름</div></th>
							<th width="15%"><div class="th-text">매장분류</div></th>
							<th width="55%"><div class="th-text">매장주소</div></th>
						</tr>
						<div>&nbsp;</div>

						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr class="contentLine" onclick="click(this)">
							<td class="shopNoNo" width="15%"><%=list.get(i).getNo()%></td>
							<td width="20%"><%=list.get(i).getShopName()%></td>
							<td width="15%"><%=list.get(i).getShopCategory()%></td>
							<td width="50%"><%=list.get(i).getShopAddr()%>&nbsp;<%=list.get(i).getShopAddr2()%></td>
						</tr>
						<%
							}
						%>



					</table>
				</div>
				<div>&nbsp;</div>
				<div class="w3-row">

					<div class="w3-bar w3-col m2">
						<button class="w3-bar-item w3-button btn"
							onclick="location='NoticeInputForm.jsp'">공지쓰기</button>
					</div>

					<div class="w3-col m2">
						<select class="w3-select w3-border" id="selec">
							<option value="1">매장이름</option>
							<option value="2">매장분류</option>
							<option value="3">매장주소</option>
						</select>

					</div>


					<div class="w3-col m6">
						<input class="w3-input w3-border w3-padding" type="text"
							placeholder="search" id="myInput" onkeyup="myFunction()">
					</div>

				</div>

				<!-- Modal -->
				<div id="id01" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span
								onclick="document.getElementById('id01').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>

							<div id="swsw"></div>

						</div>
					</div>
				</div>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
<jsp:include page="../sw_css/admintopnav.jsp" />

</body>
</html>