﻿CREATE VIEW ImageCountSummaryByRegion
AS
SELECT	x3.Region
		,x3.Description
		,x3.Count
FROM	(
			SELECT	x.Region
					,x.ImageLevel
					,il.Description
					,'Count' = count(*)
			FROM	ImageCountSummaryByImageLevel x
					inner join ImageLevelDescription il on x.ImageLevel = il.ImageLevel
			group by x.Region, x.ImageLevel, il.Description
		) x3