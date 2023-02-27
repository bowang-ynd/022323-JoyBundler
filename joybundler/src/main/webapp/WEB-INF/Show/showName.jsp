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
            <div class="d-flex flex-column justify-content-evenly">
                <div class="d-flex flex-row justify-content-between" style="gap: 50px">
                    <div>
                        <h1><strong><em><c:out value="${name.babyName}"/></em></strong></h1>
                    </div>
                    <div>
                        <a href="/home">home</a>
                    </div>
                </div>
                <div>
                    <h2>(added by <span><c:out value="${name.user.username}"/>)</span></h2>
                    <h2>Gender: <span><c:out value="${name.gender}"/></span></h2>
                    <h2>Gender: <span><c:out value="${name.origin}"/></span></h2>
                    <c:if test="${isVoted == true}">
                        <h2 style="color:#A725FF">You voted for this name</h2>
                    </c:if>
                    <p>Meaning: <span><c:out value="${name.meaning}"/></span></p>
                </div>
                <c:if test="${name.user.id == user.id}">
                    <div class="d-flex justify-content-start" style="gap: 15px;">
                        <div>
                            <a href="/names/${name.id}/edit" class="btn btn-info">edit</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
