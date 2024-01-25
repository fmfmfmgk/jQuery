<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.Vo.ZipVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%
	//controller에서 저장한 데이터 꺼내기
	List<ZipVo> list = (List<ZipVo>)request.getAttribute("list");
	//list객체를 json형태의  문자열로 직렬화 보내기
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	String res = gson.toJson(list); // [ {}, {}, {}]의 형태로 만들어짐
	
	out.print(res);
	out.flush();
%>


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    