<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function(){
      $.ajax({
         url: "boardList", // views/boardList.jsp가 결과!
         success: function(result){ //결과가 담겨진 table부분코드
            $('#d2').html(result)
         },
         error: function(){
            alert('실패.')
         }
      })
   })
</script>
<style>
	td{
		background: white;
		height: 30px;
	}
</style>
</head>
<body>
<div id='total'>
	<div id='top'>
	     <jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id='center'>
   	<!-- 비회원인 경우 -->
	   <h3>게시판</h3>
   <% if(session.getAttribute("userId") == null) { %>
	   <span style="color: red; float: left;">관리자만 작성이 가능한 페이지입니다.</span>
	   <span style="color: blue; float: right;">비회원 로그인 상태입니다.</span><br>
	   <hr color="red">
	   <div id="d2"></div>
	   <!-- 관리자인 경우 -->
   <% } else if(session.getAttribute("userId").equals("admin")){ %>
		<span style="color: blue; float: right;">${userId}님 로그인되었습니다. 좋은 하루 되세요.</span><br>
		<hr color="green">
		<div id="d2"></div>
		<a href="boardInsert.jsp">
			<button style="width:100px; height:50px; float: right;" class="btn btn-info">글쓰기</button>
		</a>
	<!-- 일반 회원인 경우 -->
   <% } else if(session.getAttribute("userId") != null) { %>
	   <span style="color: red; float: left;">관리자만 작성이 가능한 페이지입니다.</span>
	   <span style="color: blue; float: right;">${userId}님 로그인되었습니다. 좋은 하루 되세요.</span><br>
	   <hr color="blue">
	   <div id="d2"></div>
	 <% } %>
   </div>
</div>
</body>
</html>