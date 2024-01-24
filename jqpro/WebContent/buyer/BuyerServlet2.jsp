<%@page import="kr.or.ddit.buyer.service.BuyerserviceImpl"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVo"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerservice"%>
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
	String name = request.getParameter("name");
	
	IBuyerservice service = BuyerserviceImpl.getInstance();
	
	BuyerVo list = service.selectByList(name);
	
	request.setAttribute("list", list);
	
	request.getRequestDispatcher("/buyer/BuyerView2.jsp")
							.forward(request, response);
%>
</body>
</html>