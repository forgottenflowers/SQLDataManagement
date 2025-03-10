Select	XNumber AS [Number],
		sum(case when alias2.Date between '01/01/10' and '01/31/10' then Amount else 0 end) AS [10-Jan],
		sum(case when alias2.Date between '02/01/10' and '02/28/10' then Amount else 0 end) AS [10-Feb],
		sum(case when alias2.Date between '03/01/10' and '03/31/10' then Amount else 0 end) AS [10-Mar],
		sum(case when alias2.Date between '04/01/10' and '04/30/10' then Amount else 0 end) AS [10-Apr],
		sum(case when alias2.Date between '05/01/10' and '05/31/10' then Amount else 0 end) AS [10-May],
		sum(case when alias2.Date between '06/01/10' and '06/30/10' then Amount else 0 end) AS [10-Jun]
	from [Table1] alias1
	inner join Table2 alias2
		on alias1.Id = alias2.Id
	where alias1.XNumber in ('12-345678-01-05', '98-765432-01-05')
		and alias2.Setname = 'Exxxx'
	group by XNumber
