<%@page pageEncoding="UTF-8" %>

<table>

	<tr>
		<td>Dummy RM 1</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td>
			<SELECT size="1" name="sleep_position_1">
				<OPTION selected value="NO_SLEEP"         >NO_SLEEP</OPTION>
				<OPTION          value="SLEEP_AT_START"   >SLEEP_AT_START</OPTION>
				<OPTION          value="SLEEP_AT_END"     >SLEEP_AT_END</OPTION>
				<OPTION          value="SLEEP_AT_PREPARE" >SLEEP_AT_PREPARE</OPTION>
				<OPTION          value="SLEEP_AT_COMMIT"  >SLEEP_AT_COMMIT</OPTION>
				<OPTION          value="SLEEP_AT_ROLLBACK">SLEEP_AT_ROLLBACK</OPTION>
				<OPTION          value="SLEEP_AT_FORGET"  >SLEEP_AT_FORGET</OPTION>
			</SELECT>
		</td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td>
			<input type="text" size="5" value="20" name="sleep_duration_1"/>(sec)
		</td>
	</tr>

	<tr>
		<td>Dummy RM 2</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td>
			<SELECT size="1" name="sleep_position_2">
				<OPTION selected value="NO_SLEEP"        >NO_SLEEP</OPTION>
				<OPTION          value="SLEEP_AT_START"   >SLEEP_AT_START</OPTION>
				<OPTION          value="SLEEP_AT_END"     >SLEEP_AT_END</OPTION>
				<OPTION          value="SLEEP_AT_PREPARE" >SLEEP_AT_PREPARE</OPTION>
				<OPTION          value="SLEEP_AT_COMMIT"  >SLEEP_AT_COMMIT</OPTION>
				<OPTION          value="SLEEP_AT_ROLLBACK">SLEEP_AT_ROLLBACK</OPTION>
				<OPTION          value="SLEEP_AT_FORGET"  >SLEEP_AT_FORGET</OPTION>
			</SELECT>
		</td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td>
			<input type="text" size="5" value="20" name="sleep_duration_2"/>(sec)
		</td>
	</tr>
	
	<tr>
		<td>Dummy RM 3</td>
		<td width="10"></td>
		<td>sleep point:</td>
		<td>
			<SELECT size="1" name="sleep_position_3">
				<OPTION selected value="NO_SLEEP"        >NO_SLEEP</OPTION>
				<OPTION          value="SLEEP_AT_START"   >SLEEP_AT_START</OPTION>
				<OPTION          value="SLEEP_AT_END"     >SLEEP_AT_END</OPTION>
				<OPTION          value="SLEEP_AT_PREPARE" >SLEEP_AT_PREPARE</OPTION>
				<OPTION          value="SLEEP_AT_COMMIT"  >SLEEP_AT_COMMIT</OPTION>
				<OPTION          value="SLEEP_AT_ROLLBACK">SLEEP_AT_ROLLBACK</OPTION>
				<OPTION          value="SLEEP_AT_FORGET"  >SLEEP_AT_FORGET</OPTION>
			</SELECT>
		</td>
		<td width="10"></td>
		<td>sleep time:</td>
		<td>
			<input type="text" size="5" value="20" name="sleep_duration_3"/>(sec)
		</td>
	</tr>

	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="submit"/></td>
	</tr>
</table>
