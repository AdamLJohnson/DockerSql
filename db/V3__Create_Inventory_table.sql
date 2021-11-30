CREATE TABLE [dbo].[Reviews](
    [ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ProductId] [int] NOT NULL,
    [ReviewText] VARCHAR(max) NOT NULL
)
GO

ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Products]
GO