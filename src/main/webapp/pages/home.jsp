<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Library Home</title>
    <link href="<c:url value="/resources/theme/css/style1.css"/>" rel="stylesheet"/>
</head>
<body>

<div align="center">
    <br><br>
    <h1>Welcome to Library</h1><br><br>
</div>

<div class="container" class="container" position="flex">

    <div class="child" position="absolute"></div>
    <div class="child" position="absolute">
        <form action="userManagement" method="GET">
            <fieldset>
                <h3 style="color: darkgreen">For register new user, edit user, search or delete user </h3>
                <button class="button" type="submit"> User Management </button>
            </fieldset>
        </form>
    </div>

    <div class="child" position="absolute">
        <form action="bookManagement" method="GET">
            <fieldset>
                <h3 style="color: darkblue">For submit new book, search or delete book</h3>
                <button class="button" type="submit">Book Management</button>
            </fieldset>
        </form>
    </div>

</div>

<div class="container" class="container" position="flex">
    <div class="child" position="absolute"></div>
    <div class="child" position="absolute">
        <form action="lendingBook" method="GET">
            <fieldset>
                <h3 style="color: darkred"> Lending books</h3>
                <button class="button" type="submit">Lending book</button>
            </fieldset>
        </form>
    </div>
</div>



</body>
</html>