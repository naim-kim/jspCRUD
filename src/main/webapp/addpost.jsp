<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.jspcrud.dao.BoardDAO" %>
<%@ page import="com.example.jspcrud.util.FileUpload" %>
<%@ page import="com.example.jspcrud.vo.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
    BoardDAO boardDAO = new BoardDAO();
    FileUpload upload = new FileUpload();
    BoardVO u = upload.uploadPhoto(request);

    int i = boardDAO.insertBoard(u);
    String msg = "Added to Friend Vault!";
    if (i == 0) msg = "[Error] Data failed uploading ";
%>

<script>
    alert('<%=msg%>');
    location.href = 'posts.jsp';
</script>