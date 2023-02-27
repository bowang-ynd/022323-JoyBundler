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
            <div class="d-flex justify-content-evenly">
                <div>
                    <h1>Add a Name</h1>
                </div>
            </div>
            <div class="card d-flex justify-content-evenly">
                <form:form action="/names/processNewName" method="POST" modelAttribute="name">
                    <div>
                        <form:errors path="babyName" cssStyle="color: red"></form:errors>
                    </div>
                    <div>
                        <form:errors path="gender" cssStyle="color: red"></form:errors>
                    </div>
                    <div>
                        <form:errors path="origin" cssStyle="color: red"></form:errors>
                    </div>
                    <div>
                        <form:errors path="meaning" cssStyle="color: red"></form:errors>
                    </div>
                    <form:hidden path="user" value="${user.id}"></form:hidden >
                    <div class="mb-3 form-control">
                        <form:label path="babyName">New Name:</form:label>
                        <div class="input-group">
                            <form:input path="babyName"></form:input>
                        </div>
                    </div>
                    <div class="mb-3 form-control">
                        <form:label path="gender">Typical Gender:</form:label>
                        <div class="input-group">
                            <form:select path="gender">
                                <form:option path="gender" value="Male">Male</form:option>
                                <form:option path="gender" value="Female">Female</form:option>
                                <form:option path="gender" value="Neutral">Neutral</form:option>
                            </form:select>
                        </div>
                    </div>
                    <div class="mb-3 form-control">
                        <form:label path="origin">Origin:</form:label>
                        <div class="input-group">
                            <form:input path="origin"></form:input>
                        </div>
                    </div>
                    <div class="mb-3 form-control">
                        <form:label path="meaning">Meaning:</form:label>
                        <div class="input-group">
                            <form:input path="meaning"></form:input>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <a href="/home" class="btn btn-warning">Cancel</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
