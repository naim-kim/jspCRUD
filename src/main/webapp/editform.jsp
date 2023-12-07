<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.jspcrud.dao.BoardDAO, com.example.jspcrud.vo.BoardVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<script>
		function goHome() {
			window.location.href = "posts.jsp";
		}
	</script>
</head>
<body>
<header>
	<h1 onclick="goHome()">FriendVault</h1>
</header>
<section>
	<h2 class="sub">- Edit -</h2>

</section>
<%
	BoardDAO boardDAO = new BoardDAO();
	String id = request.getParameter("id");
	BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<div class="container">

	<form action="editpost.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="<%=u.getSeq()%>"/>
		<div class="row">
			<div class="col-md-6">

				<c:if test="${vo.getPhoto() ne ''}">
					<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo" width="250" height="auto">
				</c:if>
				<div class="photo-col">
					<label>Profile picture: </label> <input type="file" name="photo" value="${vo.getPhoto()}">
				</div>
			</div>
			<div class="col-md-6">
				<table class="table form-table-col">
					<tr>
						<td>Nickname:</td>
						<td><label>
							<input type="text" class="form-control" name="title" value="<%= u.getTitle()%>"/>
						</label></td>
					</tr>
					<tr>
						<td>Name:</td>
						<td><label>
							<input type="text" class="form-control" name="writer" value="<%= u.getWriter()%>"/>
						</label></td>
					</tr>
					<tr>
						<td>Contact number:</td>
						<td><label>
							<input type="text" class="form-control" name="contacts" value="<%= u.getContacts()%>"/>
						</label></td>
					</tr>
					<tr>
						<td>MBTI:</td>
						<td><label>
							<input type="text" class="form-control" name="mbti" value="<%= u.getMbti()%>"/>
						</label></td>
					</tr>
					<tr>
						<td>Any comment:</td>
						<td><label>
							<textarea class="form-control" rows="5" name="comment"><%= u.getWriter()%></textarea>
						</label></td>
					</tr>
				</table>
				<div class="buttons">
					<div class="col-md-12">
						<button type="submit" class="btn btn-success">
							<i class="bi bi-check-circle-fill"></i>  Submit
						</button>
						<a class="btn btn-secondary" href="posts.jsp">
							<i class="bi bi-house-fill"></i>  Go Home
						</a>
					</div>
				</div>
			</div>
		</div>

	</form>
</div>

</body>
</html>