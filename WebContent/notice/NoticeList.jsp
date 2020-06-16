<%@page import="com.baemin.notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("utf-8");
	System.out.println("------ Notice.jsp --- ");

	NoticeDAO dao = NoticeDAO.getInstance();
	List<NoticeDTO> list = dao.getList();
	request.setAttribute("list", list);
%>

<table class="w3-table w3-bordered" id="myTable">

	<tr>
		<th><div class="th-text">#</div></th>
		<th width="55%"><div class="th-text">공지글제목</div></th>
		<th width="45%"><div class="th-text">공지일</div></th>
	</tr>

	<!-- 반복의 시작 -->
	<c:forEach items="${ list }" var="dto">
		<tr class="contentLine" onclick="viewNotice(this)">
			<td class="noticeNo">${dto.no }</td>
			<td>${dto.title }</td>
			<td>${dto.startDate }~<br> ${dto.endDate }
			</td>
		</tr>
	</c:forEach>
	<!-- 반복의 끝 -->

</table>
