<%@page import="dummyrm.DummyXAUtil"%>
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
	<title>TemplateExecute</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>TemplateExecute</h2>

<%@include file="CommonHeader.jsp"%>
<%@include file="DummyRMOutput.jsp"%>
<% out.flush(); %>

<hr>
<pre>
<%
	DummyXAResource.SleepPosition rmSleepPosition;
	rmSleepPosition = DummyXAResource.SleepPosition.None;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_Start;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_End;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_Prepare;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_Commit;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_Rollback;
//	rmSleepPosition = DummyXAResource.SleepPosition.At_Forget;

	try {
	
		// Start Transaction
		UserTransaction ut = lookupUserTransaction();
		ut.begin();
	
		// Dummy RM 1 - enlist
		DummyXAUtil.enlist( "dummy1", sleepPosition1, sleepDuration1 * 1000 );
		
		
		
		
		
		//---------------------------------------------------------------------
		// Add DB or MOM processing, and delete RM1 definition.
		//---------------------------------------------------------------------
		DummyXAUtil.enlist( "RM1", rmSleepPosition, 0 );
		
		
		
		
		
		// Dummy RM 2 - enlist
		DummyXAUtil.enlist( "dummy2", sleepPosition2, sleepDuration2 * 1000 );
		
		
		
		
		
		//---------------------------------------------------------------------
		// Add DB or MOM processing, and delete RM2 definition.
		//---------------------------------------------------------------------
		DummyXAUtil.enlist( "RM2", rmSleepPosition, 0 );
		
		
		
		
		
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
