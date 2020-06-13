<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.baemin.review.ReviewDTO"%>
<%@page import="com.baemin.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------reviewList.jsp");
	int shopNo = Integer.parseInt((String) session
	.getAttribute("shopNo"));
	ReviewDAO dao = ReviewDAO.getInstance();
	
	//List<ReviewDTO> reviewList=dao.getReview(shopNo);
%>
<div class="w3-section">
	<!-- 왼쪽 half -->
	<div class="w3-half">
		<div class="w3-row">
			<div class="w3-col" style="width: 150px">
				<div class="w3-panel w3-black w3-display-container">평균별점</div>
				<div>별표시</div>
			</div>
		</div>

		<div class="w3-row">
			<div class="w3-panel w3-black w3-display-container">지난 24시간
				판매정보</div>
			<div class="w3-col">
				<b>판매건수</b> <b id="countSum"></b>

			</div>
			<div class="w3-col">
				<b>판매액수</b><b id="countPrice"></b>
			</div>
		</div>
	</div>
	<!-- 오른쪽 half -->
	<div class="w3-half">
		<div
			class="w3-panel w3-black w3-text-white w3-xlarge w3-display-container">
			리뷰리스트</div>
		<!-- 리뷰리스트창 -->
		<div class="">
<%-- 		<%
		for(int i=0;i<reviewList.size();i++){
			ReviewDTO dto=reviewList.get(i);

		%>
--%>
			<div class="w3-responsive">
				<table class="w3-table-all">
					<tr>
						<th>리뷰 고객번호</th>
						<th>별점</th>
						<th>등록일</th>
						<th>리뷰 내용</th>
					</tr>
					<tr>
<%-- 					<td><%=dto.getMember_no() %></td>
						<td><%=dto.getRank() %></td>
						<td><%=dto.getRegDate() %></td>
						<td><%=dto.getContent() %></td>
--%>
					</tr>
				</table>
			</div>
<%--	<%
		}
		%>
--%>
		</div>
		<!-- 리뷰리스트창 -->
	</div>
</div>
<!-- 섹션끝 -->
<script>
	
</script>