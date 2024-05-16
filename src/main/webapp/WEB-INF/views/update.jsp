<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/update.css">
</head>
<body>
<form action="/update/${board.id}" method="post" name="updateForm">
    <input type="hidden" name="id" value="${board.id}">
    writer: <input type="text" name="boardWriter" value="${board.boardWriter}" readonly><br>
    title: <input type="text" name="boardTitle" value="${board.boardTitle}"><br>
    pass: <input type="text" name="boardPass" id="board-pass"><br>
    contents: <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea><br>
    <div class="button-container">
        <input type="button" value="수정" onclick="board_update()">
    </div>
</form>
</body>
<script>
    const board_update = () => {
        const boardPass = document.getElementById("board-pass").value;
        const passDB = [[${board.boardPass}]];
        if (boardPass == passDB) {
            updateForm.submit();
        } else {
            alert("비밀번호가 틀립니다!!");
        }
    }
</script>
</html>
