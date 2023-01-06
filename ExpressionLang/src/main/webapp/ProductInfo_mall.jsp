<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.ProductInfo" %>
<%
	ProductInfo product = new ProductInfo();
	product.setName("케익");
	product.setPrice(2);
	request.setAttribute("product", product);
	RequestDispatcher dispatcher = request.getRequestDispatcher("ProductInfoView.jsp");
	dispatcher.forward(request, response);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>