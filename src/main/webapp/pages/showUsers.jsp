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

<div class="container">
    <nav></nav>
</div>
<div align="center">
    <h2 style="color: darkblue"></h2>
</div>

<table align="center">

    <tr>
        <th>First name</th>
        <th>Last Name</th>
        <th>National code</th>
        <th>MemberShip number</th>
        <th>Photo</th>
    </tr>
    <c:forEach items="${userList}" var="user">
    <tr>
        <td align="center">${user.firstName}</td>
        <td align="center">${user.lastName}</td>
        <td align="center">${user.nationalCode}</td>
        <td align="center">${user.membershipNumber}</td>
        <td align="center">
                <img src="data:image/png;base64, ${user.base64Encoded}" alt="picture"/>
        </td>
    </tr>
    </c:forEach>

    <p align="center"><a href="/">Home</a></p>


</body>

</html>
