<%@page import="kr.or.ddit.prod.vo.prodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//컨트롤러에서 저장한 값 불러오기
	// "list"값이 Object이기 때문에 형변환을 시켜줘야 함
	List<prodVO> list = (List<prodVO>)request.getAttribute("list");
	
	if(list != null && list.size() > 0){
%>
{
	"flag" : "ok",
	"datas": [
				<%
				for(int i=0; i<list.size(); i++){
					prodVO vo = list.get(i);
					if(i >0) out.print(",");
				%>
					{
						"prodId"   : "<%=vo.getProd_id() %>",			
						"prodName" : "<%=vo.getProd_name() %>"			
					}
				<%	
				}
				%>
			 ]
}
<%}else{%>
	{
	"flag" : "no"
	}
<%
}
%>