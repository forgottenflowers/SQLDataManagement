****************************************
set procedure to envx
****************************************

*
* Connect to SQL
*
sql_connect()

TEXT TO lcSQLCmd TEXTMERGE NOSHOW
	select top 10 *
		from TableName
ENDTEXT

*
* Fetch results into local_data
*
sql_execute('local_data')

*
* Disconnect
*
sql_disconnect()

SELECT local_data
BROWSE LAST NOWAIT
