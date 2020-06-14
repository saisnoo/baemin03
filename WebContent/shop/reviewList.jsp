<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.baemin.review.ReviewDTO"%>
<%@page import="com.baemin.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------reviewList.jsp");
	int shopNo = Integer.parseInt((String) session.getAttribute("shopNo"));
	
	ReviewDAO dao = ReviewDAO.getInstance();
	List<ReviewDTO> reviewList=dao.getListByShop(shopNo,100);
%>

<div class="w3-section">
	<!-- 왼쪽 half -->
	<div class="w3-half">
		<div class="w3-row">
			<div class="w3-col" style="width: 150px">
				<div class="w3-panel w3-xlarge w3-black w3-display-container">평균별점</div>
				<div>별점</div>				
			</div>
		</div>

		<div class="w3-row">
			<div class="w3-panel w3-black w3-xxlarge w3-display-container">지난
				24시간 판매정보</div>
			<div class="w3-col w3-margin c">
				<b class="w3-xlarge">총 판매건수 : </b>&nbsp;&nbsp;<b class="w3-xlarge"
					id="countSum"></b>
			</div>
			<div class="w3-col w3-margin">
				<b class="w3-xlarge">총 판매액수 : </b>&nbsp;&nbsp;<b class="w3-xlarge"
					id="countPrice"></b>
			</div>
		</div>
	</div>
	<!-- 왼쪽 half 끝 -->
	<!-- 오른쪽 half -->
	<div class="w3-half w3-padding">
		<div class="w3-row">
			<div
				class="w3-panel w3-black w3-text-white w3-large w3-display-container">
				<span class="w3-quarter">번호</span> <span class="w3-quarter">별점</span>
				<span class="w3-quarter">등록일</span> <span class="w3-quarter">내용</span>
			</div>
		</div>
		<div id="reviewCell">
			<table class="w3-table-all w3-margin-bottom">

	<%
		for(int i=0;i<reviewList.size();i++){
			ReviewDTO dto=reviewList.get(i);
			int star=dto.getRank();
	%>
				<tr class="w3-panel w3-dark-grey w3-round">
					<td style="width:10%"><%=dto.getMember_no()%></td>
					<td style="width:30%">
					<!-- 별점 이미지 -->
					<span width="100px">
					 <%
                    	if(star==1){
                    	%>
						<div>
							<img width="100px" src="../source/img/star_yellow_1.png"/>
						</div> <%
                    	}else if(star==2){
                    		%>
						<div>
							<img width="100px" src="../source/img/star_yellow_2.png"/>
						</div> <%	
                    	}else if(star==3){
                    		%>
						<div>
							<img width="100px" src="../source/img/star_yellow_3.png"/>
						</div> <%
                    	}else if(star==4){
                    		%>
						<div>
							<img width="100px" src="../source/img/star_yellow_4.png"/>
						</div> <%
                    	}else if(star==5){
                    		%>
						<div>
							<img width="100px" src="../source/img/star_yellow.png"/>
						</div> <%
                    	}
                    %>
				
						</span>					
						</td>
				<!-- 별점 이미지 -->
					
					<td style="width:30%"><%=dto.getRegDate()%></td>
					<td style="width:30%"><%=dto.getContent() %></td>
				</tr>
				<%
		}//for end
				%>
			</table>
		</div>
	</div>
	<!-- 오른쪽 half -->
</div>
<!-- 섹션끝 -->
<script>

</script>