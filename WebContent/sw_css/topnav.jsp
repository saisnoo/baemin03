<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------topnav.jsp");
%>



<!-- HEAD ------------------------------------------------------------------------------------ -->
<!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
<div class="topnav" id="topNav">
	<a href="main.jsp" class="w3-baemint active">배달의 인종 </a>
	<!-- -------------------------------------------------------------------------- -->
	<a> <strong>aaaa</strong>님 환영합니다.
	</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="memberInfo.jsp">마이페이지</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="logout.jsp">로그아웃</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="javascript:void(0);" class="icon" onclick="responsiveMenuPopUp()">
		<i class="fa fa-bars"></i>
	</a>
</div>

<script>
	/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
	function responsiveMenuPopUp() {
		var x = document.getElementById("topNav");
		if (x.className === "topnav") {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	}


</script>


