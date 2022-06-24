<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 출력</title>
</head>
<body>
	<table width="500" border="1">
		<tr>			
			<td width="100">차ID</td>	
			<td width="100">차이름</td>
			<td width="100">차크기</td>				
		</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "class_b";
		String userPass = "practice";		

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

		request.setCharacterEncoding("utf-8");	
		String selectedDateStr = request.getParameter("date_reservation");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//surround below line with try catch block as below code throws checked exception
		Date selectedDate = sdf.parse(selectedDateStr);
		//do further processing with Date object
		out.println("선택한 날짜: " +selectedDateStr);

		String sql = "SELECT DISTINCT r.car_id, r.car_name, car_size FROM mju_yongin_car c, mju_yongin_reservation r WHERE c.car_id = r.car_id AND (? NOT BETWEEN date_start AND date_end)";

		pstmt = conn.prepareStatement(sql);
		pstmt.setDate(1, new java.sql.Date(selectedDate.getTime()));		
		rs = pstmt.executeQuery();

		while( rs.next() ) {						
			int car_id = rs.getInt("CAR_ID");						
			String car_name = rs.getString("CAR_NAME");
			String car_size = rs.getString("CAR_SIZE");											
%>
			<tr>						
				<td width="100"><%= car_id %></td>						
				<td width="100"><%= car_name %></td>
				<td width="100"><%= car_size %></td>						
			</tr>
<%
		}
	}catch(SQLException e){
		e.printStackTrace();

		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException sqle) {} 
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>

	</table>

</body>
</html>