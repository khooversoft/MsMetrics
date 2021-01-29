CREATE VIEW [dbo].[Series_2000]
as
with series (id) as (
	select 1 as id union all
	select id + 1 as id from series where id < 2000
	)
select id from series
