
insert into ImageCountHistory (Date, ImageCount, RegionId, LanguageId, ProviderId)


select	'Date' = DATEADD(day, CAST(RAND(CHECKSUM(NEWID())) * 90 as int), DATEFROMPARTS(2020, 11, 1))
		,'ImageCount' = CAST(RAND(CHECKSUM(NEWID())) * 12 as int)
		,'RegionId' = r.RegionId
		,'LangageId' = l.LanguageId
		,'ProviderId' = p.ProviderId
FROM	Series_2000 as x
		CROSS APPLY (
			select top 1 *
			from	Region
			where	x.id = x.id
			order by newid()
			) r
		CROSS APPLY (
			select top 1 *
			from	Language
			where	x.id = x.id
			order by newid()
			) l
		CROSS APPLY (
			select top 1 *
			from	Provider
			where	x.id = x.id
			order by newid()
			) p
OPTION(MAXRECURSION 0)


--select ROW_NUMBER() OVER(ORDER BY Category) AS matchId
--from Categories order by newid()

-- OPTION(MAXRECURSION 0)

