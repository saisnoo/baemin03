<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.baemin.orderlist.Order_MenuDTO"%>
<%@page import="com.baemin.util.Ht2List"%>
<%@page import="com.baemin.orderlist.cart.CartMgr"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------CartContent.jsp");
%>

<%
	Object cart_shop_no_ob = session.getAttribute("cart_shop_no");
		System.out.println("cart_shop_no_ob=" + cart_shop_no_ob);
		String cart_shop_no_ = cart_shop_no_ob + "";
		cart_shop_no_ = cart_shop_no_.trim();
		System.out.println("cart_shop_no_=" + cart_shop_no_);

		int cart_shop_no = Integer.parseInt(cart_shop_no_);

		CartMgr cart = (CartMgr) session.getAttribute("cart");

		Hashtable<Integer, Order_MenuDTO> ht = cart.getCartList();

		List<Order_MenuDTO> list = Ht2List.ht2List(ht);
		request.setAttribute("list", list);
		System.out.println("list.size()");
		System.out.println(list.size());
		
		int totalPrice = 0;
		
		for(int i=0; i<list.size(); i++){
	int a = list.get(i).getCount();
	int b = list.get(i).getPrice();
	totalPrice += a*b;
		}
%>

<!-- 반복의 시작 -->
<!-- 3 main content start here!!!----------------------------------------------------------- -->
<c:forEach items="${list}" var="dto">
	<div class="w3-section cartRow">
		<div class="w3-row">
			<div class="w3-col w3-right" style="width: 60px;">
				<button type="button" class="w3-button"
					onclick="deleteFromCart(this)">삭제</button>
			</div>
			<strong class="w3-rest w3-left" style="margin: 8px;">${dto.menu_Name }</strong>
		</div>
		<div class="w3-cyan" style="display: none;">${dto.menu_No }</div>
		<div class="w3-left w3-margin-left w3-margin-right">
			<div class="w3-small" style="color: #8C8C8C; text-align: justify;">기본3인분
				들어있는 세트메뉴인데 아이들한테는 매울수도 있으니까 조심해서 먹이는게 좋을겁니다 경고했는데 맵다고 항의하면 니네집변기
				막힌다 ㅋㅋ</div>
		</div>
		<div class="w3-row">
			<div class="w3-col s6">
				<span class="w3-left" style="margin-top: 12px; margin-left: 10px;">${dto.price }</span>
				<span class="w3-left" style="margin-top: 12px; margin-left: 5px;">원</span>
			</div>
			<div class="w3-col s6 w3-margin-bottom">
				<div class="w3-bar w3-border w3-right"
					style="margin-top: 5px; margin-right: 5px; width: 140px;">
					<div class="w3-bar-item w3-button w3-left"
						onclick="countMinus(this)">-</div>
					<div class="w3-bar-item">${dto.count }</div>
					<div class="w3-bar-item w3-button w3-right"
						onclick="countPlus(this)">+</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<!-- 3 main content start here!!!----------------------------------------------------------- -->
<!-- 반복의 끝 -->
<div id="cart_shop_no"><%=cart_shop_no%></div>
<div id="cart_total"><%=totalPrice%></div>

<script>
	function countMinus(e) {
		console.log("---------------------");
		var a1 = e.parentNode.children[1].innerText;
		console.log(a1);
		var a2 = e.parentNode.parentNode.parentNode.parentNode.children[1].innerText;
		console.log(a2);

		var data = {
			// 항목이름 : 값(변수)
			protocol : 1,
			count : -1,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}
	function countPlus(e) {
		console.log("+++++++++++++++++++++");
		var a1 = e.parentNode.children[1].innerText;
		console.log(a1);
		var a2 = e.parentNode.parentNode.parentNode.parentNode.children[1].innerText;
		console.log(a2);

		var data = {
			// 항목이름 : 값(변수)
			protocol : 1,
			count : 1,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}
	function deleteFromCart(e) {
		console.log("****** delete *******");
		var a2 = e.parentNode.parentNode.parentNode.parentNode.children[0].children[1].innerText;
		console.log(a2);

		var data = {
			protocol : 2,
			menu_No : a2
		}
		aaaa(data);

		setTimeout(loadCartContent, 100);
	}

	function aaaa(ddd) {
		$.ajax({
			type : "post",
			url : "UpdateCartPro.jsp",
			//dateType : "json",
			//contentType : "application/json; charset=utf-8",
			data : ddd,
			success : function(result) {
				console.log("result");
				console.log(result);
			},
			error : function(data) {
				console.log(data);
			}
		});
	}

	//ajax로 댓글 보내는 함수
	function reply_write() {
		// form data >>  JSON 
		var data = {
			// 항목이름 : 값(변수)
			no : $("#no").val(),
			content : $("#content").val(),
			writer : $("#writer").val(),
			pw : $("#pw").val()
		}
		console.log(reply.no);
		// ajax +  post >> to SERVER
		$.ajax({
			type : "post",
			url : "replyWrite.jsp",
			//dateType : "json",
			//contentType : "application/json; charset=utf-8",
			data : data,
			success : function(result, status, xhr) {
				console.log("result");
				console.log(result);
			},
			error : function(data) {
				console.log(data);
			}
		});
	}
</script>