CREATE VIEW ImageCountSummaryByImageLevel
AS
	SELECT	Id, Date, Region, Language, Provider, CountDominant, CountImage_3, CountImage_5, CountImage_10, ImageLevel
	FROM	(
				SELECT	Id, Date, Region, Language, Provider
						,CountDominant, CountImage_3, CountImage_5, CountImage_10
						,CountDominant_ImageLevel, CountImage_3_ImageLevel, CountImage_5_ImageLevel, CountImage_10_ImageLevel
				FROM	ImageCountSummaryByImageCount
			) as x1
		UNPIVOT
		(
			ImageLevel FOR ImageLevels IN (CountDominant_ImageLevel, CountImage_3_ImageLevel, CountImage_5_ImageLevel, CountImage_10_ImageLevel)
		) as unpvt1