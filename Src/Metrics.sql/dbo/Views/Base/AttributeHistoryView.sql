CREATE view AttributeHistoryView
as
	SELECT	x.Id
			,x.[Date]
			,t.[AttributeType]
			,a.[Attribute]
			,x.[Value]
			,x.[TotalCount]
			,x.[TotalImpressions]
			,r.[Region]
			,s.[Segment]
	FROM	[dbo].[AttributeHistory] x
			left join [dbo].[AttributeType] t on x.[AttributeTypeId] = t.AttributeTypeId
			left join [dbo].[Attribute] a on x.[AttributeId] = a.[AttributeId]
			left join [dbo].[Region] r on x.[RegionId] = r.[RegionId]
			left join [dbo].[Segment] s on x.[SegmentId] = x.[SegmentId]
;
