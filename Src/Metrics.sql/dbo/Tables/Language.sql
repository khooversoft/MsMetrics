CREATE TABLE [dbo].[Language] (
    [LanguageId] INT           IDENTITY (1, 1) NOT NULL,
    [Language]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Language]
    ON [dbo].[Language]([Language] ASC);

