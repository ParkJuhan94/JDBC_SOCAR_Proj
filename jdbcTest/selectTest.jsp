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
			<td width="100">아이디</td>
			<td width="100">이름</td>
			<td width="100">학과명</td>
			<td width="100">이수학점</td>
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
		
		String sql = "SELECT * FROM student";

		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while( rs.next() ) {
			String id = rs.getString("ID");
			String name = rs.getString("NAME");
			String dept = rs.getString("DEPT_NAME");
			int tot = rs.getInt("TOT_CRED");
		
%>
			<tr>
				<td width="100"><%= id %></td>
				<td width="100"><%= name %></td>
				<td width="100"><%= dept %></td>
				<td width="100"><%= tot %></td>
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