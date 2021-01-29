CREATE VIEW ImageCountSummaryByImageCount
AS
	SELECT	ROW_Number() OVER ( order by x1.Date, x1.Region, x1.Language, x1.Provider ) as 'Id'
			,x1.Date
			,x1.Region
			,x1.Language
			,x1.Provider
			,x1.SumImageCount
			,x1.CountDominant
			,'CountDominant_ImageLevel' = case when x1.CountDominant > 0 then 1 else 0 end
			,x1.CountImage_3
			,'CountImage_3_ImageLevel' = case when x1.CountImage_3 > 0 then 3 else 0 end
			,x1.CountImage_5
			,'CountImage_5_ImageLevel' = case when x1.CountImage_5 > 0 then 5 else 0 end
			,x1.CountImage_10
			,'CountImage_10_ImageLevel' = case when x1.CountImage_10 > 0 then 10 else 0 end
	FROM	(
				select	x.Date
						,x.Region
						,x.Language
						,x.Provider
						,'SumImageCount' = sum(x.ImageCount)
						,'CountDominant' = sum(x.Dominant)
						,'CountImage_3' = sum(x.Image_3)
						,'CountImage_5' = sum(x.Image_5)
						,'CountImage_10' = sum(x.Image_10)
				FROM	ImageCountSummary x
				group by x.Date, x.Region, x.Language, x.Provider
			) x1