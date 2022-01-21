<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>

<%@page import="java.io.PrintWriter"%><html>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.jms.ConnectionFactory"%>
<%@page import="javax.jms.Session"%>
<%@page import="javax.jms.Queue"%>
<%@page import="javax.jms.MessageProducer"%>
<%@page import="javax.jms.MessageConsumer"%>
<%@page import="javax.jms.Message"%>
<%@page import="javax.jms.TextMessage"%>
<%@page import="dummyrm.DummyXAResource" %>
<%@page import="dummyrm.DummyXAUtil" %>

<head>
	<title>DB-DB Execute</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>RM1=DB(1), RM2=DB(2)</h2>

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
		// DB(1)
		//---------------------------------------------------------------------
		String sql1 = "INSERT INTO TESTTBL VALUES( CURRENT TIMESTAMP, \'2PC TEST: DB-DB (1)\' )";
		DataSource ds1 = lookupDataSource1();
		java.sql.Connection dbcon1 = ds1.getConnection();
		Statement st1 = dbcon1.createStatement();
		st1.executeUpdate( sql1 );
		st1.close();
		dbcon1.close();
		
		// Dummy RM 2 - enlist
		DummyXAUtil.enlist( "dummy2", sleepPosition2, sleepDuration2 * 1000 );
		
		//---------------------------------------------------------------------
		// DB(2)
		//---------------------------------------------------------------------
		String sql2 = "INSERT INTO TESTTBL VALUES( CURRENT TIMESTAMP, \'2PC TEST: DB-DB (2)\' )";
		DataSource ds2 = lookupDataSource2();
		java.sql.Connection dbcon2 = ds2.getConnection();
		Statement st2 = dbcon2.createStatement();
		st2.executeUpdate( sql2 );
		st2.close();
		dbcon2.close();

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
