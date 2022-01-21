<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<html>
<head>
	<title>DB Only Input</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>RM1=DB(1), RM2=n/a</h2>

<%@include file="CommonHeader.jsp"%>

<form action="DB1_Only_Execute.jsp" method="POST">
<%@include file="DummyRMInput.jsp"%>
</form>

<p>
<hr>
<a href="index.html">Home</a>

</body>
</html>
