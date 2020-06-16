<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.menu.MenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baemin.menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		alert(${shopdto.shopStatus});
		if (${shopdto.shopStatus} == 0) {
			$("#magam").hide();
			$("#addmenu").show();
			$("#shopOpen").show();

		}
		if (${shopdto.shopStatus} == 1) {
			$("#magam").show();
			$("#addmenu").hide();
			$("#shopOpen").hide();
		}

	});

</script>

<!-- 탭목록 -->
<div id="tabtab2" class="tabcontent2">
	<div class="w3-container searchmenu w3-section"
		style="overflow-y: auto;">



		<div class="w3-row">
			<div class="w3-right">
				<button type="button" class="w3-button w3-baemint" id="shopOpen">영업시작</button>
				<button type="button" class="w3-button w3-red" id="magam">영업종료</button>
				<button type="button" class="w3-button w3-baemint" id="addmenu"
					onclick="addmenu(this)" data-toggle="modal" data-target="#add_menu">메뉴추가</button>
				<input type="hidden" name="addmenu_no" value="${shopNo}">
			</div>
		</div>







		<div class="w3-row w3-section">

			<div class="w3-col w3-left" style="width: 120px;">
				<select class="w3-margin-right w3-quart" id="selectval"
					style="height: 40px;">
					<option value="0">메뉴이름</option>
					<option value="1">메뉴카테고리</option>
					<option value="2">메뉴가격</option>
				</select>
			</div>

			<div class="w3-rest">
				<input class="w3-input w3-border" type="text"
					placeholder="검색상품" id="myInput" onkeyup="myFunction()">
			</div>

		</div>


		<table class="w3-table-all">
			<!-- 검색창 리스트 -->
			<tr class="w3-baemint" >
				<th style="width: 30%">이름</th>
				<th style="width: 30%">카테고리</th>
				<th style="width: 25%">가격</th>
				<th style="width: 15%">표시유무</th>
			</tr>
		</table>
		<div class="scroll-box" style="height: 380px;">
			<table class="w3-table" id="myTable">
				<c:forEach var="menudto" items="${list}">
				<c:if test="${shopdto.ShopStatus()==0 }">
				<tr class="w3-hover-black check_view" data-toggle="modal"
					data-tar="#check_viewmenu" style="cursor: pointer;">
					</c:if>
				
				<c:if test="${shopdto.ShopStatus()==1 }">
				
				<tr class="scroll-box check_view">
				</c:if>
					<td style="width: 30%">${menudto.MenuName()}
					<input type="hidden" value="${menudto.No()}" id="menu_no">
					<input type="hidden" value="${menudto.MenuStatus()}" id="menu_status"></td>
					<td style="width: 30%">${menudto.MenuCategory()}</td>
					<td style="width: 25%">${menudto.MenuPrice()}</td>
				<c:if test="${menudto.MenuStatus()==1 }">
					<td	style="text-align:center; width: 15%">O</td>
				</c:if>
				<c:if test="${menudto.MenuStatus()==0 }">
					<td	style="text-align:center; color:red; width: 15%">X</td>
				</c:if>
				</tr>
				
					</c:forEach>
				<!-- 검색 리스트 끝 -->
			</table>
		</div>
	</div>
</div>
<!-- 탭목록 -->


<script>
	if (${shopdto.ShopStatus()==0}) {
		$(function() {
			$(".check_view")
					.click(
							function() {

								var menu_no = $(this).find("#menu_no").val();
								var menu_status = $(this).find("#menu_status")
										.val();
								//document.getElementById("status").value = menu_status;
								document.getElementById("no5").value = menu_no;
								document.getElementById("status5").value = menu_status;
								console.log("check_view = " + menu_no);

								if (menu_status == 1) {
									document.getElementById("status_check").innerText = "메뉴표시중";
									
								} else if (menu_status == 0) {
									document.getElementById("status_check").innerText = "메뉴표시 안하는중";
								}

							});

		});
	}
</script>

<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		tk = document.getElementById("selectval").value;
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[tk];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	$("#shopOpen").click(function() {
		console.log("shopopen이 눌러졌다");
		var shopNo =${shopdto.No()};
		var shopstatus =${shopdto.ShopStatus()};
		$.ajax({
			type : "post",
			url : "ShopOpenPro.jsp",
			//data : JSON.stringify(reply),
			data : {
				shopNo : shopNo,
				shopstatus : shopstatus
			},
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType : "text",
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result, status, xhr) {
				console.log(" 오픈 완료");
				//$("#SM").load("ShopManage.jsp");
				tabtab2load();

			},
			error : function(xhr, status, error) {
				console.log("오픈 실패");
			}//error의 끝

		});//ajax의 끝*/
	});
	$("#magam").click(function() {
		console.log("shopmagam이 눌러졌다");
		var shopNo =${shopdto.No()}
	;
		var shopstatus =${shopdto.ShopStatus()}
	;
		$.ajax({
			type : "post",
			url : "ShopOpenPro.jsp",
			//data : JSON.stringify(reply),
			data : {
				shopNo : shopNo,
				shopstatus : shopstatus
			},
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType : "text",
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result, status, xhr) {
				console.log("마감 완료");
				//$("#SM").load("ShopManage.jsp");
				tabtab2load();

			},
			error : function(xhr, status, error) {
				console.log("마감 실패");
			}//error의 끝

		});//ajax의 끝*/
	});
</script>
</div>