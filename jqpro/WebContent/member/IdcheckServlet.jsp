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
	//서블릿 controller
	
	
	//요청시 전송 데이터 받기
	
//	String memId = request.getParameter("id"); 원래는 이렇게 받아야 하는데 직렬화를 하면 이렇게 안된다.
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
	//vo.setMem_id("korea")
	
	String memId = vo.getMem_id();
	
	//service객체 얻기
	IMemberService service = MemberServiceImpl.getinstance();
	
	//service메소드 호출 -> 결과값 받기
	String res = service.selectById(memId);
	
	//결과값을 request에 저장한다.
	request.setAttribute("res", res);
	
	//View페이지로 이동하기
	request.getRequestDispatcher("/member/idView.jsp").forward(request, response);
	
%>
</body>
</html>















