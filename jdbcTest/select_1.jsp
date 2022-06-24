<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 출력</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td width="100">차제조사</td>		
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
		String selectedBrand = request.getParameter("input_brand");
		out.println("선택한 제조사: " +selectedBrand);

		String sql = "SELECT c.car_id, c.car_name, c.car_size, hk.brand FROM hyundai_kia hk, mju_yongin_car c WHERE c.car_name = hk.car_name AND hk.brand = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, selectedBrand);		
		rs = pstmt.executeQuery();

		while( rs.next() ) {			
			String brand = rs.getString("BRAND");						
			int car_id = rs.getInt("CAR_ID");						
			String car_name = rs.getString("CAR_NAME");
			String car_size = rs.getString("CAR_SIZE");											
%>
			<tr>
				<td width="100"><%= brand %></td>						
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