<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>UserList</title>
    <style type="text/css">
        .container {
            display: flex;
        }

        nav {
            width: 50vh;
            height: 10vh;
        }
        body {
            background-color: aquamarine;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<div align="center">
    <h2 style="color: darkblue"></h2>
</div>

<table align="center">

    <tr>
        <th>Book name</th>
        <th>Author name</th>
        <th>Book ISBN</th>
        <th>Book count</th>
    </tr>
    <c:forEach items="${bookList}" var="book">
    <tr>
        <td align="center">${book.name}</td>
        <td align="center">${book.author}</td>
        <td align="center">${book.ISBN}</td>
        <td align="center">${book.count}</td>
    </tr>
    </c:forEach>

    <p align="center"><a href="/">Home</a></p>


</body>

</html>
