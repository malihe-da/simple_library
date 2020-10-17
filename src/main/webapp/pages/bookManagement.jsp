<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>

    <link href="<c:url value="/resources/theme/css/managementStyle.css"/>" rel="stylesheet"/>

</head>
<body>
<div align="center">
    <h2><br><label style="color: crimson"> ${message} </label><br></h2>
</div>

<div class="container" class="container" position="flex">


    <div class="child" position="absolute">
        <fieldset>
            <form:form modelAttribute="book" action="submitNewBook" method="POST">
                <h2><p style="color:Navy">Register New Book</p></h2>


                <table align="center">
                    <tr>
                        <td>
                            <form:label path="name"><b>Book Name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author"><b>Author Name</form:label>
                        </td>
                        <td>
                            <form:input path="author" name="author" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="ISBN"><b>ISBN</form:label>
                        </td>
                        <td>
                            <form:input path="ISBN" name="ISBN" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="count"><b>Count</form:label>
                        </td>
                        <td>
                            <form:input type="number" path="count" name="count"/>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Submit"/>
                        </td>
                        <td></td>
                        <td>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form:form>
        </fieldset>
    </div>

    <div class="child" position="absolute">
        <form:form modelAttribute="book" action="searchBook" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Search Book</p></h2>
                <p> You can search books by any of following items.</p>
                <p></p>
                <p></p>
                <table align="center">
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>
                            <form:label path="name"><b>Book Name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author"><b>Author Name</form:label>
                        </td>
                        <td>
                            <form:input path="author" name="author"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:label path="ISBN"><b>ISBN </form:label>
                        </td>
                        <td>
                            <form:input path="ISBN" name="ISBN"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Search"/>
                        </td>
                        <td><input type="reset" value="Clear"/></td>
                    </tr>

                </table>
            </fieldset>
        </form:form>
    </div>
</div>

<div class="container" class="container" position="flex">
    <div class="child" position="absolute">
        <form:form modelAttribute="book" action="updateBookCount" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Update Book Count</p></h2>
                <p> You can update the book count here.  </p>

                <table align="center">
                    <tr>
                        <td>
                            <form:label path="name"><b>Book Name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author"><b>Book Author</form:label>
                        </td>
                        <td>
                            <form:input path="author" name="author"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:label path="ISBN"><b>Book ISBN</form:label>
                        </td>
                        <td>
                            <form:input path="ISBN" name="ISBN"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Update"/>
                        </td>
                        <td><input type="reset" value="Clear"/></td>
                    </tr>

                </table>
            </fieldset>
        </form:form>
    </div>
    <div class="child" position="absolute">
        <form:form modelAttribute="book" action="deleteBook" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Delete book</p></h2>
                <p> To delete a book please enter some items that can find it.<br></p>

                <table align="center">
                    <tr>
                        <td>
                            <form:label path="name"><b>Book Name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author"><b>Book Author</form:label>
                        </td>
                        <td>
                            <form:input path="author" name="author"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="ISBN"><b>Book ISBN</form:label>
                        </td>
                        <td>
                            <form:input path="ISBN" name="ISBN"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Delete"/>
                        </td>
                        <td><input type="reset" value="Clear"/></td>
                    </tr>

                </table>
            </fieldset>
        </form:form>
    </div>
</div>
<p align="center"><a href="/">Home</a></p>

</body>
</html>