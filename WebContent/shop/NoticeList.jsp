<%@page import="com.baemin.notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	top: 55px;
}
</style>
<script>
	// 스크립트
	$(function() {
		$(".contentLine").click(function() {
			var no = $(this).find(".noticeNo").text().trim();
			//console.log(no);
			noticeload(no);
		});
	});

	function myFunction2() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput2");
		console.log("공지사항검색키 : "+input);
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable2");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
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
	<!-- 내용 -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
<!-- 	<div class="sw-topnav-margin">&nbsp;</div>
 -->
	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-800">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<div id="ys">
					<table class="w3-table w3-bordered" id="myTable2">

						<tr>
							<th>#</th>
							<th width="50%">공지글제목</th>
							<th width="30%">공지일</th>							
						</tr>

						<c:forEach var="list" items="${list}">
						<tr class="contentLine" onclick="click(this)">
							<td class="noticeNo">${list.No}</td>
							<td>${list.Title}</td>
							<td>${list.StartDate}~<br>${list.EndDate}</td>							
						</tr>
						</c:forEach>

					</table>
				</div>
				<div>&nbsp;</div>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>

		<div class="sw-container-400">
			<div class="w3-container">
				<!-- main content end----------------------------------------------------------------------- -->
				<input class="w3-input w3-border" type="text" placeholder="공지글제목 검색"
					id="myInput2" onkeyup="myFunction2()" style="width: 300px;">
				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>


	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->


