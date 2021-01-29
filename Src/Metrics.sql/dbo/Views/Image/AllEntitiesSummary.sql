CREATE VIEW AllEntitiesSummary
AS
	select	'Entities' = 'All entities'
			,'Region by number' = (SELECT count(*) FROM AttributeHistory)
			,'Region by percentage' = 100

	UNION ALL

	SELECT	x.Description
			,'Region by number' = x.Count
			,'Region by percentage' = cast(x.Count as float) / (SELECT count(*) FROM AttributeHistory) * 100
	FROM	ImageCountSummaryAllUp x