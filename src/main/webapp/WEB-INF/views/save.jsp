<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/input.css">
</head>
<body>
<form action="/save" method="post" enctype="multipart/form-data">
    제목: <input type="text" name="boardTitle"><br>
    작성자: <input type="text" name="boardWriter"><br>
    비밀번호: <input type="text" name="boardPass"><br>
    내용: <textarea name="boardContents"></textarea>
    <div class="input-container">
        <input type="submit" value="작성">
    </div>
</form>
</body>
</html>
