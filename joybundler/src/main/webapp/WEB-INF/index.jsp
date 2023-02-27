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
            <div class="d-flex justify-content-between">
                <div>
                    <h1 style="color:#07A116">Hello <c:out value="${user.username}"/>. Here are some suggestions..</h1>
                </div>
                <div class="d-flex flex-column jusitfy-content-center align-center">
                    <a href="/logout" style="text-decoration: underline;">logout</a>
                </div>
            </div>
            <div class="card d-flex justify-content-evenly">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col"><strong>Baby Names</strong></th>
                            <th scope="col"> </th>
                            <th scope="col"> </th>
                            <th scope="col"><span style="color: #9900FF">Votes</span></th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="name" items="${names}">
                            <tr>
                                <th scope="row"><a href="/names/${name.id}/vote" class="btn btn-info">Upvote</a></th>
                                <td><a href="/names/${name.id}"><c:out value="${name.babyName}" /></a></td>
                                <td><c:out value="${name.gender}" /></td>
                                <td>Origin: <c:out value="${name.origin}" /></td>
                                <td><c:out value="${name.votes}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-start">
                    <a href="/names/new" class="btn btn-success">new name</a>
                </div>
            </div>
        </div>
    </body>
</html>
