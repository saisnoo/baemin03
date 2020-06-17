<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>

<c:forEach var="dto" items="${orderList}">
<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<strong><font size="6">${dto.orderDate}</font></strong>
				<input type="hidden" value="${dto.no}">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 100px; padding: 0px;">
				<div class="count3" style="display: none;">${dto.status}</div>
			</div>
			<!-- 오른쪽-->
			
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴  ${dto.count}개]</strong> &nbsp;${dto.name}
					</div>
					<div class="w3-col">주문번호: ${dto.no}</div>
					<div class="w3-col">전화번호: ${dto.tel}</div>
				</div>
				<div class="w3-row">${dto.addr} ${dto.addr2}</div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding">${dto.menu_String}</div>
		</div>
		<!-- 하단 컨테이너 끝-->
	</div>
</div>
</c:forEach>