<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	textarea{
		width:800px;
		height:400px;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">
		$(function() {
			
			$("#submit").click(function(){
				var title_null = $("#title").val();
				var ex_null = $("#ex").val();
				var price_null = $("#price").val();
				if(!title_null){
					alert("제목을 입력해주세요");					
				}
				else if(!ex_null){
					alert("내용을 입력해주세요");
				}
				else if(!price_null){
					alert("가격을 입력해주세요");
				}
				else if($.isNumeric(price_null)){
					var price = $("#price").val();
					  $.ajax({
							url:"insert_in_db.jsp",
							data:{
								"id":title_null,
								"ex":ex_null,
								"price":price_null
							},
							success : function(result) {
								alert("글이 작성되었습니다.");
								location.href='selectAll.jsp';
							},
							fail : function(result){
							},
							error : function(result){
							}

						}); // ajax 
				}
				else{
					alert("가격을 숫자로 입력해주세요");
				
					
				}
				
			});
			
			
		});
</script>
</head>
<body>
	<table style = "width:1000px">
	<tr>
		<td width = 50px>
		제목
		</td>
		<td>
			<input type = "text" id = "title" style="width:600px" >
		</td>
	</tr> 
	<tr><td colspan="2">
		<textarea rows="" cols="" id = "ex"></textarea>
	</td></tr>
	<tr>
		<td  width = 50px>가격</td>
		<td><input type = "text" id = "price" style="width:600px">
		<button id = "submit">글쓰기</button>
		<button id = "cancel" onclick="location.href='selectAll.jsp'">취소</button></td>
		
	</tr>
	
	<tr>
	<td colspan="2">
	
	</td></tr>
	</table>
	

</body>
</html>