﻿CREATE VIEW ImageCountSummaryByDate
AS
SELECT	x3.Date
		,x3.Description
		,x3.Count
FROM	(
			SELECT	x.Date
					,x.ImageLevel
					,il.Description
					,'Count' = count(*)
			FROM	ImageCountSummaryByImageLevel x
					inner join ImageLevelDescription il on x.ImageLevel = il.ImageLevel
			group by x.Date, x.ImageLevel, il.Description
		) x3