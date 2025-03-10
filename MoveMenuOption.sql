--
-- Moving an option from one menu to another
--

DECLARE @CommitFlag INT = 1
DECLARE @check VARCHAR(254) = 'object_for_menu_option_exists'

BEGIN TRANSACTION

-- Only run the script if this has not already been done
IF NOT EXISTS(SELECT 1 FROM dbo.MenuTable WHERE check = @check AND app = 'appname')
BEGIN
	
	DECLARE @Id_menu INT,
			@Id_submenu INT,
			@Id INT,
			@order INT

	-- Get the Id for the first menu
	SELECT @Id_menu = Id 
		FROM dbo.MenuTable
		WHERE app = 'appname'
			AND Id_Parent IS NULL
			AND Name LIKE '%menuname'

	-- Get the Id for the submenu
	SELECT @Id_submenu = Id
		FROM dbo.MenuTable
		WHERE Id_Parent = @Id_menu
			AND Name = 'submenuname'

	-- Get the order for the last command in the submenu
	SET @order = (Select max(order) from MenuTable where Id_Parent = @Id_submenu)

	exec Get_next_available_primary_key 'MenuTable'
	-- Get the next available primary key

	EXEC Get_next_in_sequence 'MenuTable', 1, @Id OUTPUT
	
	-- Insert
	INSERT INTO MenuTable 
	(
		Id,
		Id_Parent,
		app,
		order,
		Name,
		col1,
		check,
		col2,
		col3
	)
	VALUES
	(
		@Id,
		@Id_submenu,
		'appname',
		@order+1,
		'OptionName',
		'xxx1',
		@check,
		'xxx2',
		'xxx3'
	)
	select *
		from MenuTable
		where app = 'appname'
		and Id_Parent = @Id_submenu

END -- End of the IF block that contains the entire script.
		
IF @CommitFlag = 0
	ROLLBACK TRANSACTION
ELSE 
	COMMIT TRANSACTION
