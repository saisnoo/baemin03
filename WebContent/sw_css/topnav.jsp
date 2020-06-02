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
	<a href="main.jsp" class="w3-red active">트-위터 </a>

	<%
		Object memberNo__ = session.getAttribute("memberNo");

		System.out.println("memberNo__=" + memberNo__);

		int memberNo_ = -1;

		if (memberNo__ == null) {
			System.out.println("로그인 없음");
			memberNo__ = "-1";
		} else {
			memberNo_ = (int) memberNo__;
			System.out.println("로그인 있음==" + memberNo_ + "번 유저");
		}

		System.out.println("memberNo_=" + memberNo_);

		int memberNo = memberNo_;



		if (memberNo < 0) {
	%>
	<div class="sw-container-400">
		<input type="text" id="id" placeholder="input id" class="w3-input"
			style="height: 25px;">
	</div>
	<div class="sw-container-400">
		<input type="text" id="pw" placeholder="input pw" class="w3-input"
			style="height: 25px;">
	</div>
	<div class="w3-row w3-center" style="padding: 12px; margin: 0px;">
		<!-- ----------------------------------------------------------------------------- -->
		<input type="button" class="w3-tag w3-center" id="loginBtn" value="로그인"
			onclick="loginBtn()" style="width: 100px;">
		<!-- ----------------------------------------------------------------------------- -->
		<input type="button" class="w3-tag w3-center" id="joinBtn" value="회원가입"
			onclick="joinBtn()" style="width: 100px;">
		<!-- ----------------------------------------------------------------------------- -->

		<form action="loginPro.jsp" method="post" name="loginForm">
			<input type="hidden" name="id" id="idid"> <input type="hidden"
				name="pw" id="pwpw">
		</form>
	</div>
	<%
		} else {
	%>
	<a> <strong><%=memberNo%></strong>님 환영합니다.
	</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="memberInfo.jsp">마이페이지</a>
	<!-- -------------------------------------------------------------------------- -->
	<a href="logout.jsp">로그아웃</a>
	<%
		}
	%>
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

	function loginBtn() {
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		alert(id + "+++" + pw);
		document.getElementById("idid").value = id;
		document.getElementById("pwpw").value = pw;
		var form = document.loginForm;
		form.submit();
	}

	function joinBtn() {
		location.href = "joinForm.jsp";
	}
</script>


