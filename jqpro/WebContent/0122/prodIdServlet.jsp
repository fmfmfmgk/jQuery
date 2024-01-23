<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="kr.or.ddit.prod.vo.prodVO"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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
	//1) 요청시 전송 데이터 받기  "gu=P201"의 형식일때 가능
//	String id = request.getParameter("id");
	
	//직렬화 된 데이터를 stream을 이용해서 가져온다.
	StringBuffer buf = new StringBuffer();
	String line = null;

	BufferedReader reader = request.getReader();
	
	while((line = reader.readLine()) != null){
		buf.append(line);
	};
	
	String reqdata = buf.toString(); 
	
	Gson gson = new Gson();
	prodVO vo = gson.fromJson(reqdata,prodVO.class);
	//vo.setprod_id("P101000001")형태로 저장되어있음
	String id = vo.getProd_id();
	
	//service의 객체생성
	IProdService service = ProdServiceImpl.getInstance();
	 
	//service메소드 호출 - 결고값  - prodVO
	prodVO list = service.selectById(id);
	
	//결과값을 request에 저장
	request.setAttribute("list1", list);
	
	//View페이지로 이동  - /0122/prodIdView.jsp
	request.getRequestDispatcher("/0122/prodIdView.jsp").forward(request, response);
	
%>
</body>
</html>