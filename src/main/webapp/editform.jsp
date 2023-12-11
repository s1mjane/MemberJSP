<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<%@ page import="com.example.dao.MemberDAO" %>
<%@ page import="com.example.bean.MemberVO" %>
<!DOCTYPE html
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Member</title>
</head>
<body>

<%
    MemberDAO boardDAO = new MemberDAO();
    String id=request.getParameter("id");
    MemberVO u=boardDAO.getMember(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="edit_ok.jsp" method="post">
    <input type="hidden" name="sid" value="<%=u.getSid() %>"/>
    <table>
        <tr><td>Name: </td><td><input type="text" name="username" value="<%=u.getUsername()%>"/></td></tr>
        <tr><td>Email: </td><td><input type="text" name="email" value="<%=u.getEmail()%>"/></td></tr>
        <tr><td>Detail: </td><td><input type="text" name="detail" value="<%=u.getDetail()%>"/></td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Member"/>
            <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
    </table>
</form>

</body>
</html>