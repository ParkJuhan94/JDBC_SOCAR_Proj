<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 삽입</title>
</head>
<body>
	<p>Student 테이블에 레코드 삽입(추가) 예제</p>
	<form name="form1" method="post" action="insertTest.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>학과명 : <input type="text" name="dept_name"></p>
		<p>이수학점 : <input type="text" name="tot_cred"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>