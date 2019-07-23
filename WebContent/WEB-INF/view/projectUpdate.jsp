<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<style>
	label{
		width: 120px;
		float: left;
	}
	
	#btn1,#btn2{
		width: 80px;
		color:white;
		background-color: black;
	}
	
	
	#f1{
		margin-left: 50px;
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
<body>
<jsp:include page="nav.jsp"></jsp:include>
		<form action="update.do" method="post" id="f1">
		<input type="hidden" name="no" value="${a.no }"> 
		<p>
			<label>프로젝트이름</label>
			<input type="text" name="name" value="${a.name}">
		</p>
		<p>
			<label>프로젝트 내용</label>
			<textarea rows="20" cols="50" name="content" id="text" >${a.content}</textarea>
		</p>
		<p>
			<label>시작날짜</label>
			<input type="text"  id="startDate" name="startDate" value="<fmt:formatDate value='${a.startDate }' pattern='yyyy/MM/dd' />">
		</p>
		<p>
			<label>마감날짜</label>
			<input type="text" id="endDate" name="endDate" value="<fmt:formatDate value='${a.endDate }' pattern='yyyy/MM/dd' />">
		</p>
		<p>
		
			<label>상태</label>
			<select name="sel">
				<option value="준비" <c:if test="${a.progress=='준비'}">selected</c:if>>준비</option>
				<option value="진행중" <c:if test="${a.progress=='진행중'}">selected</c:if>>진행중</option>
				<option value="종료" <c:if test="${a.progress=='종료'}">selected</c:if>>종료</option>
				<option value="보류" <c:if test="${a.progress=='보류'}">selected</c:if>>보류</option>
			</select>
		</p>
		<p>
			<input type="submit" id="btn1" value="수정">
			<input type="reset" id="btn2" value="취소">
		<p>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>