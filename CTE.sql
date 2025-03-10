--
-- Common table expression (CTE)
--
; with data1 as (
	select	top 10
			alias1.Id,
			alias1.col1,
			alias1.col2
		from Table1 alias1
		where alias1.col3 = 'X'
),
data2 as (
	select	alias2.*,
			alias3.col4,
			alias3.col5
		from data1 alias2
		inner join Table2 alias3
			on alias3.Id = alias2.Id
)
select	acq2.col4,
		count(*)
	from data2 acq1
	inner join data2 acq2
		on acq2.Id = acq1.Id
		and acq2.col4 > acq1.col4
	group by acq2.col4
