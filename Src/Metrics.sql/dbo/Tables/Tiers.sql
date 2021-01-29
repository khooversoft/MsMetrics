CREATE TABLE [dbo].[Tiers] (
    [TierId] INT           IDENTITY (1, 1) NOT NULL,
    [Tier]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Tiers] PRIMARY KEY CLUSTERED ([TierId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tiers]
    ON [dbo].[Tiers]([Tier] ASC);

