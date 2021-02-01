CREATE TABLE [dbo].[AttributeHistory] (
    [Id]               INT      IDENTITY (1, 1) NOT NULL,
    [Date]             DATETIME NOT NULL,
    [AttributeTypeId]  INT      NOT NULL,
    [AttributeId]      INT      NOT NULL,
    [Value]            INT      NOT NULL,
    [TotalCount]       INT      NOT NULL,
    [TotalImpressions] INT      NOT NULL,
    [RegionId]         INT      NULL,
    [LanguageId]       INT      NULL,
    [ProviderId]       INT      NULL,
    [SegmentId]        INT      NULL,
    CONSTRAINT [PK_AttributeHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AttributeHistory_Attribute] FOREIGN KEY ([AttributeId]) REFERENCES [dbo].[Attribute] ([AttributeId]),
    CONSTRAINT [FK_AttributeHistory_AttributeType] FOREIGN KEY ([AttributeTypeId]) REFERENCES [dbo].[AttributeType] ([AttributeTypeId]),
    CONSTRAINT [FK_AttributeHistory_Segment] FOREIGN KEY ([SegmentId]) REFERENCES [dbo].[Segment] ([SegmentId]),
    CONSTRAINT [FK_ImageCountHistory_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId]),
    CONSTRAINT [FK_ImageCountHistory_Provider] FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[Provider] ([ProviderId]),
    CONSTRAINT [FK_ImageCountHistory_Region] FOREIGN KEY ([RegionId]) REFERENCES [dbo].[Region] ([RegionId])
);














GO
CREATE NONCLUSTERED INDEX [IX_AttributeHistory]
    ON [dbo].[AttributeHistory]([Date] ASC);

