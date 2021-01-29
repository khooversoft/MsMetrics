--CREATE PROCEDURE [dbo].[ImportData]
--AS
--BEGIN
--    SET NOCOUNT ON;

--    -- Add attribute name where not known
--    --INSERT INTO [dbo].[Attribute] ([Attribute])
--    --SELECT  x.[Attribute]
--    --FROM    [dbo].[AttributeImport] x
--    --WHERE   x.[Attribute] is NOT NULL
--    --AND     NOT EXISTS (
--    --                    SELECT  *
--    --                    FROM    [dbo].[Attribute] r
--    --                    WHERE   r.[Attribute] = x.[Attribute]
--    --                );
                    
--    -- Add region where not known
--    INSERT INTO [dbo].[Region] ([Region])
--    SELECT  x.[Region]
--    FROM    [dbo].[AttributeImport] x
--    WHERE   x.[Region] is NOT NULL
--    AND     NOT EXISTS (
--                        SELECT  *
--                        FROM    [dbo].[Region] r
--                        WHERE   r.[Region] = x.[Region]
--                    );

--    -- Add language where not known
--    INSERT INTO [dbo].[Language] ([Language])
--    SELECT  x.[Language]
--    FROM    [dbo].[AttributeImport] x
--    WHERE   x.[Language] is NOT NULL
--    AND     NOT EXISTS (
--                        SELECT  *
--                        FROM    [dbo].[Language] r
--                        WHERE   r.[Language] = x.[Language]
--                    );


--    -- Add category where not known
--    --INSERT INTO [dbo].[Category] ([Category])
--    --SELECT  x.[Category]
--    --FROM    [dbo].[AttributeImport] x
--    --WHERE   x.[Category] is NOT NULL
--    --AND     NOT EXISTS (
--    --                    SELECT  *
--    --                    FROM    [dbo].[Category] r
--    --                    WHERE   r.[Category] = x.[Category]
--    --                );
                    
--    -- Add provider where not known
--    INSERT INTO [dbo].[Provider] ([Provider])
--    SELECT  x.[Provider]
--    FROM    [dbo].[AttributeImport] x
--    WHERE   x.[Provider] is NOT NULL
--    AND     NOT EXISTS (
--                        SELECT  *
--                        FROM    [dbo].[Provider] r
--                        WHERE   r.[Provider] = x.[Provider]
--                    );

--    -- Append data to Attribute history
--    BEGIN TRAN;

--    INSERT INTO [dbo].[AttributeHistory]
--    (
--        [Date]
--        ,[AttributeId]
--        ,[Value]
--        ,[RegionId]
--        ,[LanguageId]
--        ,[ProviderId]
--        ,[CategoryId]
--    )

--    SELECT  x.[Date]
--            ,a.[AttributeId]
--            ,x.[AggCountValue]
--            ,r.[RegionId]
--            ,l.[LanguageId]
--            ,p.[ProviderId]
--            ,c.[CategoryId]
--    FROM    [dbo].[AttributeImport] x
--            left join [dbo].[Attribute] a on x.[Attribute] = a.[Attribute]
--            left join [dbo].[Category] c on x.[Category] = c.[Category]
--            left join [dbo].[Region] r on x.[Region] = r.[Region]
--            left join [dbo].[Language] l on x.[Language] = l.[Language]
--            left join [dbo].[Provider] p on p.[Provider] = p.[Provider];

--    COMMIT TRAN;

--    TRUNCATE TABLE [dbo].[AttributeImport];

--END