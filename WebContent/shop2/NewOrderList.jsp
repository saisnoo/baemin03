<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------NewOrderList.jsp");
int status=0;
%>



                    
               
      
      
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
                                        	<%
                                        	if(status==0){
                                        		%>
                                            <button class="w3-button w3-blue h100"  data-toggle="modal" data-target="#take_over">주문접수</button>
                                           <%
                                           }else if(status==1){
                                        	   %>
                                            <button class="w3-button w3-blue h100"  >주문접수</button>
                                           <%
                                           }
                                           %>
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
        <div class="w3-section">
                                <div class="w3-card w3-padding">
                                    <div class="w3-row">
                                        <div class="w3-col w3-container w3-left" style="width: 100px;">
                                            <h2>13:22</h2>
                                        </div>
                                        <div class="w3-col w3-container w3-right" style="width: 200px; padding: 0px;">
                                            <button class="w3-button w3-blue h100">주문접수</button>
                                            <button class="w3-button w3-yellow h100">주문취소</button>
                                        </div>
                                        <div class="w3-rest w3-container">
                                            
                                            <strong>[메뉴 4개]</strong> &nbsp; 홍길동 <br />
                                            서울 구로구 구로동 구로빌딩 254-14 402호
                                            <hr />

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
                     
                 
                       
                            <!-- load  new order  -->
                        </div>
                        <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
                      
     <!-- </div> -->           