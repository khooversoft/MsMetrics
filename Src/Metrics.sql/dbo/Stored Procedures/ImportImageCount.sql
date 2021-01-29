CREATE PROCEDURE [dbo].[ImportImageCount]
AS
BEGIN
    SET NOCOUNT ON;

    -- Add region where not known
    INSERT INTO [dbo].[Region] ([Region])
    SELECT  x.[Region]
    FROM    [dbo].[ImageCountImport] x
    WHERE   x.[Region] is NOT NULL
    AND     NOT EXISTS (
                        SELECT  *
                        FROM    [dbo].[Region] r
                        WHERE   r.[Region] = x.[Region]
                    );


    -- Add category where not known
    INSERT INTO [dbo].[Segment] ([Segment])
    SELECT  x.[Segment]
    FROM    [dbo].[ImageCountImport] x
    WHERE   x.[Segment] is NOT NULL
    AND     NOT EXISTS (
                        SELECT  *
                        FROM    [dbo].[Segment] r
                        WHERE   r.[Segment] = x.[Segment]
                    );
                    

    -- Append data to Attribute history
    BEGIN TRAN;

    INSERT INTO [dbo].[AttributeHistory]
    (
        [Date]
        ,[SumImageCount]
        ,[ImageLevel1Count]
        ,[ImageLevel3Count]
        ,[ImageLevel5Count]
        ,[ImageLevel10Count]
        ,[RegionId]
        ,[SegmentId]
    )

    SELECT  x.[Date]
            ,x.[SumImageCount]
            ,x.[ImageLevel1Count]
            ,x.[ImageLevel3Count]
            ,x.[ImageLevel5Count]
            ,x.[ImageLevel10Count]
            ,r.[RegionId]
            ,s.[SegmentId]
    FROM    [dbo].[ImageCountImport] x
            left join [dbo].[Region] r on x.[Region] = r.[Region]
            left join [dbo].[Segment] s on x.[Segment] = s.[Segment];

    COMMIT TRAN;

    TRUNCATE TABLE [dbo].[AttributeImport];

END