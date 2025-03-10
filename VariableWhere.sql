SELECT * FROM TableName
	WHERE col1 = 'xxx1'
		AND col2 = 'xxx2'
		--AND (Env = @EnvName OR (Env <> @EnvName AND Env = '') )
		AND (DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) BETWEEN StartDate AND StopDate)

-- Get Current Environment
DECLARE @EnvName VARCHAR(16) = ( SELECT TOP 1 EnvName FROM vWhoAmI )
--DECLARE @EnvName VARCHAR(16) = 'bla'

SELECT * FROM TableName
	WHERE col1 = 'xxx1'
		AND col2 = 'xxx2'
		AND Env in (@EnvName,'')
		AND (DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) BETWEEN StartDate AND StopDate)
	order by env desc

SELECT top 1 * FROM TableName
	WHERE col1 = 'xxx1'
		AND col2 = 'xxx2'
		AND Env in (@EnvName,'')
		AND (DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0) BETWEEN StartDate AND StopDate)
	order by env desc
