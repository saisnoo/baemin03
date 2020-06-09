<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NewOrderList.jsp");


%>

<%  
// 처리되지 않은 주문 목록 표시하는 페이지
// Main.jsp에서   load() 하여 사용


  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <!-- CDN - Font Awesome 4 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- CDN - jquery 3.4.1 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- CDN - W3CSS -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <!-- CDN OFFLINE- sw_topNav.css -->
    <link rel="stylesheet" href="../sw_css/sw-1.0.0.css" />
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

    
    
</head>

<body>
    <!-- responsive template by SW ----------------------------------------------------------- -->
    <!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
    <div class="sw-topnav-margin">
        &nbsp;
    </div>

    <!-- CONTENT ------------------------------------------------------------------------------------ -->
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

                <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                <div id="tabtab1" class="w3-row w3-gray tabcontent2">
                    <div class="tab w3-col" style="width: 100px;">
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab1')" id="defaultOpen">
                            접수대기<br /><strong>3</strong>
                        </button>
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab2')">
                            배달중<br /><strong>3</strong>
                        </button>
                        <button class="w3-button w3-block w3-border tablinks" onclick="openTab(event, 'tab3')">
                            완료<br /><strong>3</strong>
                        </button>
                    </div>
                    <div class="w3-rest w3-white scroll-box">
                        <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        <div id="tab1" class="tabcontent">

                            <!-- load  new order  -->
                            <div class="w3-section">
                                <div class="w3-card w3-padding">
                                    <div class="w3-row">
                                        <div class="w3-col w3-container w3-left" style="width: 100px;">
                                            <h2>13:22</h2>
                                        </div>
                                        <div class="w3-col w3-container w3-right" style="width: 200px; padding: 0px;">
                                        	
                                            <button class="w3-button w3-blue h100"  data-toggle="modal" data-target="#take_over">주문접수</button>
                                           
                                            <button class="w3-button w3-blue h100"  >주문접수</button>
                                           
                                            <button class="w3-button w3-yellow h100" data-toggle="modal" data-target="#jumoon_calcel">주문취소
                                            </button>
                                        </div>
                                        <div class="w3-rest w3-container">
                                            <strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br/>
                                            	서울 구로구 구로동 구로빌딩 254-14 402호
                                            <hr/>
					                                            김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨
					                                            반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 /
					                                            고등어자반 5
                                        </div>
                                    </div>
                                </div>
                            </div>

         
                            <!-- load  new order  -->
                        </div>
                        <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        <div id="tab2" class="tabcontent">
                            <!-- load  new order  -->
                           <!-- load  new order  -->
                            <div class="w3-section">
                                <div class="w3-card w3-padding">
                                    <div class="w3-row">
                                        <div class="w3-col w3-container w3-left" style="width: 100px;">
                                            <h2>13:22</h2>
                                        </div>
                                        <div class="w3-col w3-container w3-right" style="width: 200px; padding: 0px;">
                                            <button class="w3-button w3-yellow h100" data-toggle="modal" data-target="#jumoon_calcel">주문취소
                                            </button>
                                        </div>
                                        <div class="w3-rest w3-container">
                                            <strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br/>
                                            	서울 구로구 구로동 구로빌딩 254-14 402호
                                            <hr/>
					                                            김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨
					                                            반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 /
					                                            고등어자반 5
                                        </div>
                                    </div>
                                </div>
                            </div>	
                 
                       
                            <!-- load  new order  -->
                        </div>
                        <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                        <div id="tab3" class="tabcontent">
                              <!-- load  new order  -->
                           <!-- load  new order  -->
                            <div class="w3-section">
                                <div class="w3-card w3-padding">
                                    <div class="w3-row">
                                        <div class="w3-col w3-container w3-left" style="width: 100px;">
                                            <h2>13:22</h2>
                                        </div>
                                        <div class="w3-col w3-container w3-right" style="width: 200px; padding: 0px;">
                                        </div>
                                        <div class="w3-rest w3-container">
                                            <strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br/>
                                            	서울 구로구 구로동 구로빌딩 254-14 402호
                                            <hr/>
					                                            김치찌개 2 / 된장찌개 2 / 후라이드치킨 2 / 양념치킨
					                                            반마리 1 / 호떡 7 / 감자튀김 10 / 스테이크 10 /
					                                            고등어자반 5
                                        </div>
                                    </div>
                                </div>
                            </div>	
                       
                        
                        </div>
                    </div>
                </div>
                <!--tabtab1 end-->

                <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                <div id="tabtab2" class="w3-cyan tabcontent2">

               <div class="container">
  <button type="button" class="btn btn-primary">영업시작</button>
  <button type="button" class="btn btn-success">영업종료</button>
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
	                        <td colspan="2"><button type="button" align="center">추가</button></td>
	                        </tr>
	                        </table>
                        </form>
     
                    
                    
                    </div>
                    
