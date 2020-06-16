<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.baemin.review.ReviewDTO"%>
<%@page import="com.baemin.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="customtag" tagdir="/WEB-INF/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------reviewList.jsp");
	Object no=session.getAttribute("no");
	int shopNo=Integer.parseInt(no+""); 
	
	ReviewDAO dao = ReviewDAO.getInstance();
	List<ReviewDTO> reviewList=dao.getListByShop(shopNo,100);
	
	ShopDAO shopdao = ShopDAO.getInstance();
	ShopDTO shopdto = shopdao.getShopInfo(shopNo);
%>

<div class="w3-section">
	<!-- 왼쪽 half -->
	<div class="w3-half">
		<table class="w3-table">
			<tr>
				<td colspan="2">
					<div class="w3-panel w3-xlarge w3-baemint" style="margin-top: 0px;">평균별점</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><customtag:starRank
						rank="<%=shopdto.getRank()%>" width="210" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="w3-panel w3-xlarge w3-baemint" style="margin-top: 0px;">지난
						24시간 판매정보</div>
				</td>
			</tr>
			<tr>
				<td width="150px;"><b class="w3-xlarge">판매건수</b></td>
				<td><b class="w3-xlarge" id="countSum"></b></td>
			</tr>
			<tr>
				<td><b class="w3-xlarge">총 매출</b></td>
				<td><b class="w3-xlarge" id="countPrice"></b></td>
			</tr>

		</table>
	</div>
	<!-- 왼쪽 half 끝 -->
	<!-- 오른쪽 half -->
	<div class="w3-half w3-padding">
		<table id="reviewCell" class="w3-table">
			<tr id="reviewHead" class="w3-baemint">
				<td>회원번호</td>
				<td>별점</td>
				<td>등록일</td>
				<td>내용</td>
			</tr>
			<%
				for (int i = 0; i < reviewList.size(); i++) {
							ReviewDTO dto = reviewList.get(i);
							System.out.println(dto.toString());
			%>
			<tr style="border: 1px solid black;">
				<td style="width: 15%"><%=dto.getMember_no()%></td>
				<td style="width: 25%">
					<!-- 별점 이미지 --> <span width="100px"> <customtag:starRank
							rank="<%=(double) dto.getRank()%>" width="100" />
				</span>
				</td>
				<!-- 별점 이미지 -->
				<td style="width: 30%"><%=dto.getRegDate()%></td>
				<td style="width: 30%"><%=dto.getContent()%></td>
			</tr>
			<%
				}//for end
			%>
		</table>
	</div>
	<!-- 오른쪽 half -->
</div>
<!-- 섹션끝 -->
<script>
	
</script>