<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
 <div class="panel panel-default">
  <div class="panel-heading">댓글
    <span class="pull-right">
      <button class="btn btn-primary btn-xs" id="addReplyBtn" data-toggle="modal" data-target="#replyModal" >쓰기</button>
    </span>
  </div>
  <div class="panel-body">

<ul class="list-group" id="replyList">
<li class="list-group-item dataRow"></li>
  
</ul>

</div>
</div>
 
 
 <div class="modal fade" id="replyModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content 시작-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">댓글 작성</h3>
        </div>
        <div class="modal-body">
          	<form id="replyWriteForm">
			 <div class="form-group">
			 <!-- 글번호입력 -->
			    <input type="hidden" id="no" name="no" value="${dto.no }"/>
			 <!-- 댓글번호입력 -->
			    <inptu type="hidden" id="rno" name="rno" />
			 <!-- 내용입력 -->
 			  	<label for="content">내용</label>
			  	<textarea class="form-control" rows="3" id="content" name="content" style="resize: none;" required="required"></textarea>
			 <!-- 작성자 입력 -->
			    <label for="writer">작성자</label>
			    <input type="text" class="form-control" id="writer" name="writer" required="required" >
			 <!-- 비밀번호 입력 -->
			    <label for="pw">비밀번호</label>
			  	<input type="password" class="form-control" id="pw" name="pw" required="required">
			    </div>
			</form>
        </div>
        <div class="modal-footer">
			<div class="btn-group">
			  <button class="btn btn-default" id="replyWritebtn">쓰기</button>
			  <button class="btn btn-default" id="replyUpdateBtn">수정</button>
			  <button type="reset" class="btn btn-default">새로입력</button>
			  <button type="button" class="btn btn-default cancelBtn recan"data-dismiss="modal"  >취소</button>
			</div>
        </div>
      </div>
      <!-- Modal content end-->
      
    </div>
  </div>
</body>
</html>