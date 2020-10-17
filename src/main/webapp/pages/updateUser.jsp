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
    <h3 style="color:darkgreen "> The User Information</h3>
</div>
<table align="center">

    <tr>
        <th>First name</th>
        <th>Last name</th>
        <th>National code</th>
        <th>Membership number</th>
        <th>Photo</th>
    </tr>
    <tr>
        <td align="center">${user.firstName}</td>
        <td align="center">${user.lastName}</td>
        <td align="center">${user.nationalCode}</td>
        <td align="center">${user.membershipNumber}</td>
        <td align="center">
            <img src="data:image/png;base64, ${user.base64Encoded}" alt="picture"/>
        </td>
    </tr>
</table>

<div align="center">
    <h3 style="color:darkgreen "> Enter any info that you want to change:</h3>
</div>

<form:form modelAttribute="user" action="userUpdateProcess" enctype="multipart/form-data" method="POST">
    <table align="center">
        <tr>
            <td>
                <form:label path="firstName"><b>First Name</form:label>
            </td>
            <td>
                <form:input path="firstName" name="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName"><b>Last Name</form:label>
            </td>
            <td>
                <form:input path="lastName" name="lastName" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="nationalCode"><b>National Code</form:label>
            </td>
            <td>
                <form:input path="nationalCode" name="nationalCode" />
            </td>
        </tr>
        <tr>
            <td>
                <label >Upload Picture</label>
            </td>
            <td>
                <input type="file"  name="photo" size="50"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <form:input type="hidden" path="membershipNumber" name="membershipNumber" value="${user.membershipNumber}"/>
            </td>
            <td>

                <input type="submit" value="Update"/>
            </td>
            <td>
                <input type="reset" value="Clear"/>
            </td>
        </tr>
    </table>
</form:form>

<p align="center"><a href="/">Home</a></p>
</body>
</html>