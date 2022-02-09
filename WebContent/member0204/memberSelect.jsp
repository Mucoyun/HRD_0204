<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<style>
		#s_table tr{
			height: 30px;
		}
		#s_table td{
			text-align: center;
		}
		#btn{
			display: block;
			margin: 20px auto;
			width: 150px;
			height: 30px;
			background-color: black;
			color: white;
		}
		p{
			padding:0px !important;
			width: 1600px; 
			margin: 0 auto;
		}
	</style>
	<script>
		function notry() {
			//document.iu_form.reset(); //데이터를 다 지울 경우 사용.
			location.href="addMember.jsp"; //다른 페이지로 이동할 경우 사용.
			//history.back(-1); //이전 페이지로 이동할 경우 사용.
		}
	</script>
</head>
<body>
	<%@include file="/DBConn.jsp" %>
	<%@include file="/header.jsp" %>
	<%@include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "SELECT count(id) FROM member0204";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1); 
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 목록</h2>
		<p>총 <%=no %>명의 회원이 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">Id</th>
				<th width="100">성명</th>
				<th width="100">비밀번호</th>
				<th width="100">성별</th>
				<th width="100">생년월일</th>
				<th width="200">이메일</th>
				<th width="200">연락처</th>
				<th width="300">주소</th>
				<th width="300">관심분야</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				String sql = "select * from member0204 order by id asc";
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String id = rs.getString(1);
					String password = rs.getString(2); 
					String name = rs.getString(3); 
					String gender = rs.getString(4); 
					String birth = rs.getString(5); 
					String email = rs.getString(6); 
					String phone = rs.getString(7); 
					String address = rs.getString(8); 
					String interest = rs.getString(9);
					%>
					<tr>
						<td><%=id %></td>
						<td><%=name %></td>
						<td><%=password %></td>
						<td><%=gender %></td>
						<td><%=birth %></td>
						<td><%=email %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=interest %></td>
						<td>
							<a href="updateMember.jsp?send_id=<%=id%>">수정</a>
							<span>/</span>
							<a href="deleteMember.jsp?send_id=<%=id%>"
							onclick="if(!confirm('정말로 삭제하시겠습니까?')){ return false; }"
							>삭제</a>
						</td>
					</tr>
					<%
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">작성</button>
	</section>
	<%@include file="/footer.jsp" %>
</body>
</html>