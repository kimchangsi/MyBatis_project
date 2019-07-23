<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<style>
	label{
		width: 120px;
		float: left;
	}
	
	#f1{
		margin-left: 50px;
	}
	
	#btn1,#btn2{
		width: 80px;
		color:white;
		background-color: black;
	}
	a{
	color:black;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		 $( "#startDate" ).datepicker({dateFormat:"yy/mm/dd"});
		 $( "#endDate" ).datepicker({dateFormat:"yy/mm/dd"});
		 
		 $("#f1").submit(function() {
			 var startDate = $( "input[name='startDate']" ).val();
	        var startDateArr = startDate.split('/');
	          
	        var endDate = $( "input[name='endDate']" ).val();
	        var endDateArr = endDate.split('/');
	                  
	        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	          
	        if(startDateCompare.getTime() > endDateCompare.getTime()) {
	              
	            alert("시작날짜와 종료날짜를 확인해 주세요.");
	              
	            return false;
	        }
	 })
	})
</script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
	<form action="insert.do" method="post" id="f1">
		<p>
			<label>프로젝트이름</label>
			<input type="text" name="name">
		</p>
		<p>
			<label>프로젝트 내용</label>
			<textarea rows="20" cols="50" name="content">
			
			</textarea>
		</p>
		<p>
			<label>시작날짜</label>
			<input type="text" name="startDate" id="startDate">
		</p>
		<p>
			<label>마감날짜</label>
			<input type="text" name="endDate" id="endDate">
		</p>
		<p>
			<label>상태</label>
			<select name="sel">
				<option value="준비">준비</option>
				<option  value="진행중">진행중</option>
				<option  value="종료">종료</option>
				<option  value="보류">보류</option>
			</select>
		</p>
		<p>
			<input type="submit" id="btn1" value="저장">
			<input type="reset"  id="btn2" value="취소">
		<p>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>