CREATE PROCEDURE #experimen @userin nvarchar(30)
AS
select *
		from zSQLQuery 
		where ZQO_id=TRY_CAST(@userin AS int)
			OR zqo_name LIKE '%'+@userin+'%'
			OR zqo_command LIKE '%'+@userin+'%'


EXEC #experimen 'datetime'

DROP PROCEDURE #experimen
/*you don't need to drop this procedure as it's temporary... thank god!
It's valid only in this query and gets destroyed when the query is closed.
Run create, exec and drop one after the other in a different query.*/

DECLARE @user_input nvarchar(30)
SET @user_input = user_in
EXEC #experimen @user_input
