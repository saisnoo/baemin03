<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ JoinFormCilent.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>JoinFormCilent.jsp</title>
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
<!-- 다음 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
// 스크립트

	var juso1 = "";

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
            }
        }).open();
        juso1 = document.getElementById("sample6_address").value;
    }
    
    function jusoIn(){
    	juso1 = document.getElementById("sample6_address").value;
    }
    
	
	function jusoCheck(){
		
		jusoIn()
		
		var juso2 = document.getElementById("sample6_address").value;
		
		if(juso1 != juso2){
			document.getElementById("shopX").value = '자유';
			document.getElementById("shopY").value = '혁명';
		}
		
	}

  function checkId(){
	  
	var form = document.inputForm;
	
	if(!form.id.value){
		alert("아이디");
		return false;
	}
}

	function checkPw(){
		
		var id = document.getElementById("id").value;
		var form = document.inputForm;
		var pw = document.getElementById("pw").value;
		var pwc = document.getElementById("pwc").value;
		
		if(id != ''){//아이디 공백일때
			if(pw != '' || pwc != ''){
				if(pw == pwc){//비밀번호와 비밀번호 체크가 같다면
					document.getElementById("btn").disabled = false;//버튼 ON
				}else{//아니라면
					document.getElementById("btn").disabled = true;//버튼 OFF
				}
			}
		}
	}

	
	
	
	function timeCheck(){
		setInterval(function(){
			checkPw();
		}, 500);
	};
	
	function jusoTimer(){
		setInterval (function(){
			jusoCheck();
		},1000)
	};
  
</script>
</head>
<body onload="timeCheck()">
	<!-- 내용 -->
	<h2>JoinFormCilent.jsp</h2>
	<br>
	<%
 
%>




	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->


				<div class="w3-container w3-card-4">
				
				
				
				
				
				

					<div class="w3-container w3-blue">
						<h2>사용자 회원가입</h2>
					</div>
					<br>
					<form class="w3-container" name="inputForm">
						<p>
							<label>아이디</label>
							<input class="w3-input" type="text" name="id" id="id" pattern="^[a-zA-Z]{2,7}$" required>
						</p>
						<p>
							<input type="button" value="ID체크" onClick="checkId()">
						</p>
						<br>
						<p>
							<label>비밀번호</label>
							<input class="w3-input" type="password" name="pw" id="pw" pattern="^[a-z0-9]{4,8}$" required>
						</p>
						<br>
						<p>
							<label>비밀번호 확인</label>
							<input class="w3-input" type="password" name="pwc" id="pwc" pattern="^[a-z0-9]{4,8}$" required>
						</p>
						<br>
						<p>
							<label>이름</label>
							<input class="w3-input" type="text" name="name" required>
						</p>
						<br>
						<p>
							<label>전화번호</label>
							<input class="w3-input" type="text" name="tel" required>
						</p>
						<br>
						<p>
							<!--  -->
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<!--  -->
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<!--  -->
							<input type="text" id="sample6_address" placeholder="주소"><br>
							<!--  -->
							
						</p>
						<!--  -->
						<input type="text" name="shopX" id="shopX">
						<!--  -->
						<input type="text" name="shopY" id="shopY">
						<!--  -->
						<br>
						<p>
							<!--  -->
							<input id="btn" name="btn" class="w3-button w3-blue w3-margin" type="button"value="회원가입" onClick="location='./memberShop/JoinShopPro.jsp'" disabled>
							<!--  -->
							<input class="w3-button w3-blue w3-margin" type="button" value="뒤로가기" onClick="history.back()">
							<!--  -->
						</p>
					</form>
				</div>


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	<jsp:include page="../sw_css/topnav.jsp" />


</body>
</html>