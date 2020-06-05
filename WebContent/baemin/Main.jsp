<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ main.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>main.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<%
		String grade = (String) session.getAttribute("grade");

		System.out.println("session grade=" + grade);
		
		
		
		if (grade == null || !(grade.equals("1"))) {
			System.out.println("사용자가 아니므로 로그인페이지로 돌아갑니다.");
			response.sendRedirect("../Index.html");
		}
		// 고객에 배민 진입하면 제일 먼저 보는 페이지
		ShopDAO dao = ShopDAO.getInstance();
		List<String> categoryList = dao.getCatogoryList();
	%>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
	 <div class="sw-container-400">
            <div class="w3-container w3-section">
                <!--  main content start here!!!----------------------------------------------------------- -->
                <select id="juso" class="w3-input w3-border w3-round-large">
                    <option value="0">서울 구로중앙테스트테스트테스트45-14</option>
                    <option value="1">+ 주소변경</option>
                </select>
            </div>
        </div>

     <!--  광고 슬라이드 start here!!!----------------------------------------------------------- -->
        <div class="sw-container-700 w3-section">
            <div style="width: 100%; background: cyan;" class="w3-center w3-border">
                <img src="../source//ad_sample.jpg" alt="" width="100%">
            </div>
        </div>
        <!-- main content end----------------------------------------------------------------------- -->



        <!--단락 구분선-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->
        <div class="sw-container-700 w3-section">
			<div class="w3-container w3-red">
				<!--  main content start here!!!----------------------------------------------------------- -->
				<div class="w3-row">

					<%
						for (int i = 0; i < categoryList.size() ; i++) {
					%>
					<div class="w3-col s3 m2 w3-center w3-padding w3-border">
						<img src="../source/img/main_icon_yangsik.png" alt="">
						<div>테스트</div>
					</div>
					<%
						}
					%>



				</div>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	<jsp:include page="../sw_css/topnav.jsp" />


</body>
</html>