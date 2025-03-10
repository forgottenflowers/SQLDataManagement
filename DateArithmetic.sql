---------------------------------------------------
------------    SQL Date Arithmetic    ------------
---------------------------------------------------

declare @date datetime = '2/24/19'

-- Date Parts
select	@date as [Now],
		datepart(year, @date) as [Year],
		datepart(quarter, @date) as [Quarter],
		datepart(month, @date) as [Month],
		datepart(week, @date) as [Week],
		datepart(day, @date) as [Month],
		datepart(hour, @date) as [Hour],
		datepart(DAYOFYEAR, @date) as [DayOfYear],
		datepart(weekday, @date) as [Weekday],
		datename(weekday, @date) as [Weekday],
		datename(month, @date) as [Month]

-- Basic Arithmetic
select	@date as [Now],
		dateadd(day, 1, @date) as [This Time Tomorrow],
		@date + 1 as [Also This Time Tomorrow],
		dateadd(day, -1, @date) as [This Time Yesterday],
		cast(0 as datetime) as [Beginning of Time],
		dateadd(day, datediff(day, 0, @date), 0) as Today,
		dateadd(month, datediff(month, 0, @date), 0) as BoM,
		dateadd(quarter, datediff(quarter, 0, @date), 0) as BoQ,
		dateadd(year, datediff(year, 0, @date), 0) as BoY,
		dateadd(hour, datediff(hour, 0, @date), 0) as [This Hour],
		dateadd(minute, datediff(minute, 0, @date), 0) as [This Minute],
		dateadd(month, datediff(month, 0, @date), 0) as [Beginning of Month],
		dateadd(day, -datepart(day, dateadd(month, 1, @date)), dateadd(month, 1, @date)) as [End of Month]

-- Date Diff
declare
	@from datetime = '1/31/20',
	@to datetime = '3/10/20'

select	datediff(day, @from, @from) as [Zero],
		datediff(day, @from, @to) as [Days],
		datediff(month, @from, @to) as [Months],
		dateadd(month, 1, @from) as [Next Month],
		dateadd(month, 1, dateadd(month, 1, @from)) as [Next Month2],
		dateadd(month, 2, @from) as [Two Months]
