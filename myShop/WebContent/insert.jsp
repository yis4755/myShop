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

<!-- location.href를 통해 받아 온 값을 dto에 set한 후 dao insert 명령 실행 -->

<body>

	<%
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
		/* dto에 값 셋팅 */
		dto.setId(request.getParameter("id"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setPrice(request.getParameter("price"));
		
		dao.insert(dto);
		
		/* 실행이 완료되면 메인 화면으로 이동 */
		response.sendRedirect("main.html");
	%>
	
</body>
</html>