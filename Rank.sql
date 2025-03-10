select *
	into #aResult
	from (
		select  alias2.col1,
					alias2.BeginDate AS [Begin Date],
					IIF(alias2.col3 = 'X' 
						and Lead(alias2.col1, 1) OVER(ORDER BY alias2.col1, alias2.col4 = alias2.col1,
						Lead(alias2.EndDate, 1) OVER(ORDER BY alias2.col1, alias2.col4),
						convert(varchar, '12/31/49',  1) ) 
						AS [End Date]
			from (
				select  alias.*,
							convert(varchar, IIF(alias.col3 = 'X', alias.col2, NULL), 1) AS BeginDate,
							convert(varchar, IIF(alias.col3 = 'Y', alias.col2, NULL), 1) AS EndDate,
							IIF(Lag(alias.col3, 1) OVER(PARTITION BY alias.col1 ORDER BY alias.col4) = alias.col3,
								0, 
								1) 
								AS flag
					from TableName alias
					where alias.Id = (
							select top 1 Id 
								from TableName 
								where col1 = alias.col1
									and col2 = alias.col2
									and col3 in ('X','Y') 
								order by col4 desc)
			) alias2
			where alias2.flag = 1
	) alias3
	where alias3.[Begin Date] IS NOT NULL
	order by alias3.col1, 
		alias3.[Begin Date]
