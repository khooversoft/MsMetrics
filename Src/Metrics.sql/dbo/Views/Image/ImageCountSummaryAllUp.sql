CREATE VIEW ImageCountSummaryAllUp
AS
SELECT	il.Description
		,'Count' = (
			SELECT	count(*)
			FROM	ImageCountSummaryByImageLevel xx
			WHERE	il.ImageLevel = xx.ImageLevel
			)
		,'Total' = (SELECT count(*) FROM AttributeHistory)
FROM	ImageLevelDescription il