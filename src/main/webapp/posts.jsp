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
</head>
<style>

/* Below header - my info section */
	.my_info {
		text-align: center;
		margin-bottom: 30px;
	}

	.my_info img {
		width: 200px;
		height: 200px;
		border-radius: 50%;
		margin-bottom: 10px;
	}

	.my_info h2 {
		font-size: 24px;
	}

	.my_info p {
		margin-top: 5px;
		color: #777;
	}
	.my_info button {
		margin: 20px;
		padding: 10px;
		font-size: 20px;
		font-family: 'SamlipBasic', sans-serif;
		background-color: #98cfe9;
		color: #fff;
		border: none;
	}
.my_info button:hover {
	background-color: #3a5867;
	color: #fff;
	transition: 0.5s ease;
}

	/* profiles list */
.profile-grid {
	height: 90%;
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 30px;
	padding-top: 10px;
}

.profile-items {
	margin: 0;
	width: 200px;
	height: 200px;
	box-sizing: border-box;
	text-align: center;
	position: relative;
}
.profile-items img{
	object-fit: cover;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
.overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	border-radius: 50%;
	opacity: 0;
	transition: opacity 0.3s ease;
	background: rgba(0,0,0, 0.5);
}

.profile-title {
	color: white;
	width: 100%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}
.profile-items:hover .overlay {
	opacity: 1;
	transition: opacity 0.3s ease;
}
</style>
<body>
<header>
	<h1>FriendVault</h1>

</header>
<main>
	<section class="my_info">
		<img src="ProfilePic.jpg" alt="My ProfilePic">
		<h2>Hello! welcome to my Friend Vault! </h2>
		<button type="button" onclick="location.href='addpostform.jsp'">
			Click Here to be part of the squad
		</button>
	</section>

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

				<div class="overlay">
				<div class="profile-title">${u.title}</div>
				</div>
				</a>
			</div>
		</c:forEach>
	</div>
	</main>
</body>
</html>
