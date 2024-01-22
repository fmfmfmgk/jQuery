<%@page import="kr.or.ddit.lprod.vo.LprodVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// controller에서 저장한 데이터 꺼내기
	List<LprodVo> list = (List<LprodVo>) request.getAttribute("listvalue");
	
	
	// 결과값의 타입 변수명 = request.getAttribute("name");
	// 변수명을 이용하여 json형식의 배열 데이터를 생성
%>

[
	<%
		for(int i=0; i<list.size(); i++){
			LprodVo vo = list.get(i);
			if(i>0) out.print(",");
	%>
		{
			"lprod_id"   : "<%=vo.getLprod_id() %>",				
			"lprod_gu" : "<%=vo.getLprod_gu() %>",
			"lprod_nm"   : "<%=vo.getLprod_nm() %>"
		}
	<%		
		}
	%>
]