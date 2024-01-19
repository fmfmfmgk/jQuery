<%@page import="kr.or.ddit.member.Vo.MemberVo"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//Controller역할 - servlet, Spring
	
	//클라이언트 전송시 데이터 받기
	
	//service객체 얻기
	IMemberService service = MemberServiceImpl.getinstance();
	
	//service메소드 호출 -> 결과값 받기
	List<MemberVo> list = service.getAllMember();
	
	//결과값을 request에 저장
	request.setAttribute("listvalue",list);
	
	//결과값을 출력 -> view 페이지로 이동
	
	
	//결과값을 공유 -forword
	request.getRequestDispatcher("/0119/memberView.jsp")
							.forward(request, response);
	
%>

</body>
</html>