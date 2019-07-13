<%@ page import="Model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: haupham
  Date: 7/11/19
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" uri="http://cs.mum.edu"%>

<html>
<head>
    <title>Don't allow</title>
</head>
<body>
    <h3>You are not allowd here ${sessionScope.currtUsr.username} :: ${sessionScope.currtUsr.password}</h3>
    <c:out value="Test value : ${5>7}"/>
    <a href="<c:url value="http://www.google.com">
        <c:param name="q" value='w3chool.com servlet' />
    </c:url>">Search from Google</a>
    <a href=" <c:url value="/view/index.jsp" context="/day2" />">Login</a>
    <a href="<c:url value="/view/success.jsp" context="/day2" />">Success</a>
    <ct:tag1/>
    <br>
    <ct:tag2>
             Hello from the tag body.
    </ct:tag2>
    <br>

    <ct:tag3 message="Hello From Attributes :)" />
    <br>
    <ct:tag3 message='<%= request.getHeader("User-Agent") %>' />
    <br>
    <ct:tag3 message="${pageContext.request.localAddr}" />
    <br>
    <ct:label foreColor='red' text='Hello world!!!'/>
    <!-- will generate the following HTML: <span style='color:red'>Hello</span> -->

    <%
        List<User> users = new ArrayList<User>();
            users.add(new User("user1","1234"));
            users.add(new User("user2","1234"));
            users.add(new User("user1","1234"));
    %>
    <c:forEach items="${users}" var="user" varStatus="status">
        ${status.begin} // begin attribute from the loop tag
        <c:out value="${status.end}"> ${status.username}</c:out>// end attribute form the loop tag
        ${status.step} // step attribute from the loop tag
        ${status.count} // count of the n umber of iterations performed so far ${status.current} // current item from the iteration
        ${status.index} // current index from the iteraton ${status.first} // true if the current iteration is the first one ${status.last} // true if the current iteration is the last one
    </c:forEach>
</body>
</html>
