<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	
	//우편번호 검색 결과에서 하나를 선택하면 
	$(document).on('click','.ziptr',function(){
		zcode = $('td',this).eq(0).text();
		add = $('td',this).eq(1).text();
		
		//부모창의 input에 출력하기
		$('#zip',opener.document).val(zcode);
		$('#add1',opener.document).val(add);
		
		window.close();
	})
	
	$('input[type=button]').on('click',function(){
		//입력한 동이름 가져오기
		dongvalue = $('#dong').val().trim();
		
		//입력여부
		if(dongvalue.length <1){
			alert("동 입력~");
			return false;
		}
		//alert("입력성공!")
		
		//서버로 전송
		$.ajax({
			url : "/jqpro/member/searchDongServlet.jsp",
			data : { "dong" : dongvalue },
			type : 'post',
			success : function(res){
				code = "<table class='table table-striped'>";
				code += "<tr><td>우편번호</td>";
				code += "<td>주소</td>";
				code += "<td>번지</td></tr>";
				
				$.each(res, function(i,v){
					
					bunji = v.bunji;
					if(bunji == null) bunji = "";
					
					code += `<tr class="ziptr"><td> ${v.zipcode} </td>`;
					code += `<td> ${v.sido} ${v.gugun} ${v.dong} </td>`;
					code += `<td> ${bunji} </td></tr>`;
				})
				code += "</table>"
				
				$('#result').html(code);
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
})

</script>
<style>
.ziptr:hover{
	background : lime;
}
</style>
</head>
<body>
<h2>우편번호 찾기</h2>
동이름 입력
<input type="text" id="dong">
<input type="button" value="확인">
<br><br>
<div id="result"></div>

</body>
</html>



