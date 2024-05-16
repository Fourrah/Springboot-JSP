<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
    <style>
        table, tr, td, th {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <td>${board.id}</td>
    </tr>
    <tr>
        <th>title</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>writer</th>
        <td>${board.boardWriter}</td>
    </tr>
    <tr>
        <th>date</th>
        <td>${board.createdAt}</td>
    </tr>
    <tr>
        <th>hits</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>contents</th>
        <td>${board.boardContents}</td>
    </tr>
</table>
<div class="button-container">
    <button onclick="listReq()">목록</button>
    <button onclick="updateReq()">수정</button>
    <button onclick="deleteReq()">삭제</button>
</div>
</body>
<script>
    const listReq = () => {
        location.href = "/list";
    }
    const updateReq = () => {
        location.href = "/update/${board.id}";
    }
    const deleteReq = () => {
        location.href = "/delete/${board.id}";
    }
</script>
</html>