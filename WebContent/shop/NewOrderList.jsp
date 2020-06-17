<%@page import="com.baemin.orderlist.OrderListDTO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../util/ContextPath.jsp"%>

<c:forEach var="dto" items="${orderList}">

<!-- 접수대기 리스트 -->
<div class="w3-section">
	<div class="w3-card w3-padding">
		<!-- 상단 컨테이너 끝 -->
		<div class="w3-row">
			<!-- 왼쪽 -->
			<div class="w3-col w3-container w3-left" style="width: 150px;">
				<strong><font size="6">${dto.orderDate}</font></strong>
				<input type="hidden" value="${dto.no}">
				<input id="shopNo" type="hidden" value="${dto.shop_NO}">
			</div>
			<!-- 왼쪽 끝 -->

			<!-- 오른쪽-->
			<div class="w3-col w3-container w3-right"
				style="width: 200px; padding: 0px;">
				<c:if test="${dto.status==0 }">
				<button class="w3-button w3-baemint h100" onclick="CookBtn(this)">주문접수<br>조리시작</button>
				<div class="count0" style="display:none;">${dto.status}</div>
				</c:if>
				<c:if test="${dto.status==1 }">
				
				<button class="w3-button w3-baemint h100" onclick="baesongBtn(this)">배달출발</button>
				<div class="count1" style="display:none;">${dto.status}</div>
				</c:if>
				<button class="w3-button w3-red h100" onClick="cancelBtn(this)">주문취소</button>
			</div>
			<!-- 오른쪽-->
			<!-- 가운데 -->
			<div class="w3-rest w3-container">
				<div class="w3-row">
					<div class="w3-col">
						<strong>[메뉴 ${dto.count}개]</strong> &nbsp;${dto.name}
					</div>
					<div class="w3-col">주문번호: ${dto.no}</div>
					<div class="w3-col">전화번호: ${dto.tel}</div>
				</div>
				<div class="w3-row">${dto.addr} ${dto.addr2} </div>
			</div>
			<!-- 가운데 끝 -->
		</div>
		<!-- 상단 컨테이너 끝 -->
		<!-- 하단 컨테이너 -->
		<div>
			<div class="w3-row w3-padding">
			${dto.menu_String}
			</div>
			<div class="w3-row w3-padding">${dto.comment }</div>
		</div>
		<!-- 하단 컨테이너 끝-->
	</div>
</div>
<!-- 접수대기 리스트 끝 -->
</c:forEach>

<script>
	// 스크립트

</script> 