--select * from vis_columns where column_name like '%xxxx%'

select  spid,
        blocked,
        cpu,
        physical_io,
        memusage,
        status,
        login_time,
        last_batch,
        open_tran,
        hostname,
        program_name,
        nt_username
from master..sysprocesses
where nt_username = 'my_name' and open_tran = 1
order by case when nt_username = 'priorityuser' then 1 else 2 end,
        open_tran desc,
        cpu desc

go
--kill 116 --go -- exec tran_name go
--'User does not have permission to use the KILL statement.'
        
-- INSERT INTO dbo.TableName output inserted. * SELECT * FROM 
-- select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'TableName'
