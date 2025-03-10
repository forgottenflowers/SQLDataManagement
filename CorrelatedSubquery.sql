--
-- Correlated sub-query -- choose longest name per group
--
declare @Id int = 123

select	alias1.GroupName,
		alias2.Id,
		alias2.col1,
		alias2.Name
	from GroupsTable alias1
	inner join NamesTable alias2
		on	alias2.Id = (
			select	top 1 Id
				from NamesTable
				where	GroupId = alias1.GroupId
				order by len(Name) desc,
					Name,	-- break ties meaningfully
					Id		-- always break ties
		)

	
