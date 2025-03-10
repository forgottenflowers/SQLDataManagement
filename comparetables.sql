select  a.*, 
			b.*
	from (
		select top 5 * 
			from TableName 
			order by id
	) a
	full outer join (
		select top 4 * 
			from TableName 
			order by id
	) b
		on a.id = b.id
	where a.id is null
		or b.id is null
