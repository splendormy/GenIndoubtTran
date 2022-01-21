<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>

<%@page import="java.io.PrintWriter"%><html>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="dummyrm.DummyXAResource" %>
<%@page import="dummyrm.DummyXAUtil" %>

<head>
	<title>DB Only Execute</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>RM1=DB(1), RM2=n/a</h2>

<%@include file="CommonHeader.jsp"%>
<%@include file="DummyRMOutput.jsp"%>
<% out.flush(); %>

<hr>
<pre>
<%
	try {
	
		// Start Transaction
		UserTransaction ut = lookupUserTransaction();
		ut.begin();
	
		// Dummy RM 1 - enlist
		DummyXAUtil.enlist( "dummy1", sleepPosition1, sleepDuration1 * 1000 );
		
		//---------------------------------------------------------------------
		// DB 
		//---------------------------------------------------------------------
		String sql1 = "INSERT INTO TESTTBL VALUES( CURRENT TIMESTAMP, \'2PC TEST: DB Only\' )";
		DataSource ds1 = lookupDataSource1();
		java.sql.Connection dbcon1 = ds1.getConnection();
		Statement st1 = dbcon1.createStatement();
		st1.executeUpdate( sql1 );
		st1.close();
		dbcon1.close();

		// Dummy RM 2 - enlist
		DummyXAUtil.enlist( "dummy2", sleepPosition2, sleepDuration2 * 1000 );
		
		// Dummy RM 3 - enlist
		DummyXAUtil.enlist( "dummy3", sleepPosition3, sleepDuration3 * 1000 );
		
		// Commit Transaction
		ut.commit();
		
	} catch ( Exception e ) {
		out.println( e.getMessage() );
		PrintWriter pw = new PrintWriter( out );
		e.printStackTrace( pw );
		pw.flush();
	}

%>
</pre>

<p>
<hr>
<a href="index.html">Home</a>

</body>
</html>
