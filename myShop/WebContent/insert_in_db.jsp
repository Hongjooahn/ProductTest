<%@page import="product.ProductDTO"%>
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
		String title = request.getParameter("id");
		String ex = request.getParameter("ex");
		String price_str = request.getParameter("price");
		int price = Integer.parseInt(price_str);
		
		
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();
		
		dto.setTitle(title);
		dto.setEx(ex);
		dto.setPrice(price);
		
		dao.insert(dto);
		
	%>

</body>
</html>