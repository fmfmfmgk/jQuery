<%@page import="kr.or.ddit.buyer.vo.BuyerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    List<BuyerVo> list = (List<BuyerVo>)request.getAttribute("list");
%> 

[
	<%
	for(int i=0; i<list.size(); i++){
		BuyerVo vo = list.get(i);
		if(i >0) out.print(",");
	%>
		{
			"buyer_name" : "<%=vo.getBuyer_name() %>"		
		}
	<%
	}
	%>
]
   
    
    
    