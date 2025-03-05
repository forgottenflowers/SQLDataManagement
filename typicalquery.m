if object_id('tempdb..#get_data') is not null
begin
	drop table #get_data
end


select  alias2.colB as C1,
		alias2.colC as C2,
		cast(alias1_2.colG / 1000 as int) as C3,
		alias5.C4,
		cast(alias1_1.colG / 1000 as int) as C5,
		alias1_1.colH as C6, 
		LEFT (alias2.colD, 1) as C7,
		LEFT (alias3.colI, 1) as C8,
		LEFT (alias1_1.colJ, 1) as C9,
		alias2.colE as C10,
		alias3.colK_begin as C11,
		alias3.colK_begin as C12,
		IIF(alias2.colD = 'X', NULL, alias2.colF) as C13,   -- for these you can use CASE statement instead of IIF
		IIF(alias3.colI = 'X', NULL, alias3.colK_end) as C14,
		IIF(alias1_1.colJ = 'X', NULL, alias1_1.colJ_date) as C15,
		LEFT (alias4.colL_fq, 1) as C16,
		alias4.colL_begin as C17,
		alias4.colL_end as C18,
		alias4.colL_date as C19,
		alias7_1.colN as C20,
		alias8_2.colN as C21
	into #get_data
	from Table1 alias1_1
	inner join Table2 alias2
		on alias2.colA = alias1_1.colA
		and alias2.colD in ('X', 'Y')   -- can instead use condition as a WHERE clause
	inner join Table3 alias3
		on alias3.colK = alias1_1.colK
	inner join Table1 alias1_2
		on alias1_2.colO = alias3.colO
	inner join Table4 alias4
		on alias4.colL = alias1_1.colL
	left join Table5 alias5
		on alias5.colK = alias1_1.colK
		AND getdate() between alias5.colP_begin and alias5.colP_end
	left join 
			Table6 alias6_1
			inner join Table7 alias7_1
				on alias7_1.colQ = alias6_1.colQ
				and alias7_1.colR = 'R' 
				and alias6_1.colT_flag = 0
			inner join Table8 alias8_1
				on alias7_1.colM = IIF(alias7_1.colM_2 = 0, alias7_1.colM_1, alias7_1.colM_2)
		on alias6_1.colS = alias1_1.colS
		and IIF(alias1_1.colJ = 'Y', alias1_1.colJ_date, getdate()) between alias6_1.colT_begin and alias6_1.colT_end
	left join
			Table6 alias6_2
			inner join Table7 alias7_2 
				on alias7_2.colQ = alias6_2.colQ
				and alias7_2.colR = 'R*' 
				and alias6_2.colT_flag = 0
			inner join Table8 alias8_2
				on alias8_2.colM = IIF(alias7_2.colM_2 = 0, alias7_2.colM_1, alias7_2.colM_2)
		on alias6_2.colS = alias1_1.colS
		and IIF(alias1_1.colJ = 'Y', alias1_1.colJ_date, getdate()) between alias6_2.colT_begin and alias6_2.colT_end
	where alias1_1.colG % 1000 = 0
	order by c1, colG


select count (*) 
	from #get_data 

select * 
	from #get_data 
	order by c1, colG

	/*Some noteworthy things:
	(1) Always do inner joins before left joins, unless there is a good reason not to.
	(2) Table7 is a child tables of Table2 - so it's enough to match one column. The child tables are the primary keys, and parents are 
	probably the foreign keys.

	Something to do next: The Table 6,7,8 joins can probably be simplified further, since we are joining the same tables twice. 

	*/
