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
	String lgu = request.getParameter("gu");

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