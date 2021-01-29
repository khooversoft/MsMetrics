CREATE TABLE [dbo].[Provider] (
    [ProviderId] INT           IDENTITY (1, 1) NOT NULL,
    [Provider]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED ([ProviderId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Provider]
    ON [dbo].[Provider]([Provider] ASC);

