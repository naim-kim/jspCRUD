<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO, com.example.jspcrud.vo.BoardVO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style/BoardStyle.css">
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id = request.getParameter("id");
    BoardVO user = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("user", user);
%>

<div class="container">
    <h1>User Information</h1>
    <form id="editForm" action="editform.jsp" method="get">
        <input type="hidden" name="id" value="<%= user.getSeq() %>"/>
        <table class="table">
            <tr>
                <td>Profile Image:</td>
                <td colspan="2">
                    <c:if test="${user.getPhoto() ne ''}">
                        <br />
                        <img src="${pageContext.request.contextPath }/upload/${user.getPhoto()}" class="photo" width=250 height=auto>
                    </c:if>
                </td>
            </tr>
            <tr>
            <tr>
                <td>이름:</td>
                <td><%= user.getTitle() %></td>
            </tr>
            <tr>
                <td>학번:</td>
                <td><%= user.getWriter() %></td>
            </tr>
            <tr>
                <td>나의 한동 MBTI:</td>
                <td><%= user.getMbti() %></td>
            </tr>
            <tr>
                <td>GitHub 주소 or Blog 주소:</td>
                <td><%= user.getContent() %></td>
            </tr>
            <tr>
                <td>연락처:</td>
                <td><%= user.getInfo() %></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" class="btn btn-primary" value="Edit User" onclick="redirectToEditForm()"/>
                    <a class="btn btn-secondary" href="javascript:history.back()">Go Back</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function redirectToEditForm() {
        document.getElementById('editForm').submit();
    }
</script>

</body>
</html>
