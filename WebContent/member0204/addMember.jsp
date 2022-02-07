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
			document.iu_form.reset(); //데이터를 다 지울 경우 사용.
			//location.href=""; //다른 페이지로 이동할 경우 사용.
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
		int id = 0;
		try{
			String sql = "SELECT MAX(id) FROM member0204";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				id = rs.getInt(1); 
				id++;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 가입 등록 화면</h2>
		<form name="iu_form" method="post" action="addMember_process.jsp">
			<table id="iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>(마지막번호 +1)</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repass"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="1" checked> 남성
						<input type="radio" name="gender" value="2"> 여성
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
						<input type="number" name="birth1" min="1" value="2022"> 년
						<input type="number" name="birth2" min="1" max="12" value="01"> 월
						<input type="number" name="birth3" min="1" max="31" value="01"> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email1">@
						<input type="text" name="email2" readonly>
						<select name="email3" onchange="emailChange(this)">
							<option value="" selected>선택하세요.</option>
							<option value="self">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.com">hanmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td>
						<input type="checkbox" name="interest" value="프로그램"> 프로그램
						<input type="checkbox" name="interest" value="독서"> 독서
						<input type="checkbox" name="interest" value="등산"> 등산
						<input type="checkbox" name="interest" value="여행"> 여행
						<input type="checkbox" name="interest" value="컴퓨터"> 컴퓨터
						<input type="checkbox" name="interest" value="영화"> 영화
						<input type="checkbox" name="interest" value="운동"> 운동
						<input type="checkbox" name="interest" value="진학"> 진학
					</td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="prosecutor()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@include file="/footer.jsp" %>
</body>
</html>