<div class="w3-container searchmenu" style="float:right;">
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
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox"> Alfreds Futterkiste</td>
      <td>Germany</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox">Berglunds snabbkop</td>
      <td>Sweden</td>
      <td>Sweden</td>
    </tr>
    <tr>
      <td><input type="checkbox">Island Trading</td>
      <td>UK</td>
      <td>UK</td>
    </tr>
    <tr>
      <td><input type="checkbox">Koniglich Essen</td>
      <td>Koniglich Essen</td>
      <td>Germany</td>
    </tr>
    <tr>
      <td><input type="checkbox">Laughing Bacchus Winecellars</td>
      <td>Laughing Bacchus Winecellars</td>
      <td>Canada</td>
    </tr>
    <tr>
      <td><input type="checkbox">Magazzini Alimentari Riuniti</td>
      <td>Italy</td>
      <td>Italy</td>
    </tr>
    <tr>
      <td><input type="checkbox">North/South</td>
      <td>UK</td>
      <td>UK</td>
    </tr>
    <tr>
      <td><input type="checkbox">Paris specialites</td>
      <td>France</td>
      <td>France</td>
    </tr>
  </table>

</div>

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
</script>
</div>
</body>
</html>


          

                   




                <script>
                    function openTab(evt, tabName) {
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
                </script>

                <!-- main content end----------------------------------------------------------------------- -->


 
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
			    <label for="writer">예상시간</label>
			    <select name="estimated_time">
			    <option value="" selected disabled hidden>배달예상시간 선택</option>
			    <option value="30">30분후</option>
			    <option value="40">40분후</option>
			    <option value="50">50분후</option>
			    <option value="60">60분후</option>
			    <option value="70">70분후</option>
			    <option value="80">80분후</option>
			    </select>
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
			    <input type="radio" name="whyCancel" value="재료소진으로 인한 취소" checked>재료소진으로 인한 취소<br>
			    <input type="radio" name="whyCancel" value="마감시간으로 인한 취소">마감시간으로 인한 취소<br>
			    <input type="radio" name="whyCancel" value="배달원부족으로 인한 취소">배달원부족으로 인한 취소<br>
			    <input type="radio" name="whyCancel" value="거리에 따른 취소">거리에 따른 취소<br>
				
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





        <!-- HEAD ------------------------------------------------------------------------------------ -->
        <!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
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
            <a href="javascript:void(0);" class="icon" onclick="responsiveMenuPopUp()">
                <i class="fa fa-bars"></i>
            </a>
        </div>









        <script>
            window.onresize = responsiveMenuClose;
            /* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
            function responsiveMenuPopUp() {
                var x = document.getElementById("topNav");
                if (x.className === "topnav w3-card-4") {
                    x.className += " responsive";
                } else {
                    x.className = "topnav w3-card-4";
                }
            }

            function responsiveMenuClose() {
                var x = document.getElementById("topNav");
                x.className = "topnav w3-card-4";
            }
        </script>
</body>

</html>