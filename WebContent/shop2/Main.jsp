<%@page import="com.baemin.orderlist.OrderListDAO"%>
<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@page import="com.baemin.menu.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%

request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");
	
	if(session.getAttribute("id")==null){
		response.sendRedirect("../index.jsp");
	}else{
	
	
	
	System.out.println(session.getAttribute("no"));
	Object no=session.getAttribute("no");
	 int shop_No=Integer.parseInt(no+""); 
	 MenuDAO menudao=MenuDAO.getInstance();
	 ShopDAO shopdao=ShopDAO.getInstance();
	 ShopDTO shopdto=shopdao.getShopInfo(shop_No);
	 OrderListDAO orderlistdao=OrderListDAO.getInstance();
	 int max_no = orderlistdao.getMaxNoOfShop_No(shop_No);
	 
	 
%>
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Main.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - jquery 3.4.1 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	height: 700px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

.tablinks {
	height: 100px;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border-left: none;
	height: 700px;
	width: 100%;
}

.tabcontent2 {
	display: none;
}

.scroll-box {
	overflow-y: auto;
}
 .searchmenu {
        	height:200px;
        	width:70%;
        	overflow-y: auto;
        }
</style>
<script>


	// 스크립트
	window.onload = function() {
                    		$("#tab1").load("NewOrderList.jsp");
                    		$("#tab2").load("BaesongList.jsp");
                    		$("#tab3").load("EndList.jsp");
                    		$("#tab4").load("CancleList.jsp");
                    		$("#SM").load("ShopManage.jsp");
                    	}
	
	
	
</script>
<script type="text/javascript">
$(function(){
	
	//$("#take_overbtn").click(function(){
		//$('input[name="estimated_time"]').removeAttr('checked');
		//$(".estimated_time").arrt(checked,false);
		//$("#take_over").modal("hide");
//	})

});
function tabtab2load(){
	$("#SM").load("ShopManage.jsp");
	openTab2(event, 'tabtab2');
	setTimeout(function() {
		document.getElementById("defaultOpen2").click();
		}, 800);
}
</script>
</head>
<body>


<input type="hidden" name="max_no" value="<%=max_no %>">
<input type="hidden" name="max_no2" value="0">
 <div class="sw-topnav-margin">
        &nbsp;
    </div>

<div class="sw-center">
        <!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
        <div class="sw-container-1200">
            <div class="w3-container">
                <!-- 3 main content start here!!!----------------------------------------------------------- -->

                <div class="w3-row w3-black">
                    <a href="#" class="w3-button">
                        <h3>배달의 민족</h3>
                    </a>
                </div>
                <div class="w3-row w3-gray">
                    <div class="w3-quarter tablink2">
                        <button onclick="openTab2(event, 'tabtab1')" id="jumoontab" class="w3-button w3-block w3-baemint w3-border" >
                            <h4>주문접수</h4>
                        </button>
                    </div>
                    <div class="w3-quarter tablink2">
                        <button onclick="openTab2(event, 'tabtab2')" id="defaultOpen2" class="w3-button w3-block w3-black w3-border">
                            <h4>매장관리</h4>
                        </button>
                    </div>
                     <div class="w3-quarter tablink2">
                        <button onclick="openTab2(event, 'tabtab3')" id="defaultOpen3" class="w3-button w3-block w3-black w3-border">
                            <h4>매장리뷰</h4>
                        </button>
                    </div>
                </div>
              <div id="tabtab1" class="w3-row w3-gray tabcontent2">         
                <div class="tab w3-col" style="width: 100px;">
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab1')" id="defaultOpen">
                            접수대기<br /><strong id="NewOrderCount"></strong>
                        </button>
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab2')">
                            배달중<br /><strong id="BaeSongCount"></strong>
                        </button>
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab3')">
                            완료<br /><strong id="EndCount"></strong>
                        </button>
                          <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab4')">
              	취소내역<br /><strong id="CancleCount"></strong>
                        </button>
                    </div>
			   
                
               <div class="w3-rest w3-white scroll-box">
               <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
               <div id="tab1" class="tabcontent scroll-box">    
			            
			   </div>
			    <div id="tab2" class="tabcontent scroll-box">
			    
			    </div>
			    <div id="tab3" class="tabcontent scroll-box">
			    
			    </div>
			    <div id="tab4" class="tabcontent scroll-box">
			    
			    </div>
				</div>
				</div>
				<div id="SM">
				<jsp:include page="ShopManage.jsp"/>
				</div>
				<div id="tabtab3" class="w3-cyan tabcontent2">
				<%@include file="../notice/NoticeList.jsp" %>
				</div>
				</div>
				</div>
				</div>
				
 <div class="modal fade take_over" id="take_over" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">주문 접수</h3>
        </div>
        <div class="modal-body">
        
			 <!-- 글번호입력 -->
			    <label for="writer">예상시간</label><hr>
			 <input type="text" id="order_no1" name="order_no1">
			 <input type="radio" class="estimated_time" name="estimated_time" value="30" >30분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="40" >40분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="50" >50분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="60" >60분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="70" >70분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="80" >80분<br>
			 <input type="radio" class="estimated_time" name="estimated_time" value="90" >90분<br>
			 
			 <!-- 
			    <select name="estimated_time">
			    <option value="" selected disabled hidden>배달예상시간 선택</option>
			    <option value="30">30분후</option>
			    <option value="40">40분후</option>
			    <option value="50">50분후</option>
			    <option value="60">60분후</option>
			    <option value="70">70분후</option>
			    <option value="80">80분후</option>
			    </select>
			     -->
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="take_overbtn" data-dismiss="modal">접수</button>
			  <button type="reset" class="btn btn-default">새로입력</button>
			  <button type="button" class="btn btn-default cancelBtn recan" data-dismiss="modal"  id="take_cancle">취소</button>
			</div>
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>

<div class="modal fade jumoon_calcel" id="jumoon_calcel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">주문 취소</h3>
        </div>
        <div class="modal-body">
        
			 <!-- 글번호입력 -->
			    <label for="writer">취소사유</label><br>
			    <input type="text" id="order_no2" name="order_no2">
			    
			    <input type="radio" class="whyCancel" name="whyCancel" value="재료소진으로 인한 취소" checked>재료소진으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel" value="마감시간으로 인한 취소">마감시간으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel" value="배달원부족으로 인한 취소">배달원부족으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel" value="거리에 따른 취소">거리에 따른 취소<br>
				
				<!-- 			    
			    <select>
			    <option name="whyCancel" value="" selected disabled hidden>취소사유</option>
			    <option name="whyCancel" value="재료소진으로 인한 취소">재료소진으로 인한 취소</option>
			    <option name="whyCancel" value="마감시간으로 인한 취소">마감시간으로 인한 취소</option>
			    <option name="whyCancel" value="배달원부족으로 인한 취소">배달원부족으로 인한 취소</option>
			    <option name="whyCancel" value="거리에 따른 취소">거리에 따른 취소</option>
			    </select>
			     -->
	
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="jumoon_calcel_btn" data-dismiss="modal">접수</button>
			  <button type="button" class="btn btn-default cancelBtn recan" data-dismiss="modal" id="take_cancle2" >취소</button>
			</div> 
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>

<div class="modal fade jumoon_calcel" id="jumoon_calcel1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">주문 취소</h3>
        </div>
        <div class="modal-body">
      
			 <!-- 글번호입력 -->
			    <label for="writer">취소사유</label><br>
			    <input type="radio" class="whyCancel" name="whyCancel2" value="재료소진으로 인한 취소" checked>재료소진으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel2" value="마감시간으로 인한 취소">마감시간으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel2" value="배달원부족으로 인한 취소">배달원부족으로 인한 취소<br>
			    <input type="radio" class="whyCancel" name="whyCancel2" value="거리에 따른 취소">거리에 따른 취소<br>
				
				<!-- 			    
			    <select>
			    <option name="whyCancel" value="" selected disabled hidden>취소사유</option>
			    <option name="whyCancel" value="재료소진으로 인한 취소">재료소진으로 인한 취소</option>
			    <option name="whyCancel" value="마감시간으로 인한 취소">마감시간으로 인한 취소</option>
			    <option name="whyCancel" value="배달원부족으로 인한 취소">배달원부족으로 인한 취소</option>
			    <option name="whyCancel" value="거리에 따른 취소">거리에 따른 취소</option>
			    </select>
			     -->
	
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="jumoon_calcel_btn2" data-dismiss="modal">접수</button>
			  <button type="button" class="btn btn-default cancelBtn recan" data-dismiss="modal" id="take_cancle3" >취소</button>
			</div> 
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>



      <jsp:include page="../sw_css/topnav.jsp" />

	
	      <script>
          var	max_no2=0;                    	
          var max_no= $(":input:hidden[name=max_no]").val();
                    function openTab(evt, tabName) {
                       if(tabName=="tab2"){
                    	   $("#tab2").load("BaesongList.jsp");
                   		
                       }else if(tabName=="tab3"){
                    	   $("#tab3").load("EndList.jsp"); 
                       }else if(tabName=="tab4"){
                    	   $("#tab4").load("CancleList.jsp"); 
                       }
                    	
                    	var i, tabcontent, tablinks;
                        tabcontent = document.getElementsByClassName("tabcontent");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent[i].style.display = "none";
                        }
                        tablinks = document.getElementsByClassName("tablinks");
                        for (i = 0; i < tablinks.length; i++) {
                            tablinks[i].className = tablinks[i].className.replace(
                                " w3-white",
                                ""
                            );
                        }
                        document.getElementById(tabName).style.display = "block";
                        evt.currentTarget.className += " w3-white";
                    }

                    function openTab2(evt, tab2Name) {
                    	
                        // Declare all variables
                        var i, tabcontent2, tablink2;

                        // Get all elements with class="tabcontent" and hide them
                        tabcontent2 = document.getElementsByClassName("tabcontent2");
                        for (i = 0; i < tabcontent2.length; i++) {
                            tabcontent2[i].style.display = "none";
                        }

                        // Get all elements with class="tablink2" and remove the class "active"
                        tablink2 = document.getElementsByClassName("tablink2");
                        for (i = 0; i < tablink2.length; i++) {
                            tablink2[i].className = tablink2[i].className.replace(
                                " w3-baemint",
                                ""
                            );
                        }

                        // Show the current tab, and add an "active" class to the button that opened the tab
                        document.getElementById(tab2Name).style.display = "block";
                        evt.currentTarget.className += " w3-baemint";
                    }

                    // Get the element with id="defaultOpen" and click on it
                    document.getElementById("defaultOpen").click();
                    document.getElementById("jumoontab").click();
                    
                    
                    $(function(){
                    	
                    	
                    	function reload(){
                    		reload2();
                    		//$("#tab1").load("NewOrderList.jsp");
                    		//$("#tab2").load("BaesongList.jsp");
                    		//$("#tab3").load("EndList.jsp");
                    		countcount();
                    		//$("#tabtab2").load("ShopManage.jsp");
                    		
                     		//document.getElementById("defaultOpen").click();
                    		//document.getElementById("jumoontab").click(); 
                    	}
                    	function load(){
                    		$("#tab1").load("NewOrderList.jsp");
                    	}
                    	
                    	setInterval(reload, 1000);
                    	setTimeout(load,1000);
                    	setTimeout(load,2000);
                    	setTimeout(load,3000);
                    	setTimeout(load,4000);
                    });
                    var audio = new Audio();
                    audio.src = "./baeminAlarm.mp3";
                    
                    function reload2(){
                    	
                    	console.log("reload2 = > "+max_no+"/"+max_no2);
                    	var data={
                    			max_no:max_no
                    	}
                    	$.ajax({
                			type : "post",
                			url : "Reload.jsp",
                			//data : JSON.stringify(reply),
                			 data : data, 
                			async : false,
                			//리턴 되어 돌려 받는 데이터의 타입
                			dataType: "json" ,
                			//기본값이므로 삭제 가능
                			contentType : "application/x-www-form-urlencoded; charset=utf-8",
                			
                			success : function(result){
                				max_no2=result;
                				if(max_no!=max_no2){
                					max_no=max_no2;
                				$("#tab1").load("NewOrderList.jsp");
                				audio.play();
                				}

                			},
                			error : function(xhr,status,error){
                				console.log("주문리스트창 리로드 실패");
                			}//error의 끝
                			
                		});//ajax의 끝
                		
                    }
                    function countcount(){
                		var a = document.getElementsByClassName("count0").length;
                		var a1 = document.getElementsByClassName("count1").length;
                		var b = document.getElementsByClassName("count2").length;
                		var c = document.getElementsByClassName("count3").length;
                		var d = document.getElementsByClassName("count4").length;
                		//console.log(a +"/"+ a1);
                		document.getElementById("NewOrderCount").innerText=(a+"/"+a1);
                		document.getElementById("BaeSongCount").innerText=(b);
                		document.getElementById("EndCount").innerText=(c);
                		document.getElementById("CancleCount").innerText=(d);
                    }
   					                 
                    
                </script>
  <div class="modal fade check_viewmenu" id="check_viewmenu" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">주문 메뉴 표시 유무</h3>
        </div>
        <div class="modal-body">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <label for="writer">주문 메뉴 표시 유무</label><br>
			    <input type="text" id="no5" name="no5" value="">
			    <input type="text" id="status5" name="status5" value="">
			    
			    <span id="status_check">123</span>
			    </div>
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="check_viewmenu_btn" data-dismiss="modal">변경</button>
			</div> 
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>
    <div class="modal fade add_menu" id="add_menu" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">주문 메뉴 표시 유무</h3>
        </div>
        <div class="modal-body">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <table>
			    <tr>
			    <td>메뉴이름</td>
			    <td><input type="text" name="menuName"></td>
			    </tr>
			    <tr>
			    <td>메뉴카테고리</td>
			    <td><input type="text" name="menuCategory"></td>
			    </tr>
			    <tr>
			    <td>메뉴설명</td>
			    <td><input type="text" name="menuEx"></td>
			    </tr>
			    <tr>
			    <td>메뉴가격</td>
			    <td><input type="text" name="menuPrice"></td>
			    </tr>
			    </table>
			    </div>
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="add_menu_btn">추가</button>
			  <button type="button" class="btn btn-default cancelBtn recan" data-dismiss="modal" id="take_cancle4" >닫기</button>
			</div> 
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>
  <script>
  $("#take_cancle4").click(function(){
  	작성해야된다.
  });
	// 스크립트
	//데이터를 변경하는 함수 -update	
	 $("#add_menu_btn").click(function(){
		 var menuName = $(":input:text[name=menuName]").val();
		 var menuCategory = $(":input:text[name=menuCategory]").val();
		 var menuEx = $(":input:text[name=menuEx]").val();
		 var menuPrice = $(":input:text[name=menuPrice]").val();
		 console.log(menuName+"/"+menuCategory+"/"+menuEx+"/"+menuPrice);
		 var data={
				 menuName:menuName,
				 menuCategory:menuCategory,
				 menuEx:menuEx,
				 menuPrice:menuPrice
			}
		 $.ajax({
				type : "post",
				url : "AddMenuPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				async : false,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("메뉴추가 완료");
					$(":input:text[name=menuName]").val("");
					 $(":input:text[name=menuCategory]").val("");
					 $(":input:text[name=menuEx]").val("");
					 $(":input:text[name=menuPrice]").val("");
				},
				error : function(xhr,status,error){
					console.log("메뉴추가 실패");
				}//error의 끝
				
			});//ajax의 끝*/
	 });
	 
	
	 $("#take_overbtn").click(function(){

		 var estimated_time = $(":input:radio[name=estimated_time]:checked").val();
		 var orderList_No = $(":input:text[name=order_no1]").val();
			console.log("주문접수버튼 클릭 ="+orderList_No);
		 
		 var data={
				orderList_No:orderList_No,
				estimated_time:estimated_time
		}
		//alert(JSON.stringify(reply));
		//ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기.
		$.ajax({
			type : "post",
			url : "CheckOrderPro.jsp",
			//data : JSON.stringify(reply),
			data : data,
			async : false,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType: "text" ,
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result,status,xhr){
				console.log("주문접수 완료");
				

			},
			error : function(xhr,status,error){
				console.log("주문접수 실패");
			}//error의 끝
			
		});//ajax의 끝*/
		// $("#take_over").modal("hide");
		
	}); 

	
	
	
	 $("#jumoon_calcel_btn").click(function(){
		 console.log("주문접수버튼 클릭 ="+orderList_No);
		 var whyCancel = $(":input:radio[name=whyCancel]:checked").val();
		 var orderList_No = $(":input:text[name=order_no2]").val();
		 var data={
				//항목이름: 값(변수)
			//	no:no,
				//rno:rno,
			
				orderList_No:orderList_No,
				whyCancel:whyCancel
		}
		//alert(JSON.stringify(reply));
		//ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기.
		$.ajax({
			type : "post",
			url : "CancelOrderPro.jsp",
			//data : JSON.stringify(reply),
			data : data,
			//리턴 되어 돌려 받는 데이터의 타입
			dataType: "text" ,
			//기본값이므로 삭제 가능
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(result,status,xhr){
				console.log("취소접수 완료");
				$("#tab1").load("NewOrderList.jsp");
			},
			error : function(xhr,status,error){
				console.log("취소접수 실패");
			}//error의 끝
			
		});//ajax의 끝*/
		 
	}); 
	 $("#jumoon_calcel_btn2").click(function(){
		 var whyCancel = $(":input:radio[name=whyCancel]:checked").val();
		 var orderList_No = $(":input:text[name=order_no2]").val();
		 
			console.log("이유=" + whyCancel);
			
			 
			 var data={
					//항목이름: 값(변수)
				//	no:no,
					//rno:rno,
				
					orderList_No:orderList_No,
					whyCancel:whyCancel
			}
			//alert(JSON.stringify(reply));
			//ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기.
			$.ajax({
				type : "post",
				url : "CancelOrderPro.jsp",
				//data : JSON.stringify(reply),
				data : data,
				//리턴 되어 돌려 받는 데이터의 타입
				dataType: "text" ,
				async : false,
				//기본값이므로 삭제 가능
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				success : function(result,status,xhr){
					console.log("취소접수 완료");
					$("#tab2").load("BaesongList.jsp");
				},
				error : function(xhr,status,error){
					console.log("취소접수 실패");
				}//error의 끝
				
			});//ajax의 끝*/
		});
	 $("#check_viewmenu_btn").click(function(){
		 var menu_no = $(":input:text[name=no5]").val();
		 var menu_status = $(":input:text[name=status5]").val();
		 console.log("check_viewmenu2 = "+menu_no + "/"+ menu_status);
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
					tabtab2load();
					
					
				},
				error : function(xhr,status,error){
					console.log("menuStatus 변경 실패");
				}//error의 끝
				
			});//ajax의 끝*/
		});	
	

</script>
  <%}%>

</body>
</html>