<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------topnav.jsp");
%>

<%
	Object no_ = session.getAttribute("no");
	Object grade_ = session.getAttribute("grade");
	Object name_ = session.getAttribute("name");
	System.out.println("no=" + no_);
	System.out.println("grade_=" + grade_);
	System.out.println("name_=" + name_);
	int grade = -1;
	String name = "";

	if (name_ != null) {
		name = name_ + "";
	}
%>



<!-- HEAD ------------------------------------------------------------------------------------ -->
<!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
<div class="topnav w3-card-4" id="topNav">
	<a href="Main.jsp" class="w3-baemint active"> 배달의 종족 </a>
	<!-- -------------------------------------------------------------------------- -->
	<a> <strong><%=name_%></strong> </a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="../memberShop/MyPageShop.jsp">마이페이지</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="https://ceo.baemin.com/guide/detail/G73002">배민가이드</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="../util/logout.jsp">로그아웃</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="javascript:void(0);" class="icon"
		onclick="responsiveMenuPopUp()"> <i class="fa fa-bars"></i>
	</a>
</div>

<script>
	/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
	function responsiveMenuPopUp() {
		var x = document.getElementById("topNav");
		if (x.className === "topnav w3-card-4") {
			x.className += " responsive";
		} else {
			x.className = "topnav w3-card-4";
		}
	}

	window.onresize = function() {
		var x = document.getElementById("topNav");
		x.className = "topnav w3-card-4";

	}
</script>


