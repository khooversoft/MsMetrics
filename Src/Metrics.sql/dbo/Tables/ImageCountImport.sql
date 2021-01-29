CREATE TABLE [dbo].[ImageCountImport] (
    [Date]              DATETIME      NOT NULL,
    [Region]            NVARCHAR (50) NOT NULL,
    [Segment]           NVARCHAR (50) NOT NULL,
    [SumImageCount]     INT           NOT NULL,
    [ImageLevel1Count]  INT           NOT NULL,
    [ImageLevel3Count]  INT           NOT NULL,
    [ImageLevel5Count]  INT           NOT NULL,
    [ImageLevel10Count] INT           NOT NULL
);

