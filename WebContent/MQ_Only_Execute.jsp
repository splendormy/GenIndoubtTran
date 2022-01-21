<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="false" %>

<%@page import="java.io.PrintWriter"%><html>
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
	<title>MQ Only Execute</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>RM1=MQ, RM2=n/a</h2>

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
		// MQ
		//---------------------------------------------------------------------
		ConnectionFactory cf = lookupConnectionFactory();
		Queue q = lookupQueue();
		javax.jms.Connection mqcon = cf.createConnection();
		mqcon.start();	
		Session ses = mqcon.createSession( false, Session.AUTO_ACKNOWLEDGE );
		MessageProducer sender = ses.createProducer( q );
		String msgStr = "2PC TEST: MQ Only";
		TextMessage txtMsg = ses.createTextMessage( msgStr );
		sender.send( txtMsg );
		sender.close();
		ses.close();
		mqcon.close();
		
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
