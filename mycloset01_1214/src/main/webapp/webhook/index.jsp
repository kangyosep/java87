<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if (request.getParameter("hub.mode").equals("subscribe") && 
	 request.getParameter("hub.verify_token").equals("1222628424496492")) {
      out.print(request.getParameter("hub.challenge"));
      System.out.println("여기들어오십니까");
} else {
  out.print("Failed validation. Make sure the validation tokens match.");
  System.out.println("여기들어오십니까");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

