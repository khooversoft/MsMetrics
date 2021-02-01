CREATE view ImageCountHistoryView
as
	SELECT	x.Id
			,x.[Date]
			,x.[AttributeType]
			,x.[Attribute]
			,x.[Value]
			,x.[TotalCount]
			,x.[TotalImpressions]
			,x.[Region]
			,x.[Segment]
			,l.[ImageLevel]
			,l.[Description]
	FROM 	[dbo].[AttributeHistoryView] x
			inner join [dbo].[ImageLevelDescription] l on x.[Attribute] = l.[Attribute]
;
