<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Member</h1>
<form action="add_ok.jsp" method="post">
    <table>
        <tr><td>ID:</td><td><input type="text" name="userid"/></td></tr>
        <tr><td>PW:</td><td><input type="text" name="password"/></td></tr>
        <tr><td>Name:</td><td><input type="text" name="username"/></td></tr>
        <tr><td>Email:</td><td><input type="text" name="email"/></td></tr>
        <tr><td>Detail:</td><td><textarea cols="30" rows="5" name="detail"></textarea></td></tr>
        <tr><td><a href="view.jsp">View All Member</a></td><td align="right"><input type="submit" value="Add Member"/></td></tr>
    </table>
</form>

</body>
</html>