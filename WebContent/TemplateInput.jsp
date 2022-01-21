<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>
<html>
<head>
	<title>TemplateInput</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>TemplateInput</h2>

<%@include file="CommonHeader.jsp"%>

<form action="TemplateExecute.jsp" method="POST">
<%@include file="DummyRMInput.jsp"%>
</form>

<p>
<hr>
<a href="index.html">Home</a>

</body>
</html>
