<%@page import="java.util.ArrayList"%>
<%@page import="product.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="style.css" rel="stylesheet">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
			$(function() {
				$(".delete_Btn").click(function(){
					// var index = $(this).attr('id');
					var value = $("#delete_id"+$(this).attr('id')).text();
					
					  $.ajax({
							url:"delete.jsp",
							data:{
								"id":value
							},
							success : function(result) {
								alert("글이 삭제되었습니다.");
								location.href='selectAll.jsp';
							},
							fail : function(result){
							},
							error : function(result){
							}

						}); // ajax 
						
				});
				
				$("#form").click(function(){
					// var index = $(this).attr('id');
					var value = $("#content").val();
					
					if(!value){
						alert("검색할 아이디를 입력해주세요");
					}
					else{
					  $.ajax({
							url:"select.jsp",
							data:{
								"id":value
							},
							success : function(result) {
								location.href='select.jsp';
							},
							fail : function(result){
							},
							error : function(result){
							}

						}); // ajax 
					}
				});
				
			});
			
</script>
</head>
	<%
		ProductDAO dao = new ProductDAO();
	
		String sstr = request.getParameter("search");
		int search = Integer.parseInt(sstr);
		ArrayList<ProductDTO> list = dao.select(search);
	%>
	<body>
	
		<div class = "table_main">
			<h1> 상품관리	</h1>
			<hr width=1200px>
			<button id = "insert_btn" onclick="location.href='insert.jsp'" >상품등록</button>
			<span class = "alignright">
				<input type = "text" id = "content">
				<input type = "button" id = "form" value ="검색">
			</span>
		</div>
		
		<div class = "table_main"> 
				<%
					for(int i = 0 ; i < list.size(); i++){
					ProductDTO dto = list.get(i);
				%>
			<div class = "table_td">
							<p id = "id" name = "id"><span id = "delete_id<%=i%>"><%= dto.getId() %></span><button class = "delete_Btn" id = <%=i%>><span style = "color : white">X</span></button></p>
							<%= dto.getTitle() %><br>
							<center><%= dto.getEx() %></center><br>
							<br><p id = "price"><%= dto.getPrice() %>원</p>
			</div>
				<%
						}
				%>
		</div>
	</body>
</html>