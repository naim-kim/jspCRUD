<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO"%>
<%@ page import="com.example.jspcrud.util.FileUpload" %>
<%@ page import="com.example.jspcrud.vo.BoardVO" %>

<%
	try {
		request.setCharacterEncoding("utf-8");
		BoardDAO boardDAO = new BoardDAO();
		FileUpload upload = new FileUpload();
		BoardVO u = upload.uploadPhoto(request);

		int k = boardDAO.updateBoard(u);
		String msg;

		if (k == 1) {
			msg = "데이터 수정 성공!";
		} else {
			msg = "에러 발생: 데이터 수정";
		}
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>

<%
	} catch (Exception e) {
		System.out.println("에러 발생: " + e.getMessage());
		e.printStackTrace();
	}
%>
