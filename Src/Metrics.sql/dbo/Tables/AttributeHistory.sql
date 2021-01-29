CREATE TABLE [dbo].[AttributeHistory] (
    [Id]                INT      IDENTITY (1, 1) NOT NULL,
    [Date]              DATETIME NOT NULL,
    [SumImageCount]     INT      NULL,
    [ImageLevel1Count]  INT      NULL,
    [ImageLevel3Count]  INT      NULL,
    [ImageLevel5Count]  INT      NULL,
    [ImageLevel10Count] INT      NULL,
    [RegionId]          INT      NULL,
    [LanguageId]        INT      NULL,
    [ProviderId]        INT      NULL,
    [SegmentId]         INT      NULL,
    CONSTRAINT [PK_AttributeHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AttributeHistory_Segment] FOREIGN KEY ([SegmentId]) REFERENCES [dbo].[Segment] ([SegmentId]),
    CONSTRAINT [FK_ImageCountHistory_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId]),
    CONSTRAINT [FK_ImageCountHistory_Provider] FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_ImageCountHistory_Region] FOREIGN KEY ([RegionId]) REFERENCES [dbo].[Region] ([RegionId])
);










GO
CREATE NONCLUSTERED INDEX [IX_AttributeHistory]
    ON [dbo].[AttributeHistory]([Date] ASC);

