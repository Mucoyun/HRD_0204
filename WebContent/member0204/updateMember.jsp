<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function prosecutor() {
			var interest = document.getElementsByName("interest");
			var interestOk = false;
			for(var i=0; i<interest.length; i++){
				if(interest[i].checked==true){
					interestOk = true;
					break;
				}				
			}
			if(document.iu_form.name.value==""){
				alert("이름을 입력하세요.");
				document.iu_form.name.focus();
			}else if(document.iu_form.pass.value==""){
				alert("비밀번호를 입력하세요.");
				document.iu_form.pass.focus();
			}else if(document.iu_form.repass.value==""){
				alert("확인비밀번호를 입력하세요.");
				document.iu_form.repass.focus();
			}else if(document.iu_form.pass.value!=document.iu_form.repass.value){
				alert("비밀번호와 확인비밀번호가 일치하지 않습니다.");
				document.iu_form.repass.focus();
			}else if(!interestOk){
				alert("최소 하나이상 관심분야를 선택하세요.");
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			//document.iu_form.reset(); //데이터를 다 지울 경우 사용.
			location.href="memberSelect.jsp"; //다른 페이지로 이동할 경우 사용.
			//history.back(-1); //이전 페이지로 이동할 경우 사용.
		}
		function emailChange(email3) {
			if(email3.value==""){ //"선택하세요" 인 경우
				document.iu_form.email2.value = "";
				document.iu_form.email2.readOnly = true;
			}else if(email3.value=="self"){ //"직접입력" 인 경우
				document.iu_form.email2.value = "";
				document.iu_form.email2.readOnly = false;
			}else{ //OOOOO.com 인경우
				document.iu_form.email2.value = email3.value;
				document.iu_form.email2.readOnly = true;
			}
		}
	</script>
</head>
<body>
	<%@include file="/DBConn.jsp" %>
	<%@include file="/header.jsp" %>
	<%@include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		
		try{
			String sql = "select id,password,name,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member0204 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String id = rs.getString(1);
				String password = rs.getString(2); 
				String name = rs.getString(3); 
				String gender = rs.getString(4); 
				String birth = rs.getString(5); 
				String email = rs.getString(6); 
				String phone = rs.getString(7); 
				String address = rs.getString(8); 
				String interest = rs.getString(9);
				
				String[] births = birth.split("-");
				String[] emails = email.split("@");
				String[] interests = interest.split(",");
				%>
	<section>
		<h2>회원 가입 등록 화면</h2>
		<form name="iu_form" method="post" action="updateMember_process.jsp">
			<table id="iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>(마지막번호 +1)</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" value="<%=password %>"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repass" value="<%=password %>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="1" <%if(gender.equals("1")){%> checked <%} %>> 남성
						<input type="radio" name="gender" value="2" <%if(gender.equals("2")){%> checked <%} %>> 여성
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
						<input type="number" name="birth1" min="1" value="<%=births[0]%>"> 년
						<input type="number" name="birth2" min="1" max="12" value="<%=births[1]%>"> 월
						<input type="number" name="birth3" min="1" max="31" value="<%=births[2]%>"> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email1" value="<%=emails[0]%>"> @
						<input type="text" name="email2" value="<%=emails[1]%>" readonly>
						<select name="email3" onchange="emailChange(this)">
							<option value="" <%if(emails[1].equals("")){%> selected <%} %>>선택하세요.</option>
							<option value="self" <%if(emails[1].length()>0){%> selected <%} %>>직접입력</option>
							<option value="naver.com" <%if(emails[1].equals("naver.com")){%> selected <%} %>>naver.com</option>
							<option value="gmail.com" <%if(emails[1].equals("gmail.com")){%> selected <%} %>>gmail.com</option>
							<option value="nate.com" <%if(emails[1].equals("nate.com")){%> selected <%} %>>nate.com</option>
							<option value="hanmail.com" <%if(emails[1].equals("hanmail.com")){%> selected <%} %>>hanmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="<%=phone %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td>
						<input type="checkbox" name="interest" value="프로그램" <%for(String i: interests){if(i.equals("프로그램")){%>checked<%}}%>> 프로그램
						<input type="checkbox" name="interest" value="독서" <%for(String i: interests){if(i.equals("독서")){%>checked<%}}%>> 독서
						<input type="checkbox" name="interest" value="등산" <%for(String i: interests){if(i.equals("등산")){%>checked<%}}%>> 등산
						<input type="checkbox" name="interest" value="여행" <%for(String i: interests){if(i.equals("여행")){%>checked<%}}%>> 여행
						<input type="checkbox" name="interest" value="컴퓨터" <%for(String i: interests){if(i.equals("컴퓨터")){%>checked<%}}%>> 컴퓨터
						<input type="checkbox" name="interest" value="영화" <%for(String i: interests){if(i.equals("영화")){%>checked<%}}%>> 영화
						<input type="checkbox" name="interest" value="운동" <%for(String i: interests){if(i.equals("운동")){%>checked<%}}%>> 운동
						<input type="checkbox" name="interest" value="진학" <%for(String i: interests){if(i.equals("진학")){%>checked<%}}%>> 진학
					</td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="prosecutor()">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<%@include file="/footer.jsp" %>
</body>
</html>
