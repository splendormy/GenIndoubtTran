
<%@page pageEncoding="UTF-8" %>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.transaction.UserTransaction"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.jms.ConnectionFactory"%>
<%@page import="javax.jms.Queue"%>
<%@page import="dummyrm.DummyXAResource" %>

<%!
	// Convert String to SleepPosition.
	private DummyXAResource.SleepPosition toSleepPositionValue( String param ) {
		if ( param == null ) return DummyXAResource.SleepPosition.None;
		if ( param.equals( "NO_SLEEP"          ) ) return DummyXAResource.SleepPosition.None;
		if ( param.equals( "SLEEP_AT_START"    ) ) return DummyXAResource.SleepPosition.At_Start;
		if ( param.equals( "SLEEP_AT_END"      ) ) return DummyXAResource.SleepPosition.At_End;
		if ( param.equals( "SLEEP_AT_PREPARE"  ) ) return DummyXAResource.SleepPosition.At_Prepare;
		if ( param.equals( "SLEEP_AT_COMMIT"   ) ) return DummyXAResource.SleepPosition.At_Commit;
		if ( param.equals( "SLEEP_AT_ROLLBACK" ) ) return DummyXAResource.SleepPosition.At_Rollback;
		if ( param.equals( "SLEEP_AT_FORGET"   ) ) return DummyXAResource.SleepPosition.At_Forget;
		return DummyXAResource.SleepPosition.None;
	}

	// Convert SleepPosition to String.
	private String toSleepPositionString( DummyXAResource.SleepPosition param ) {
		if ( param == DummyXAResource.SleepPosition.None        ) return "NO_SLEEP";
		if ( param == DummyXAResource.SleepPosition.At_Start    ) return "SLEEP_AT_START";
		if ( param == DummyXAResource.SleepPosition.At_End      ) return "SLEEP_AT_END";
		if ( param == DummyXAResource.SleepPosition.At_Prepare  ) return "SLEEP_AT_PREPARE";
		if ( param == DummyXAResource.SleepPosition.At_Commit   ) return "SLEEP_AT_COMMIT";
		if ( param == DummyXAResource.SleepPosition.At_Rollback ) return "SLEEP_AT_ROLLBACK";
		if ( param == DummyXAResource.SleepPosition.At_Forget   ) return "SLEEP_AT_FORGET";
		return "Unkown";
	}
	
	// Convert String to int.
	private int toIntValue( String param ) {
		if ( param == null ) return 0;
		try {
			return Integer.parseInt( param );
		} catch ( NumberFormatException e ) {
			return 0;
		} 
	}
	
	// Lookup
	private Object doLookup( String name ) throws NamingException {
		InitialContext context = new InitialContext();
		return context.lookup( name );
	}
	
	// Lookup UserTransaction
	private UserTransaction lookupUserTransaction() throws NamingException {
		return (UserTransaction) doLookup( "java:comp/UserTransaction" );
	}

	// Lookup DataSource #1
	private DataSource lookupDataSource1() throws NamingException {
		return (DataSource) doLookup( "java:comp/env/jdbc/DS1" );
	}

	// Lookup DataSource #2
	private DataSource lookupDataSource2() throws NamingException {
		return (DataSource) doLookup( "java:comp/env/jdbc/DS2" );
	}
	
	// Lookup JMS Connection Factory
	private ConnectionFactory lookupConnectionFactory() throws NamingException {
		return (ConnectionFactory) doLookup( "java:comp/env/jms/JMSCF" );
	}
	
	// Lookup JMS Queue
	private Queue lookupQueue() throws NamingException {
		return (Queue) doLookup( "java:comp/env/jms/JMSQ" );
	}
%>
