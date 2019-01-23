<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품 관리 프로그램</title>
	<link type="text/css" rel="stylesheet" href="maincss.css">
</head>

<!-- 상품 검색 결과 -->

<body>
	
	<h5 align="center"> 상품 관리 프로그램</h5>
 	
 	<div id="main">
 		<ul> 
 			<li><a href="insert.html">&nbsp;&nbsp;상품 등록 &nbsp; &nbsp;</a></li> 
 			<li><a href="update.html">상품 수정 &nbsp; &nbsp;</a></li>
 			<li><a href="delete.html">상품 삭제 &nbsp; &nbsp;</a></li>
 			<li><a href="select.html">상품 검색 &nbsp; &nbsp;</a></li>
 			<li><a href="selectAll.jsp">상품 리스트</a></li>
 		</ul>
 	</div>
	
	<div id="substance">
	<h3>상품 리스트</h3>
		
		<table border="2">
				<tr>
					<th width="100">ID</th>
					<th width="150">TITLE</th>
					<th width="250">CONTENT</th>
					<th width="200">PRICE</th>
				</tr>
	
	<%
		ProductDTO dto = null;
		ProductDAO dao = new ProductDAO();
		
		String id = request.getParameter("id");
		
		/* 검색한 단어를 포함한 결과를 가져오기 때문에 ArrayList 사용 */
		ArrayList<ProductDTO> list = dao.select(id);
		
		for(int i = 0; i < list.size(); i++) {
			dto = list.get(i);
	%>
			<!-- 검색 결과 값 출력 -->
			<tr align="center">
				<td> <%= dto.getId() %></td>
				<td> <%= dto.getTitle() %></td>
				<td> <%= dto.getContent() %></td>
				<td> <%= dto.getPrice() %></td>
			</tr>
	<% 		
		}
		
	%>
		</table>
	</div>
</body>
</html>