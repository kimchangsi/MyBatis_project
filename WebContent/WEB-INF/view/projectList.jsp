<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 리스트</title>
<style>
	#wrap{
		width: 960px;
		margin: 0 auto;
		position: relative;
	}

	table{
	margin-top:70px;
		border-collapse: collapse;
		width: 700px;
		text-align: center;
		
	}
	
	table,th,td{
		border: 1px solid black;
	}
	
	#insert{
		position: absolute;
		right:150px;
		top:-50px;
	}
	a{
	color:black;
}
</style>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
	<div id="wrap">
	<a href="insert.do" id="insert">[새 프로젝트 등록]</a>
		<table>
			<tr>
				<th>프로젝트 이름</th>
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>상태</th>
			</tr>
			 <c:forEach var="item" items="${list}">
				<tr>
					<td><a href="detail.do?no=${item.no }">${item.name }</a></td>             
					<td>
						<fmt:formatDate value="${item.startDate }" pattern="yyyy/MM/dd" />
					</td>
					<td>
						<fmt:formatDate value="${item.endDate }" pattern="yyyy/MM/dd" />
					</td>
					<td>${item.progress }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>