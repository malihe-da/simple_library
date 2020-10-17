<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>UserEdit</title>
    <style>
        body {
            background-color: lavenderblush;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

    </style>
</head>
<body>
<div align="center">
    <h2>
        <br><br><label style="color: darkblue"> ${message} </label><br><br>
    </h2>

</div>
<div align="center">
    <h3 style="color:darkgreen "> The Book Information</h3>
</div>
<table align="center">

    <tr>
        <th>Book name</th>
        <th>Book author</th>
        <th>Book ISBN</th>
        <th>Book count</th>
    </tr>
    <tr>
        <td align="center">${book.name}</td>
        <td align="center">${book.author}</td>
        <td align="center">${book.ISBN}</td>
        <td align="center">${book.count}</td>
    </tr>
</table>

<div align="center">
    <h3 style="color:darkgreen "> Enter the new count of this book:</h3>
</div>

<form:form modelAttribute="book" action="bookCountUpdateProcess" method="GET">
    <table align="center">
        <tr>
            <td>
                <form:label path="count"><b>New count</form:label>
            </td>
            <td>
                <form:input path="count" name="count"/>
            </td>
                <form:input type="hidden" path="ISBN" name="ISBN" value="${book.ISBN}"/>
            </td>
        </tr>
    </table>
    <div align="center">
        <p><br>
            <form:button name="submit">Submit</form:button>
            <input type="reset" value="Clear"/>

        </p>
    </div>

</form:form>

<p align="center"><a href="/">Home</a></p>
</body>
</html>