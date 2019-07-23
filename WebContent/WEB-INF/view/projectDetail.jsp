<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#detail_wrap {
	
	width: 960px;
	margin: 0 auto;
	width: 960px;
	margin-top: 50px;
}

table {
	border-collapse: collapse;
	width: 700px;
}

table, td, th {
	border: 1px solid black;
}

td{
	width: 400px;
}

#page{
	padding-left: 220px;
}

a{
	color:black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	
</script>

<script type="text/javascript">
	$(function() {
		$("#del").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = $(this).attr(href);
			}
			return false;
		})
	})
</script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div id="detail_wrap">
		<table>
			<tr>
				<th>프로젝트 이름</th>
				<td>${p.name}</td>
			</tr>
			<tr>
				<th>프로젝트 내용</th>
				<td>${p.content}</td>
			</tr>
			<tr>
				<th>시작 날짜</th>
				<td><fmt:formatDate value="${p.startDate }"
						pattern="yyyy/MM/dd" /></td>
			</tr>
			<tr>
				<th>종료 날짜</th>
				<td><fmt:formatDate value="${p.endDate }" pattern="yyyy/MM/dd" /></td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${p.progress }</td>
			</tr>
		</table>

		<p id="page">
			<a href="update.do?no=${p.no}">[수정]</a>&nbsp;&nbsp;&nbsp; <a
				href="delete.do?no=${p.no}" id="del">[삭제]</a> &nbsp;&nbsp;&nbsp;<a href="list.do">[돌아가기]</a>
		</p>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>