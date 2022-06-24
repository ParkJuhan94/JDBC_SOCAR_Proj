<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>레코드 삽입</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept_name");
	int tot = Integer.parseInt(request.getParameter("tot_cred"));

	Connection conn = null;
	PreparedStatement pstmt = null;

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
		
		String sql = "INSERT INTO student values(?, ?, ?, ?)";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setInt(4, tot);
		pstmt.executeUpdate();

%>
	<p> Student 테이블에 새로운 레코드를 삽입(추가) 했습니다.</p>
	<%= name %>

<%

	}catch(SQLException e){
		e.printStackTrace();

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

</body>
</html>
