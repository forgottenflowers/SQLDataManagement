-------------------------------------------
------------    Dynamic SQL    ------------
-------------------------------------------

/*
declare @sql varchar(1000) = '
select top 100 *
	from TableName
'

print @sql
exec(@sql)
*/

if object_id('tempdb..#temp_data') is not null drop table #temp_data

-- Parameters
declare @beginDate datetime = '1/1/10'
declare @endDate datetime = '6/30/10'

create table #temp_data (XNumber varchar(32))
insert into #temp_data values
('46-002152-01-05'),
('46-009320-01-05')

select * from #temp_data

-- Loops in SQL

declare @index int, @sql varchar(1000)
set @index = 3

set @sql = ''

while @index < 10
begin
	
	declare @indexChar varchar(32) = cast(@index as varchar(32))

	set @sql = @sql + ',
	' + @indexChar + ' as [Index ' + @indexChar + '] '

	set @index = @index + 1
end

set @sql = 'select XNumber' + @sql + ' from #temp_data'

print (@sql)
exec(@sql)

