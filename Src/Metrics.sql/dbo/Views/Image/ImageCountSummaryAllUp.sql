CREATE VIEW ImageCountSummaryAllUp
AS
select	i.[Description]
		,i.[Value]
		,'PctOfTotal' = (cast(i.[Value] as float) / i.[TotalCount] )
		,i.[TotalCount]
FROM	(
		select	x.[ImageLevel]
				,x.[Description]
				,sum(x.[Value]) as Value
				,sum(x.[TotalCount]) as TotalCount
		from	[dbo].[ImageCountHistoryView] x
		group by
				x.[ImageLevel],
				x.[Description]
) i
