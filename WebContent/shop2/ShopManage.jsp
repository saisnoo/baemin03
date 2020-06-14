<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.menu.MenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baemin.menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------ShopManage.jsp");
Object no=session.getAttribute("no");
int shop_No=Integer.parseInt(no+""); 
System.out.println("shopmanage = " + shop_No);
MenuDAO menudao=MenuDAO.getInstance();
ShopDAO shopdao=ShopDAO.getInstance();
ShopDTO shopdto=shopdao.getShopInfo(shop_No);
List<MenuDTO> list=menudao.getListByShopNoStatusDesc(shop_No); 


ShopDTO shopdto2=shopdao.getShopInfo(shop_No);



%> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
if(<%=shopdto.getShopStatus()==0%>){
	$("#magam").hide();
	$("#addmenu").hide();
	$("#shopOpen").show();
	
}
if(<%=shopdto.getShopStatus()==1%>){
	$("#magam").show();
	$("#addmenu").show();
	$("#shopOpen").hide();
}


});
</script>   
   
<div id="tabtab2" class="w3-cyan tabcontent2">
       
                       <div class="container">
  <button type="button" class="btn btn-primary" id="shopOpen">영업시작</button>
  <button type="button" class="btn btn-success" id="magam">영업종료</button>
</div>     


                    <div class="w3-border" style="width:30%;float:left">
                    
                        <form action="aaaa" method="POST" name="menuInputForm">
                        <table>
                        <tr>
                        	<td colspan="2">
	                        <h1><strong>메뉴추가</strong></h1>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td><label>메뉴이름</label></td>
	                        <td><input type="text" name="menuName" id="menuName" placeholder="manuName"></td>
	                        </tr>
	                        <tr>
	                        <td><label>메뉴카테고리</label></td>
	                        <td><input type="text" name="menuCategory" id="menuCategory" placeholder="menuCate"></td>
	                       	</tr>
	                       	<tr>
	                       	<td><label>메뉴설명</label></td>
	                        <td><input type="text" name="menuEx" id="menuEx" placeholder="menuEx"></td>
	                        </tr>
	                        <tr>
	                        <td><label>메뉴가격</label></td>
	                        <td><input type="text" name="menuPrice" id="menuPrice" placeholder="Price"></td>
	                        </tr>
	                        <tr>
	                        <td colspan="2"><button type="button" id="addmenu">추가</button></td>
	                        </tr>
	                        </table>
                        </form>
                    </div>
                    
<div class="w3-container searchmenu" style="width:70%;float:right;">
<select style="width:25%;height:38px;float:left" id="selectval">
<option value="0">메뉴이름</option>
<option value="1">메뉴카테고리</option>
<option value="2">메뉴가격</option>
</select>				

  <input class="w3-input w3-border w3-padding" type="text" placeholder="검색상품" id="myInput" onkeyup="myFunction()" style="width:75%;float:right;">

  <table class="w3-table-all w3-margin-top" id="myTable">
    <tr>
      <th style="width:40%;">메뉴이름</th>
      <th style="width:30%;">메뉴카테고리</th>
      <th style="width:30%;">메뉴가격</th>
    </tr>
 <%
      for(int i=0;i<list.size();i++){
		MenuDTO menudto=list.get(i);     	
    %>
    <tr class="check_viewmenu" data-toggle="modal" data-target="#check_viewmenu">
      <td> <%=menudto.getMenuName() %>
      <input type="hidden" value="<%=menudto.getNo() %>" class="menu_no">
      <input type="hidden" value="<%=menudto.getMenuStatus() %>" class="menu_status">
      
      </td>
      <td><%=menudto.getMenuCategory() %></td>
      <td><%=menudto.getMenuPrice() %></td>
    </tr>
  <%
    }
  %> 
  </table>

</div>
<script>
$(function(){
	$(".check_viewmenu").click(function(){
		var menu_no= $(this).find(".menu_no").val();
		var menu_status= $(this).find(".menu_status").val();
		//document.getElementById("status").value = menu_status;
		document.getElementById("status_check").innerText = menu_status;
		console.log("check_viewmenu = "+menu_no);
	    if(menu_status==0){
	    	document.getElementById("status_check").innerText = "메뉴표시중";
	    }
	    else if(menu_status==1){
	    	document.getElementById("status_check").innerText = "메뉴표시 안하는중";
	    }
	    $("#check_viewmenu_btn").click(function(){
			console.log("check_viewmenu2 = "+menu_no);
			var data={
					menuno:menu_no,
					menustatus:menu_status
			}
			$.ajax({
				type : "post",
				url : "MenuStatusPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("menuStatus 변경 완료");
					/* $("#SM").load("ShopManage.jsp");
					openTab2(event, 'tabtab2'); */
					
					
				},
				error : function(xhr,status,error){
					console.log("menuStatus 변경 실패");
				}//error의 끝
				
			});//ajax의 끝*/
		});	
	
		$("#take_cancle3").click(function(){
			$('.modal').on('hidden.bs.modal', function (e) {
			    $(this).find('form')[0].reset()
			});
		});
		$('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset()
		});
		
		
	});
	
});

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


$("#shopOpen").click(function(){
	console.log("shopopen이 눌러졌다");
	var shop_no=<%=shopdto.getNo()%>;
	var shopstatus=<%=shopdto.getShopStatus()%>;
	$.ajax({
		type : "post",
		url : "ShopOpenPro.jsp",
		//data : JSON.stringify(reply),
		data : {
			shop_no:shop_no,
			},
		async : false,
		//리턴 되어 돌려 받는 데이터의 타입
		dataType: "text" ,
		//기본값이므로 삭제 가능
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		success : function(result,status,xhr){
			console.log(" 오픈 완료");
	$("#SM").load("ShopManage.jsp");
		},
		error : function(xhr,status,error){
			console.log("오픈 실패");
		}//error의 끝
		
	});//ajax의 끝*/
});
	$("#magam").click(function(){
		console.log("shopmagam이 눌러졌다");
		var shop_no=<%=shopdto.getNo()%>;
		var shopstatus=<%=shopdto.getShopStatus()%>;
		$.ajax({
			type : "post",
			url : "CheckOrderPro.jsp",
			//data : JSON.stringify(reply),
			data : {
				shop_no:shop_no,
				},
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType: "text" ,
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result,status,xhr){
				console.log("마감 완료");
		$("#SM").load("ShopManage.jsp");
			},
			error : function(xhr,status,error){
				console.log("마감 실패");
			}//error의 끝
			
		});//ajax의 끝*/
});	



</script>
</div>