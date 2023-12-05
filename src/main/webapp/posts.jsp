<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO, com.example.jspcrud.vo.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Main Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<style>
		.photo-col {
			width: 300px;
		}
		.form-table-col {
			width: 80%;
		}
		.form-control {
			width: 100%;
		}
		.profile-items img {
			width: 150px;
			height: 150px;
			object-fit: cover;
			border-radius: 50%;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}

	</style>
</head>
<body>
<header>
	<h1>FriendVault</h1>

</header>
<main>
	<section class="my_info">
		<img src="ProfilePic.jpg" alt="My ProfilePic">
		<h2>Hello! welcome to my Friend Vault! </h2>
		<p><a href="viewpost.jsp" class="btn btn-primary custom-btn"> [ No thanks I just want to see the list ]</a>
		<p><a href="addpostform.jsp" class="btn btn-primary custom-btn"> [ Click Here to be part of the squad ]</a>
		</p>
	</section>

<div class="container">
	<div class="profile-grid">
		<%
			BoardDAO boardDAO = new BoardDAO();
			List<BoardVO> list = boardDAO.getBoardList();
			request.setAttribute("list", list);
		%>
		<c:forEach items="${list}" var="u" varStatus="loop">
			<div class="profile-items">
				<a href="viewpost.jsp?id=${u.seq}" class="edit-link">
					<img src="<%= request.getContextPath() %>/upload/<c:out value="${u.photo}"/>" alt="Image ${loop.index + 1}">
				</a>
				<div class="profile-title">${u.title}</div>

			</div>
		</c:forEach>
	</div>

</div>
	</main>
</body>
</html>
