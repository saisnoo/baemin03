<%@page import="com.baemin.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../util/ContextPath.jsp" %>
<div id="result" style="display: none;">${result}</div>

<script>
	window.onload = function() {

		var result = document.getElementById("result").innerText.trim();
		console.log("result=" + result);

		result = result * 1;

		if (result > 0) {
			alert("로그인 성공!");
		} else {
			alert("로그인 실패!");
		}

		location.href = "${ctxpath}/baemin/Main.do";

	}
</script>