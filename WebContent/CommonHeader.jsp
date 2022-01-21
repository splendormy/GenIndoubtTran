<%@page pageEncoding="UTF-8" %>

<% String serverName = java.net.InetAddress.getLocalHost().getHostName(); %>

<hr>
<h3>Date/Time=<%= new java.util.Date()%></h3>
<h3>ServerName=<%=serverName%></h3>
<hr>
