<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Joy Bundler Names</title>
        <link
            rel="stylesheet"
            href="/webjars/bootstrap/css/bootstrap.min.css"
        />
        <link rel="stylesheet" href="/css/main.css" />
        <!-- change to match your file/naming structure -->
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/js/app.js"></script>
        <!-- change to match your file/naming structure -->
    </head>
    <body>
        <div class="container d-flex flex-column jusitfy-content-center">
            <h1 class="text-center" style="color: #44B84F">Joy Bundler Names</h1>
            <div class="card d-flex flex-row justify-content-evenly">
                <div class="card-body" style="background-color: lightsteelblue;">
                    <h2 class="text-center"><strong>Register</strong></h2>
                    <form:form action="/register" method="POST" modelAttribute="newUser">
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="username">Name:</form:label>
                            <div>
                                <form:errors path="username" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:input path="username"></form:input>
                            </div>
                        </div>
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="email">Email:</form:label>
                            <div>
                                <form:errors path="email" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:input path="email"></form:input>
                            </div>
                        </div>
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="password">Password:</form:label>
                            <div>
                                <form:errors path="password" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:password path="password"></form:password>
                            </div>
                        </div>
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="confirm">Confirm PW:</form:label>
                            <div>
                                <form:errors path="confirm" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:password path="confirm"></form:password>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit">Register</button>
                        </div>
                    </form:form>
                </div>
                <div class="card-body" style="background-color: lightsteelblue;">
                    <h2 class="text-center"><strong>Login</strong></h2>
                    <form:form action="/login" method="POST" modelAttribute="newLogin">
                        <div>
                            <form:errors path="email" cssStyle="color: red"></form:errors>
                        </div>
                        <div>
                            <form:errors path="password" cssStyle="color: red"></form:errors>   
                        </div> 
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="email">Email:</form:label>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:input path="email"></form:input>
                            </div>
                        </div>
                        <div class="mb-3 form-control" style="background-color: lightsteelblue;">
                            <form:label path="password">Password:</form:label>
                            <div class="input-group" style="background-color: lightsteelblue;">
                                <form:password path="password"></form:password>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit">Login</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
