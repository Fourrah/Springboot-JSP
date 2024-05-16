<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list.css">
    <style>
        table, tr, td, th {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
        .button-container {
            margin-top: 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        const contextPath = "${pageContext.request.contextPath}";
    </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/save">글쓰기</a>
<div class="button-container">
    <button id="loadMore">더보기</button>
</div>
<form id="deleteForm" action="${pageContext.request.contextPath}/delete" method="POST">
    <table>
        <thead>
        <tr>
            <th class="center-align"><input type="checkbox" onclick="selectAll(this)"></th>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody id="boardTableBody">
        <!-- 테이블의 본문이 처음에는 비어 있습니다. -->
        </tbody>
    </table>
    <div class="button-container">
        <button type="submit">삭제</button>
    </div>
</form>
<script>
    let offset = 0; // 초기 오프셋을 0으로 설정합니다.

    $('#loadMore').click(function() {
        loadMoreData();
    });

    function loadMoreData() {
        $.ajax({
            url: `${contextPath}/list/more`,
            type: 'GET',
            data: { offset: offset },
            success: function(data) {
                console.log(data); // 데이터 형식을 확인합니다.
                if (Array.isArray(data)) {
                    appendDataToTable(data);
                    offset += data.length; // 로드된 데이터의 개수만큼 오프셋을 증가시킵니다.
                } else {
                    console.error("Expected an array but got:", data);
                }
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });
    }

    function appendDataToTable(data) {
        const tableBody = $('#boardTableBody');
        data.forEach(board => {
            const row = $('<tr>').append(
                $('<td>').addClass('center-align').append(
                    $('<input>').attr('type', 'checkbox').attr('name', 'boardId').attr('value', board.id)
                ),
                $('<td>').text(board.id),
                $('<td>').append(
                    $('<a>').attr('href', `${contextPath}/${board.id}`).text(board.boardTitle)
                ),
                $('<td>').text(board.boardWriter),
                $('<td>').text(board.createdAt),
                $('<td>').text(board.boardHits)
            );
            tableBody.append(row);
        });
    }

    function selectAll(source) {
        const checkboxes = document.getElementsByName('boardId');
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
        }
    }
</script>
</body>
</html>
