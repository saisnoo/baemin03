<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------ShopManage.jsp");
%> 
   
   
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