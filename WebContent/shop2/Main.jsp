<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>




<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Main.jsp --- ");
	session.setAttribute("shop_No", "1");
	int jumooncount=0;
	int joricount=0;
	int deliverycount=0;
	int completecount=0;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
                    		$("#tab1").load("NewOrderList.jsp?shopNo=1");
                    		$("#tab2").load("BaesongList.jsp?shopNo=1");
                    		$("#tab3").load("EndList.jsp?shopNo=1");
                    		$("#SM").load("ShopManage.jsp");
                    	}
</script>
</head>
<body>
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
                    </div>
			   
                
               <div class="w3-rest w3-white scroll-box">
               <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
               <div id="tab1" class="tabcontent">    
			            
			   </div>
			    <div id="tab2" class="tabcontent">
			    
			    </div>
			    <div id="tab3" class="tabcontent">
			    
			    </div>
				</div>
				</div>
				<div id="SM">
				<jsp:include page="ShopManage.jsp"></jsp:include>
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
          	<form id="take_over_Form">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <label for="writer">예상시간</label><hr>
			 
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
			</form>
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="take_overbtn">접수</button>
			  <button type="reset" class="btn btn-default">새로입력</button>
			  <button type="button" class="btn btn-default cancelBtn recan"data-dismiss="modal"  >취소</button>
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
          	<form id="jumoon_calcel_Form">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <label for="writer">취소사유</label><br>
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
			</form>
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="jumoon_calcel_btn">접수</button>
			  <button type="button" class="btn btn-default cancelBtn recan" data-dismiss="modal"  >취소</button>
			</div> 
        </div>
      </div>
      <!-- Modal content end-->
    </div>
  </div>




      <div class="topnav w3-card-4" id="topNav">
            <a href="#" class="w3-baemint active">배달의 인종 </a>
            <!-- -------------------------------------------------------------------------- -->
            <a> <strong>(주)경영반점</strong> </a>
            <!-- -------------------------------------------------------------------------- -->
            <a href="#">내 정보</a>
            <!-- -------------------------------------------------------------------------- -->
            <a href="#">주문내역</a>
            <!-- -------------------------------------------------------------------------- -->
            <a href="#">로그아웃</a>
            <!-- -------------------------------------------------------------------------- -->
        
        </div>

	
	      <script>
                    function openTab(evt, tabName) {
                       if(tabName=="tab2"){
                    	   $("#tab2").load("BaesongList.jsp");
                   		
                       }else if(tabName=="tab3"){
                    	   $("#tab3").load("EndList.jsp"); 
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
                    		$("#tab1").load("NewOrderList.jsp");
                    		//$("#tab2").load("BaesongList.jsp");
                    		//$("#tab3").load("EndList.jsp");
                    		countcount();
                    		//$("#tabtab2").load("ShopManage.jsp");
                    		
                     		//document.getElementById("defaultOpen").click();
                    		//document.getElementById("jumoontab").click(); 
                    	}
                    	setInterval(reload, 3000);
                    	
                    	
                    });
                    function countcount(){
                		var a = document.getElementsByClassName("count0").length;
                		var a1 = document.getElementsByClassName("count1").length;
                		var b = document.getElementsByClassName("count2").length;
                		var c = document.getElementsByClassName("count3").length;
                		//console.log(a +"/"+ a1);
                		document.getElementById("NewOrderCount").innerText=(a+"/"+a1);
                		document.getElementById("BaeSongCount").innerText=(b);
                		document.getElementById("EndCount").innerText=(c);
                    }
   					                 
                    
                </script>
	
	
	
	

</body>
</html>