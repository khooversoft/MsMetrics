CREATE VIEW ImageCountSummary
AS
SELECT	x.Id
		,x.Date
		,r.Region
		,l.Language
		,p.Provider
		,x.SumImageCount as 'ImageCount'
		,x.ImageLevel1Count as 'Dominant'
		,x.ImageLevel3Count as 'Image_3'
		,x.ImageLevel5Count as 'Image_5'
		,x.ImageLevel10Count as 'Image_10'
FROM	[dbo].[AttributeHistory] x
		left join dbo.Region r on r.RegionId = x.RegionId
		left join dbo.Language l on l.LanguageId = x.LanguageId
		left join dbo.Provider p on p.ProviderId = x.ProviderId

