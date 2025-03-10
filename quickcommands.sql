-- List of most frequently used commands

select  * from servername.dbo.vis_primarykeys  where column_name='colname'
  
select * from vis_tables where table_name like 'tablename%'
  
select * from vis_columns where column_name='name1' or column_name='name2'
select * from vis_columns where column_name like 'colname%'
  
select * from vis_foreignkeys where fk_columnname='colname'

select criteria, count(*)
from Tablename
group by criteria

select * from (
select id, count(col2) AS cnt
from TableName
group by id
) a
where a.cnt>2

select b.id, count(*)
from (
select * from (
select id, id2, count(*) AS cnt 
from TableName
where id != id2
group by id, id2
) a
where a.cnt>2
) b
group by b.id
having count(*)>1
