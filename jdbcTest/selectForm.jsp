<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 삽입</title>
</head>
<body>
	<h1>명지대자연 쏘카존 예약 page에 오신 것을 환영합니다.</h1>

	<p>1.제조사를 입력하여 해당하는 차량 찾기</p>
	<form name="form1" method="post" action="select_1.jsp">
		<p>제조사 : <input type="text" name="input_brand"></p>		
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>

	<p>2.차량 크기를 입력하여 해당하는 차량 찾기</p>
	<form name="form2" method="post" action="select_2.jsp">
		<p>차량 크기 : <input type="text" name="car_size"></p>		
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>

	<p>3. 예약일을 입력 후 해당일에 예약 가능한 차량 찾기</p>
	<form name="form3" method="post" action="select_3.jsp">
		<p>예약일 : <input type="date" name="date_reservation"></p>		
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>