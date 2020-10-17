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
        <form:form modelAttribute="user" action="registerProcess" enctype="multipart/form-data" method="POST">
            <input type="hidden" name="purpose" value="R">
            <fieldset>
                <h2><p style="color:Navy">Register new user</p></h2>
                <p> You can register new user here.Please fill the following items.</p>

                <table align="center">
                    <tr>
                        <td>
                            <form:label path="firstName"><b>First Name</form:label>
                        </td>
                        <td>
                            <form:input path="firstName" name="name" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="lastName"><b>Last Name</form:label>
                        </td>
                        <td>
                            <form:input path="lastName" name="lastName" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="nationalCode"><b>National Code</form:label>
                        </td>
                        <td>
                            <form:input path="nationalCode" name="nationalCode" required="required"/>
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
                        <td></td>
                        <td>

                            <input type="submit" value="Register"/>
                        </td>
                        <td>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form:form>
    </div>

    <div class="child" position="absolute">
        <form:form modelAttribute="user" action="searchUser" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Search user</p></h2>
                <p> You can search user by any of following items. </p>

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
                            <form:input path="lastName" name="lastName"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:label path="nationalCode"><b>National Code</form:label>
                        </td>
                        <td>
                            <form:input path="nationalCode" name="nationalCode"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="membershipNumber"><b>Membership Number</form:label>
                        </td>
                        <td>
                            <form:input path="membershipNumber" name="membershipNumber"/>
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
        <form:form modelAttribute="user" action="updateUser" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Update user</p></h2>
                <p>  Please fill following items to choose the user. </p>

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
                            <form:input path="lastName" name="lastName"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <form:label path="nationalCode"><b>National Code</form:label>
                        </td>
                        <td>
                            <form:input path="nationalCode" name="nationalCode"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="membershipNumber"><b>Membership Number</form:label>
                        </td>
                        <td>
                            <form:input path="membershipNumber" name="membershipNumber"/>
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
        <form:form modelAttribute="user" action="deleteUser" method="GET">
            <fieldset>
                <h2><p style="color:Navy">Delete user</p></h2>
                <p> To delete a user please enter some items that can find it. </p>

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
                            <form:input path="lastName" name="lastName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="membershipNumber"><b>Membership Number</form:label>
                        </td>
                        <td>
                            <form:input path="membershipNumber" name="membershipNumber"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="nationalCode"><b>National Code</form:label>
                        </td>
                        <td>
                            <form:input path="nationalCode" name="nationalCode"/>
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