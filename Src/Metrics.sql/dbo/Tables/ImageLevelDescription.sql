CREATE TABLE [dbo].[ImageLevelDescription] (
    [ImageLevel]  INT           NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ImageLevelDescription] PRIMARY KEY CLUSTERED ([ImageLevel] ASC)
);

