CREATE TABLE [dbo].[ImageLevelDescription] (
    [ImageLevel]  INT           NOT NULL,
    [Attribute]   NVARCHAR (50) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ImageLevelDescription] PRIMARY KEY CLUSTERED ([ImageLevel] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ImageLevelDescription]
    ON [dbo].[ImageLevelDescription]([Attribute] ASC);

