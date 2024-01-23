<%@page import="kr.or.ddit.prod.vo.prodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	prodVO vo = (prodVO)request.getAttribute("list1");
%> 
    

		{
			"prodId"   : "<%=vo.getProd_id() %>",			
			"prodName" : "<%=vo.getProd_name() %>",			
			"prodLgu" : "<%=vo.getProd_lgu() %>",			
			"prodBuyer" : "<%=vo.getProd_buyer() %>",			
			"prodCost" : "<%=vo.getProd_cost() %>",			
			"prodPrice" : "<%=vo.getProd_price() %>",			
			"prodSale" : "<%=vo.getProd_sale() %>"			
		}
   
