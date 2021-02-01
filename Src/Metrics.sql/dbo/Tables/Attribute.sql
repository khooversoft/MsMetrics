CREATE TABLE [dbo].[Attribute] (
    [AttributeId] INT           IDENTITY (1, 1) NOT NULL,
    [Attribute]   NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED ([AttributeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Attribute]
    ON [dbo].[Attribute]([Attribute] ASC);

