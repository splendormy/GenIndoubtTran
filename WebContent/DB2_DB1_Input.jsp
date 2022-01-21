<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<html>
<head>
	<title>DB-DB Input</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>RM1=DB(2), RM2=DB(1)</h2>

<%@include file="CommonHeader.jsp"%>

<form action="DB2_DB1_Execute.jsp" method="POST">
<%@include file="DummyRMInput.jsp"%>
</form>

<p>
<hr>
<a href="index.html">Home</a>

</body>
</html>
