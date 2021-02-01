CREATE VIEW AllEntitiesSummary
AS
	select	'Entities' = 'All entities'
			,'Count' = (
						SELECT max(TotalCount)
						FROM (
							select	x.[ImageLevel]
									,sum(x.[TotalCount]) as TotalCount
							from	[dbo].[ImageCountHistoryView] x
							group by
									x.[ImageLevel]
							) y
						)
			,'Percentage' = 100

	UNION ALL

	SELECT	x.Description
			,'Count' = x.Value
			,'Percentage' = x.PctOfTotal * 100
	FROM	ImageCountSummaryAllUp x
	;