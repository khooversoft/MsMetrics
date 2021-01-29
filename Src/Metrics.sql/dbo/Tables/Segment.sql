CREATE TABLE [dbo].[Segment] (
    [SegmentId] INT           IDENTITY (1, 1) NOT NULL,
    [Segment]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED ([SegmentId] ASC)
);

