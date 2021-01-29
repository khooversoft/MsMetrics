CREATE TABLE [dbo].[AttributeImport] (
    [Date]          DATETIME      CONSTRAINT [DF_AttributeImport_Date] DEFAULT (getutcdate()) NOT NULL,
    [Attribute]     NVARCHAR (50) NOT NULL,
    [AggCountValue] INT           NOT NULL,
    [Region]        NVARCHAR (50) NULL,
    [Language]      NVARCHAR (50) NULL,
    [Category]      NVARCHAR (50) NULL,
    [Provider]      NVARCHAR (50) NULL
);



