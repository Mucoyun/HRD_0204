<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
</head>
<body>
	<%@include file="/DBConn.jsp" %>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		String birth = birth1 + "-" + birth2 + "-" + birth3;
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;

		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String[] interest = request.getParameterValues("interest");
		String interests = "";
		
		for(String i: interest){
			if(i.equals(interest[0])){
				interests = i;
			}else{
				interests = interests + "," + i;
			}
		}
		
		try{
			String sql = "insert into member0204 values(?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birth);
			pstmt.setString(6, email);
			pstmt.setString(7, phone);
			pstmt.setString(8, address);
			pstmt.setString(9, interests);
			
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.herf = "/HRD_0204/member0204/memberSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>
