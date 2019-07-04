<%@page import="product.ProductDAO"%>
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
	request.setCharacterEncoding("UTF-8");
	String id_str = request.getParameter("id");
	int id = Integer.parseInt(id_str);
		
	
	ProductDAO dao = new ProductDAO();
	dao.delete(id);
	%>
</body>
</html>