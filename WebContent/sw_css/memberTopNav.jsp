<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------memberTopNav.jsp");
%>

<!-- HEAD ------------------------------------------------------------------------------------ -->
<!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
<div class="w3-card w3-center w3-baemint" id="topnav">
	<div class="w3-baemint">
		<h3 style="font-family: baemin_font;">배달의 종족</h3>
	</div>
</div>
<script>
	/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
</script>
<div class="w3-bottom w3-center w3-border-top"
	style="padding-bottom: 5px; background: #ffffffdd;">
	<div class="w3-row sw-container-500"
		style="margin-top: 5px; height: 20px;">
		<!-- ----------------------------------------------------------------------------------------------------------- -->
		<a href="../baemin/Main.jsp" class="w3-button w3-col s3 w3-center"
			style="padding: 0px;"> <!-- ----------------------------------------------------------------------------------------------------------- -->
			<i class="material-icons" style="font-size: 48px; color: #45c1bf;">home</i>
		</a>
		<!-- ----------------------------------------------------------------------------------------------------------- -->
		<a href="../baemin/NoticeList.jsp"
			class="w3-button w3-col s3 w3-center" style="padding: 0px;"> <!-- ----------------------------------------------------------------------------------------------------------- -->
			<i class="material-icons" style="font-size: 48px; color: #45c1bf;">notifications</i>
		</a>
		<!-- ----------------------------------------------------------------------------------------------------------- -->
		<a href="../baemin/Cart.jsp" class="w3-button w3-col s3 w3-center"
			style="padding: 0px;"> <!-- ----------------------------------------------------------------------------------------------------------- -->
			<i class="material-icons" style="font-size: 48px; color: #45c1bf;">local_grocery_store</i>
		</a>
		<!-- ----------------------------------------------------------------------------------------------------------- -->
		<a href="../memberClient/MyPageClient.jsp"
			class="w3-button w3-col s3 w3-center" style="padding: 0px;"> <!-- ----------------------------------------------------------------------------------------------------------- -->
			<i class="material-icons" style="font-size: 48px; color: #45c1bf;">account_circle</i>
		</a>
	</div>

	<div class="w3-row sw-container-500">
		<div class="w3-col s3 w3-center">Home</div>
		<div class="w3-col s3 w3-center">Notice</div>
		<div class="w3-col s3 w3-center">Order</div>
		<div class="w3-col s3 w3-center">Mypage</div>
	</div>

</div>