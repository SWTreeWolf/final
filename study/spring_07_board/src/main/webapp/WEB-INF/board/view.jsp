<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#list').on('click', listRun);
		$('#replay').on('click', replayRun);
	});

	function listRun() {
		$('form').attr('action', 'list.sb').submit();
	}
	
	function replayRun(){
		$('form').attr('action','write.sb').submit();
	}
</script>
</head>
<body>
	<table border="1" width="80%">
		<tr>
			<th width="20%">글쓴이</th>
			<td>${dto.writer}</td>
			<th width="20%">조회수</th>
			<td>${dto.readcount}</td>
		</tr>

		<tr>
			<th>제목</th>
			<td colspan="3">${dto.subject}</td>
		</tr>

		<tr>
			<th>메일</th>
			<td colspan="3">${dto.email}</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="3">${dto.content}</td>
		</tr>

		<tr>
			<th>파일</th>
			<td colspan="3"><c:if test="${!empty dto.upload}">
					<a href="contentdownload.sb?num=${dto.num}">
						<%-- ${fn:substringAfter(dto.upload,"_")} --%>
						${dto.upload} </a>
				</c:if> <c:if test="${empty dto.upload }">
					<c:out value="첨부파일 없음" />
				</c:if></td>
		</tr>
	</table>

	<form name="frm" id="frm" method="get">
		<input type="hidden" name="num" value="${dto.num}" /> 
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
		<input type="hidden" name="ref"	value="${dto.ref}" /> 
		<input type="hidden" name="re_step"	value="${dto.re_step}" /> 
		<input type="hidden" name="re_level" value="${dto.re_level}" /> 
		<input type="button" id="list" value="리스트" /> 
		<input type="button" id="replay" value="답변" /> 
		<input type="button" id="update" value="수정" />
		<input type="button" id="delete" value="삭제" />
	</form>
</body>
</html>