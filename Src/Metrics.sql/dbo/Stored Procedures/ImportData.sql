CREATE PROCEDURE [dbo].[ImportData]
AS
BEGIN
    SET NOCOUNT ON;

                    
    -- Add attribute name where not known
    INSERT INTO [dbo].[AttributeType] ([AttributeType])
    SELECT  DISTINCT
            x.[AttributeType]
    FROM    [dbo].[AttributeImport] x
    WHERE   x.[AttributeType] is NOT NULL
    AND     NOT EXISTS (
                        SELECT  *
                        FROM    [dbo].[AttributeType] r
                        WHERE   r.[AttributeType] = x.[AttributeType]
                    );
                    
    -- Add attribute name where not known
    INSERT INTO [dbo].[Attribute] ([Attribute])
    SELECT  DISTINCT
            x.[Attribute]
    FROM    [dbo].[AttributeImport] x
    WHERE   x.[Attribute] is NOT NULL
    AND     NOT EXISTS (
                        SELECT  *
                        FROM    [dbo].[Attribute] r
                        WHERE   r.[Attribute] = x.[Attribute]
                    );

                    
    -- Add region where not known
    INSERT INTO [dbo].[Region] ([Region])
    SELECT  DISTINCT
            x.[Region]
    FROM    [dbo].[AttributeImport] x
    WHERE   x.[Region] is NOT NULL
    AND     NOT EXISTS (
                        SELECT  *
                        FROM    [dbo].[Region] r
                        WHERE   r.[Region] = x.[Region]
                    );

    -- Add provider where not known
    INSERT INTO [dbo].[Segment] ([Segment])
    SELECT  DISTINCT
            x.[Segment]
    FROM    [dbo].[AttributeImport] x
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
        ,[AttributeTypeId]
        ,[AttributeId]
        ,[Value]
        ,[TotalCount]
        ,[TotalImpressions]
        ,[RegionId]
        ,[SegmentId]
    )

    SELECT  x.[Date]
            ,t.[AttributeTypeId]
            ,a.[AttributeId]
            ,x.[Value]
            ,x.[TotalCount]
            ,x.[TotalImpressions]
            ,r.[RegionId]
            ,s.[SegmentId]
    FROM    [dbo].[AttributeImport] x
            left join [dbo].[AttributeType] t on x.[AttributeType] = t.[AttributeType]
            left join [dbo].[Attribute] a on x.[Attribute] = a.[Attribute]
            left join [dbo].[Region] r on x.[Region] = r.[Region]
            left join [dbo].[Segment] s on x.[Segment] = s.[Segment];

    DELETE [dbo].[AttributeImport];

    COMMIT TRAN;
END