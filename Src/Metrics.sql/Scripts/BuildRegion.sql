declare @region table (RegionName nvarchar(50))

insert into @region (RegionName) VALUES
('mk'), ('bo'), ('nc'), ('tz'), ('cl'), ('as'), ('si'), ('rw'),
('mq'), ('za'), ('tn'), ('kh'), ('br'), ('uy'), ('do'), ('ky'),
('co'), ('qa'), ('fj'), ('sd'), ('sn'), ('lb'), ('gy'), ('ml'),
('vg'), ('ps'), ('bq'), ('ly'), ('tt'), ('ni'), ('kz'), ('ug'),
('ma'), ('vn'), ('aw'), ('cy'), ('bh'), ('sg'), ('mu'), ('ai'),
('fm'), ('US'), ('kn'), ('th'), ('ua'), ('by'), ('be'), ('ws'),
('vi'), ('sb'), ('lv'), ('mv'), ('fr'), ('ec'), ('no'), ('sl'),
('cr'), ('ge'), ('nu'), ('cw'), ('bf'), ('mc'), ('au'), ('ls'),
('in'), ('bz'), ('gh'), ('af'), ('dz'), ('kw'), ('gr'), ('md'),
('hn'), ('mz'), ('ar'), ('pk'), ('sx'), ('iq'), ('bw'), ('tm'),
('bm'), ('ng'), ('pa'), ('ch'), ('kr'), ('rs'), ('zm'), ('fi'),
('ga'), ('ru'), ('se'), ('mm'), ('lk'), ('mx'), ('tj'), ('bn'),
('nf'), ('pf'), ('cm'), ('sj'), ('at'), ('sv'), ('nz'), ('gw'),
('na'), ('pw'), ('mn'), ('ve'), ('tg'), ('al'), ('id'), ('cu'),
('ph'), ('bd'), ('pr'), ('ee'), ('zw'), ('mw'), ('lu'), ('sc'),
('nl'), ('ck'), ('am'), ('yt'), ('de'), ('td'), ('li'), ('dk'),
('gp'), ('gm'), ('ba'), ('gd'), ('mf'), ('ca'), ('cz'), ('mr'),
('is'), ('pm'), ('pt'), ('gi'), ('bs'), ('et'), ('bb'), ('sm'),
('ao'), ('lc'), ('ro'), ('me'), ('es'), ('il'), ('sy'), ('mo'),
('ir'), ('gf'), ('jo'), ('gl'), ('gu'), ('om'), ('hr'), ('ye'),
('km'), ('st'), ('lr'), ('to'), ('vc'), ('ie'), ('cd'), ('kg'),
('dj'), ('tr'), ('bi'), ('ke'), ('sk'), ('re'), ('bj'), ('sa'),
('my'), ('tl'), ('ci'), ('ag'), ('bl'), ('hu'), ('dm'), ('gn'),
('jm'), ('la'), ('sr'), ('GB'), ('pg'), ('pe'), ('py'), ('mt'),
('ae'), ('gg'), ('tc'), ('uz'), ('gq'), ('mg'), ('bt'), ('eg'),
('pl'), ('it'), ('fo'), ('je'), ('xk'), ('ad'), ('cg'), ('gt'),
('np'), ('cv'), ('vu'), ('ht'), ('bg'), ('az'), ('sz'), ('lt'),
('im')

insert into Region (Region, TierId)

SELECT	x.RegionName
		,q.TierId
FROM	@region x
		CROSS APPLY (
			SELECT	TOP 1 *
			FROM	Tiers t
			WHERE	x.RegionName = x.RegionName
			order by newid()
		) q

UPDATE	Region
SET		TierId = (SELECT TierId FROM Tiers WHERE Tier = 'Tier1')
FROM	Region x
WHERE	x.Region in ('us', 'ca', 'mx')

--SELECT	*
--FROM	Region x
--WHERE	x.Region in ('us', 'ca', 'mx')


--select * from Tiers