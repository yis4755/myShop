<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- update.html에서 넘어온 값들을 dto에 셋팅하고 dao를 실행 -->

<body>
	<%
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
		dto.setId(request.getParameter("id"));
		dto.setContent(request.getParameter("content"));
		dto.setPrice(request.getParameter("price"));
		
		dao.update(dto);
		
		/* 실행이 완료되면 메인 화면으로 이동 */
		response.sendRedirect("main.html");
	%>
</body>
</html>