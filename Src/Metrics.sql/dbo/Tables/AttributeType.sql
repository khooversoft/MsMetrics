CREATE TABLE [dbo].[AttributeType] (
    [AttributeTypeId] INT           IDENTITY (1, 1) NOT NULL,
    [AttributeType]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_AttributeType] PRIMARY KEY CLUSTERED ([AttributeTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AttributeType]
    ON [dbo].[AttributeType]([AttributeType] ASC);

