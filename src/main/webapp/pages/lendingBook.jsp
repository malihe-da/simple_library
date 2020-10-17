<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Define New Exam</title>
    <link href="<c:url value="/resources/theme/css/managementStyle.css"/>" rel="stylesheet"/>
</head>
<body>

<div>
    <h1 align="center" style="color: darkmagenta">Lending Management!</h1>
</div>
<div align="center">
    <h2>
        <br><br><label style="color: darkred"> ${message} </label><br><br>
    </h2>

</div>
<div align="center">
    <h3 style="color: darkblue ">Choose user and book to lend the book</h3>
</div>
<form:form modelAttribute="lending" action="lendingProcess" method="GET">
    <div class="container" class="container" position="flex">

        <div class="child" position="absolute">
            <fieldset>
                <h3><p style="color:Navy">Enter user membership number</p></h3>
                <table align="center">

                    <tr>
                        <td>
                            <form:label path="userMembershipNumber">User membership number</form:label>
                        </td>
                        <td>
                            <form:input path="userMembershipNumber" name="userMembershipNumber" required="required"/>
                        </td>
                    </tr>
                </table>

            </fieldset>

        </div>
        <div class="child" position="absolute">
            <fieldset>
                <h3><p style="color:Navy">Enter book ISBN</p></h3>
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="bookISBN">Book ISBN</form:label>
                        </td>
                        <td>
                            <form:input path="bookISBN" name="bookISBN" required="required"/>
                        </td>
                    </tr>
                </table>

            </fieldset>

        </div>
    </div>

    <h2 align="center"><p style="color:Navy">Choose delivery and return date</p></h2>

    <table align="center">
        <tr>
            <td>
                <label path="deliveryDate">Delivery Date</label>
            </td>
            <td>
                <form:input type="date" id="startDate" path="deliveryDate" name="deliveryDate" required="required"
                            value="<%=new Date()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <label path="returnDate">Return Date</label>
            </td>
            <td>
                <form:input type="date" id="endDate" path="returnDate" name="returnDate" required="required"
                            onchange="checkEndDate()"/>
                <p id="msg"></p>
            </td>
        </tr>

    </table>
    <div align="center">
        <p><br>
            <form:button name="submit">Submit</form:button>
            <input type="reset" value="Clear"/>

        </p>
    </div>
    </div>
    </div>
</form:form>
<p align="center"><a href="/">Home</a></p>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script type="text/JavaScript">
    window.onload = function checkStartDate(){
        document.getElementById("startDate").innerHTML = 'new Date()' ;
        var startDate = new Date();
        var endDate = new Date(document.getElementById("startDate").value);

     /*   if (startDate < endDate) {

            alert('Please select a delivery date today!');
        }*/
    }
    function checkEndDate() {
        var startDate = new Date(document.getElementById("startDate").value);
        var endDate = new Date(document.getElementById("endDate").value);

        if (startDate > endDate) {
            alert('Please select the delivery date after the return date!');
            document.getElementById("endDate").innerText = 'startDate';
        }
    }
</script>
</body>
</html>