<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO, com.example.jspcrud.vo.BoardVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Post</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>
<header>
    <h1>FriendVault</h1>
</header>
<div class="container">
    <%
        BoardDAO boardDAO = new BoardDAO();
        String id = request.getParameter("id");
        BoardVO post = boardDAO.getBoard(Integer.parseInt(id));
        request.setAttribute("post", post);
    %>
    <form id="viewPostForm" action="viewpost.jsp" method="get">
        <input type="hidden" name="id" value="<%= post.getSeq() %>"/>
        <table class="table">
            <tr>
                <td colspan="2">
                    <c:if test="${post.getPhoto() ne ''}">
                        <br />
                        <img src="${pageContext.request.contextPath }/upload/${post.getPhoto()}" class="photo" width=250 height=auto>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>NickName:</td>
                <td><%= post.getTitle() %></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><%= post.getWriter() %></td>
            </tr>
            <tr>
                <td>Contacts:</td>
                <td><%= post.getContacts() %></td>
            </tr>
            <tr>
                <td>MBTI:</td>
                <td><%= post.getMbti() %></td>
            </tr>
            <tr>
                <td>Any Comment:</td>
                <td><%= post.getComment() %></td>
            </tr>
            <tr>
                <td class="edit-icon">
                    <a class="edit" title="Edit" data-toggle="tooltip" href="editform.jsp?id=${post.getSeq()}">
                        <i class="material-icons">&#xE254;</i>
                    </a>
                </td>
                <td>
                    <a class="btn btn-secondary" href="index.jsp">Home</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
