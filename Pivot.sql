DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT ',' + QUOTENAME(DateColumn) 
                    from yourtable
                    group by DateColumn, id
                    order by id
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = N'SELECT ' + @cols + N' from 
             (
                select value, DateColumn
                from yourtable
            ) x
            pivot 
            (
                max(value)
                for DateColumn in (' + @cols + N')
            ) p '

exec sp_executesql @query;
