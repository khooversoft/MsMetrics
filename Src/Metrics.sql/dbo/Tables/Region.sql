CREATE TABLE [dbo].[Region] (
    [RegionId] INT           IDENTITY (1, 1) NOT NULL,
    [Region]   NVARCHAR (50) NOT NULL,
    [TierId]   INT           NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([RegionId] ASC),
    CONSTRAINT [FK_Region_Tiers] FOREIGN KEY ([TierId]) REFERENCES [dbo].[Tiers] ([TierId])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Region]
    ON [dbo].[Region]([Region] ASC);

