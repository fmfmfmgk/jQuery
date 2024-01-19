<%@page import="kr.or.ddit.lprod.vo.LprodVo"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//요청시 전송데이터 받기
	
	//service객체 얻기
	ILprodservice service = LprodServiceImpl.getinstance();
	
	//service메소드 호출 => 결과값 받기 -> List<LprodVo>
	List<LprodVo> list = service.selectLprod(); 
	
	//결과값을 request에 저장
	//setAttribute("name", value);
	
	request.setAttribute("listvalue", list);
	
	//view페이지로 이동 -> forward ->lprodView.jsp
	request.getRequestDispatcher("/0119/lprodView.jsp")
							.forward(request, response);
	
%>