--
-- Fibonacci's Sequence
--
; with Numbers as (
	--
	-- Base case
	--
	select	cast(1 as int) as Num,
			cast(0 as int) as n1,
			cast(1 as int) as n2
	union all
	select	Num + 1,
			n2,
			n1 + n2
		from Numbers
		where	n2 < 100	-- Stopping condition
)
select	Num,
		n2 as [Fibonacci]
	from Numbers
