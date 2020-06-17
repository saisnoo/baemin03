<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>

<div id="result" style="display: none;">${result}</div>

<script>
	window.onload = function() {

		var result = document.getElementById("result").innerText.trim().length;
		console.log("result=" + result);

		if (result > 5) {
			alert("로그인 성공!");
		} else {
			alert("로그인 실패!");
		}

		location.href = "${ctxpath}/baemin/Main.do";
	}
</script>