<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Member Info</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid hotpink;
            padding: 8px;
            text-align:center;
            background-color: pink;
        }
        #list tr:nth-child(even){background-color: lightpink;}
        #list tr:hover {background-color: lightcoral;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: pink;
            color: beige;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>Member Info 🐰🍀</h1>
<%
    MemberDAO MemberDAO = new MemberDAO();
    List<MemberVO> list = MemberDAO.getMemberList();
    request.setAttribute("list",list);
%>
<table id="list" width="90%">
    <tr>
        <th>No.</th>
        <th>ID</th>
        <th>PW</th>
        <th>Name</th>
        <th>Email</th>
        <th>Detail</th>
        <th>Regdate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.getSid()}</td>
            <td>${u.getUserid()}</td>
            <td>${u.getPassword()}</td>
            <td>${u.getUsername()}</td>
            <td>${u.getEmail()}</td>
            <td>${u.getDetail()}</td>
            <td>${u.getRegdate()}</td>
            <td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addform.jsp">Add New Member</a>
</body>
</html>