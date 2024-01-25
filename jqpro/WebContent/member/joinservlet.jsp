<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.Vo.MemberVo"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
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
	//controller servlet
	StringBuffer buf = new StringBuffer();
	String line = null;

	BufferedReader reader = request.getReader();
	
	while((line = reader.readLine()) != null){
		buf.append(line);
	};
	
	String reqdata = buf.toString(); 
	//{ : mem_id : "korea"};
	
	//역직렬화 -> 객체 형태로 변환
	Gson gson = new Gson();
	MemberVo vo = gson.fromJson(reqdata,MemberVo.class);	
	
	//service 객체 얻어오기
	IMemberService service = MemberServiceImpl.getinstance();
	
	//service 메소드 호출 -> 결과값 받기
	int res = service.insertMember(vo);
	
	//결과값을 request에 저장하기
	request.setAttribute("list", res);
	
	//View페이지로 이동하기
	request.getRequestDispatcher("/member/joinView.jsp").forward(request, response);
%>
</body>
</html>