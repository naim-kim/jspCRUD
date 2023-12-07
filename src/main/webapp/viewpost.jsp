<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO, com.example.jspcrud.vo.BoardVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Post</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
        .bi-pencil {
            font-size: 1.5rem; /* Adjust the size as needed */
            color: #007bff; /* Bootstrap's primary color */
            margin-right: 5px; /* Adjust the spacing as needed */
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
    <%
        BoardDAO boardDAO = new BoardDAO();
        String id = request.getParameter("id");
        BoardVO post = boardDAO.getBoard(Integer.parseInt(id));
        request.setAttribute("post", post);
    %>

    <script>
        function confirmDelete() {
            // Display a confirmation dialog
            var isConfirmed = confirm("Warning: You are about to delete an item. This action cannot be undone. Are you sure you want to proceed?");

            if (isConfirmed) {
                window.location.href = "deletepost.jsp?id=<%= post.getSeq() %>";
                alert("Post has been deleted.");
            } else {
                alert("Delete canceled.");
            }
        }

    </script>
</head>
<body>
<header>
    <h1>FriendVault</h1>
</header>
<main class="sub-pages">

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

            </table>
                    <div class="col-md-12">
                        <a class="bi bi-pencil" title="Edit" data-toggle="tooltip" href="editform.jsp?id=${post.getSeq()}"></a>
                        <a class="btn btn-danger" onclick="confirmDelete()">Delete</a>
                        <a class="btn btn-secondary" href="javascript:history.back()">Go back</a>
                    </div>
                </td>
            </tr>

        </table>
    </form>
</main>
</body>
</html>
