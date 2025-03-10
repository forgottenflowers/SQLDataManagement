if object_id('tempdb..#alias_data') is not null
begin
	drop table #alias_data
end

select top 10 *
	into #alias_data
	from Table1

select *
	from #alias_data

select top 10 *
	from Table2
