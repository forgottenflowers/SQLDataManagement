Select	Identify AS [C1],
		sum(case when alias2.date between '01/01/10' and '01/31/10' then alias2.col2 else 0 end) AS [10-Jan],
		sum(case when alias2.date between '02/01/10' and '02/28/10' then alias2.col2 else 0 end) AS [10-Feb],
		sum(case when alias2.date between '03/01/10' and '03/31/10' then alias2.col2 else 0 end) AS [10-Mar],
		sum(case when alias2.date between '04/01/10' and '04/30/10' then alias2.col2 else 0 end) AS [10-Apr],
		sum(case when alias2.date between '05/01/10' and '05/31/10' then alias2.col2 else 0 end) AS [10-May],
		sum(case when alias2.date between '06/01/10' and '06/30/10' then alias2.col2 else 0 end) AS [10-Jun]
	from [Table1] alias1
	inner join Table2 alias2
		on alias1.key1 = alias2.key1
	where alias1.Identify in ('123456', '123454')
		and alias2.setid = 'X'
	group by groupid
