<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../util/ContextPath.jsp" %>

<c:if test="${result==1}">
	<script>
		alert("회원정보 수정 성공");
	</script>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/memberShop/MyPageShop.do">
</c:if>

<c:if test="${result==0}">
	<script>
		alert("회원정보 수정 실패");
	</script>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/memberShop/MyPageShop.do">
</c:if>