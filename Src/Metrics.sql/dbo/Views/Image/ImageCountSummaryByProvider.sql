CREATE VIEW ImageCountSummaryByProvider
AS
SELECT	x3.Provider
		,x3.Description
		,x3.Count
FROM	(
			SELECT	x.Provider
					,x.ImageLevel
					,il.Description
					,'Count' = count(*)
			FROM	ImageCountSummaryByImageLevel x
					inner join ImageLevelDescription il on x.ImageLevel = il.ImageLevel
			group by x.Provider, x.ImageLevel, il.Description
		) x3