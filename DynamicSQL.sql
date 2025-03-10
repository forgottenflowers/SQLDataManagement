-- ... (snippet)

-- The folder from which zSQL queries will be loaded
DECLARE @LoadFolder VARCHAR(64) = 'pathname'
DECLARE @FileName NVARCHAR(255) = 'filename.sql'

-- Declare variables needed to load zSQL query
DECLARE @SQL_Command NVARCHAR(MAX)
DECLARE @SQL_Params NVARCHAR(500)

DECLARE @Command NVARCHAR(MAX)
DECLARE @Reference INT,
		@RefId INT

-- Declare Dynamic SQL
SET @SQL_Command = N''
SET @SQL_Command = @SQL_Command + 'SELECT @Command = BulkColumn' + CHAR(13) + CHAR(10)
SET @SQL_Command = @SQL_Command + 'FROM OPENROWSET(BULK N''' + @LoadFolder + @Filename + ''', SINGLE_CLOB) F' + CHAR(13) + CHAR(10)

-- Declare Params
SET @SQL_Params = N'@Command NVARCHAR(MAX) OUTPUT'

-- Execute Dynamic SQL to Load zSQL Command From File
EXEC sp_executesql @SQL_Command, @SQL_Params, @Command = @Command OUTPUT


-- ...
