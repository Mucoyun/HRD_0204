<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<style>
		/* 스타일 초기화 설정 */
		*{
			margin: 0; padding: 0;/* 여백 및 간격 초기화 */
		}html,body{
			width: 100%; height: 100%;/* 웹페이지 전체 크기 100%로 지정 */
		}a{
			text-decoration: none;/* a태그 기본적용 스타일 초기화(밑줄 제거) */
			
		}table{
			border: 3px solid black;/* 테이블 외부 테두리 두께:3px,선:실선,색상:검정  */
			margin: 0 auto;/* 테이블 중앙으로 정렬 */
			border-collapse: collapse;/* 테이블 테두리 : 심플테두리 */
		}tr,th,td{
			border: 1px solid black;/* 테이블 내부 테두리 두께:1px,선:실선,색상:검정  */
		}
	</style>
	<style>
		/* 웹사이트 스타일 */
		header{
			width: 100%; height: 15%;
			color: white; background-color: lightgray;
			text-align: center; display: table;
		}header > h1{
			display: table-cell;
			vertical-align: middle;
			font-size: 3vw;
		}
		
		nav{
			width: 10%; height: 80%;
			color: white; background-color: black;
			text-align: center; display: table;
			float: left;
		}nav > ul{
			display: table-cell;
			vertical-align: top;
			list-style: none;
		}nav > ul li{
			display: block;
			margin: 20px 0;
			font-size: 1vw;
		}nav > ul li > a{
			color: white;
			font-weight: bold;
		}nav > ul li > a:HOVER {
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 90%; height: 80%;
			color: black; background-color: white;
			float: left;
		}section > h2{
			text-align: center;
			margin: 20px 0;
		}section > p{
			font-weight: bold;
			padding-left: 40px;
		}section > ol{
			padding-left: 40px;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
			clear: both;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
			font-size: 1vw;
		}
	</style>
	<style>
		/* 입력 테이블 스타일 */
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 700px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 250px;
		}#iu_table input[type="password"]{
			height: 25px;
			width: 250px;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 100px;
		}#iu_table select{
			height: 25px;
			width: 150px;
		}
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 25px;
			width: 150px;
		}
	</style>
</head>
<body>
	<header>
		<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
	</header>
</body>
</html>
