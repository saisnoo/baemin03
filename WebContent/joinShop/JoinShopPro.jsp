<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../util/ContextPath.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result==1}">
  <script>
   alert("회원가입 성공");
  </script>
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/index.html">
 </c:if>
 
<c:if test="${result==0}">
  <script>
   alert("회원가입 실패");
  </script>
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/index.html">
 </c:if>