CREATE VIEW ImageCountSummaryByLanguage
AS
SELECT	x3.Language
		,x3.Description
		,x3.Count
FROM	(
			SELECT	x.Language
					,x.ImageLevel
					,il.Description
					,'Count' = count(*)
			FROM	ImageCountSummaryByImageLevel x
					inner join ImageLevelDescription il on x.ImageLevel = il.ImageLevel
			group by x.Language, x.ImageLevel, il.Description
		) x3