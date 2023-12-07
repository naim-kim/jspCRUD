<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>
<header>
    <h1>FriendVault</h1>
</header>
<section>
    <h2 class="sub">- Tell me About You -</h2>

</section>
<div class="container mt-5">
    <form action="addpost.jsp" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <td>Nickname:</td>
                <td><label>
                    <input type="text" class="form-control" name="title"/>
                </label></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><label>
                    <input type="text" class="form-control" name="writer" required/>
                </label></td>
            </tr>
            <tr>
                <td>Contact number:</td>
                <td><label>
                    <input type="text" class="form-control" name="contacts" required/>
                </label></td>
            </tr>
            <tr>
                <td>MBTI:</td>
                <td><label>
                    <input type="text" class="form-control" name="mbti" required/>
                </label></td>
            </tr>
            <tr>
                <td>Any comment:</td>
                <td><label>
                    <textarea class="form-control" rows="5" name="comment"></textarea>
                </label></td>
            </tr>

            <tr>
                <td>Photo</td><td><input type ="file" name="photo"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="posts.jsp" class="btn btn-secondary">GO HOME</a>
                    <input type="submit" class="btn btn-primary" value="Add Post"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
