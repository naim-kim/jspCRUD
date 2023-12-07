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
    <style>
        @font-face {
            font-family: 'SamlipOutline';
            src: url('fonts/SDSamliphopangcheOutline.otf') format('opentype');
        }

        @font-face {
            font-family: 'SamlipBasic';
            src: url('fonts/SDSamliphopangcheBasic.otf') format('opentype');
        }
        /* Global Styles */
        body, h1, h2, p {
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'SamlipBasic', sans-serif;
            background-color: #f0f0f0;
            text-align: center;

        }
        header {
            background-color: #98cfe9;
            color: #fff;
            text-align: left;
            padding: 20px;
        }
        header h1 {
            font-size: 38px;
        }
        main {
            padding: 20px;
            margin: 20px;
            width: 90%;
            height: 100%;
            background-color: #fff;
        }
        main.sub-pages {
            width: 60%;
            height: 90%;
            margin: 20px auto;
        }
        /* edit icon */
        .action-icons .edit i {
            color: #FFC107;
            margin-right: 15px;
        }

        .action-icons .edit i:hover {
            color: #ffe28d;
        }

        .edit i.material-icons {
            color: #FFC107;
            font-size: 100%;
            text-align: center;
        }

        .edit i.material-icons:hover {
            color: #ffe28d;
        }

        /* table contents */

        table .title {
            font-size: 24px;
        }
        .details {
             font-size: 19px;
             text-align: left;
             margin-left: 15px;
         }
        .details tr {
            margin-bottom: 20px;
        }
        .toggle-buttons {
            text-align: right;
            font-size: 19px;
        }
    </style>
</head>
<body>
<header>
    <h1>FriendVault</h1>
</header>
<main class="sub-pages">
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
                <td>
            <table class="details">
                <tr>
                    <td class="title">NickName:</td>
                    <td><%= post.getTitle() %></td>
                </tr>
                <tr>
                    <td class="title">Name:</td>
                    <td><%= post.getWriter() %></td>
                </tr>
                <tr>
                    <td class="title">Contacts:</td>
                    <td><%= post.getContacts() %></td>
                </tr>
                <tr>
                    <td class="title">MBTI:</td>
                    <td><%= post.getMbti() %></td>
                </tr>
                <tr>
                    <td class="title">Any Comment:</td>
                    <td><%= post.getComment() %></td>
                </tr>
                <tr class="toggle-buttons">
                    <td class="title"></td>
                    <td>
                        <a class="edit" title="Edit" data-toggle="tooltip" href="editform.jsp?id=${post.getSeq()}">
                            <i class="material-icons">&#xE254;</i></a>
                        <a href="posts.jsp" class="btn btn-secondary">GO HOME</a>
                    </td>
                </tr>
            </table>
                </td>
            </tr>

        </table>
    </form>
</main>
</body>
</html>
