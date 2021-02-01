CREATE TABLE [dbo].[AttributeImport] (
    [Date]             DATETIME      CONSTRAINT [DF_AttributeImport_Date] DEFAULT (getutcdate()) NOT NULL,
    [Region]           NVARCHAR (50) NOT NULL,
    [Segment]          NVARCHAR (50) NOT NULL,
    [TotalCount]       INT           NOT NULL,
    [TotalImpressions] INT           NOT NULL,
    [AttributeType]    NVARCHAR (50) NOT NULL,
    [Attribute]        NVARCHAR (50) NOT NULL,
    [Value]            INT           NOT NULL
);





