<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.prodVO"%>
<%@page import="java.util.List"%>
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
	//요청시 전송데이터 받기
//	String lgu = request.getParameter("gu");

	//2) data : JSON.stringify({ "prod_lgu" : guvalue }),형식의 직렬화 데이터
	StringBuffer buf = new StringBuffer();
	String line = null;
	
	BufferedReader reader = request.getReader();
	
	while((line = reader.readLine()) != null){
		buf.append(line);
	};
	
	String reqdata = buf.toString();
	
	//역직렬화 - (java)객체 형태로 변환
	Gson gson = new Gson();
	prodVO vo = gson.fromJson(reqdata, prodVO.class);
	//vo.setprod_lgu("P101"); 의 형태로 들어가 있음
	String lgu = vo.getProd_lgu();
	
	//service객체 얻기
	IProdService service = ProdServiceImpl.getInstance();
	
	//service메소드 호출 -> 결과값 받기 -> List<prodVO>
	List<prodVO> list = service.selectByLgu(lgu);
	
	//결과값을 request에 저장
	request.setAttribute("list", list);
	
	//view페이지로 이동
	request.getRequestDispatcher("/0122/prodView.jsp").forward(request, response);
%>
</body>
</html>