<%@page pageEncoding="UTF-8" %>

<%@include file="CommonFunction.jsp"%>

<%
DummyXAResource.SleepPosition sleepPosition1 = toSleepPositionValue( request.getParameter( "sleep_position_1" ) );
DummyXAResource.SleepPosition sleepPosition2 = toSleepPositionValue( request.getParameter( "sleep_position_2" ) );
DummyXAResource.SleepPosition sleepPosition3 = toSleepPositionValue( request.getParameter( "sleep_position_3" ) );
int sleepDuration1  = toIntValue( request.getParameter( "sleep_duration_1"  ) );
int sleepDuration2  = toIntValue( request.getParameter( "sleep_duration_2"  ) );
int sleepDuration3  = toIntValue( request.getParameter( "sleep_duration_3"  ) );
%>

<table>

	<tr>
		<td>Dummy RM 1</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td><%= toSleepPositionString( sleepPosition1 ) %></td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td><%= sleepDuration1 %>(sec)</td>
	</tr>

	<tr>
		<td>Dummy RM 2</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td><%= toSleepPositionString( sleepPosition2 ) %></td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td><%= sleepDuration2 %>(sec)</td>
	</tr>
	
	<tr>
		<td>Dummy RM 3</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td><%= toSleepPositionString( sleepPosition3 ) %></td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td><%= sleepDuration3 %>(sec)</td>
	</tr>

</table>
