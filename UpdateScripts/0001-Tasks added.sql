/*

	Updates SuperService database for using Task module

*/

SET NUMERIC_ROUNDABORT OFF -- не валимся при ошибках округления
GO

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

SET XACT_ABORT ON   --прекращаем выполнение при ошибке
GO

SET QUOTED_IDENTIFIER ON
GO

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

BEGIN TRANSACTION
GO

IF @@ERROR <> 0 SET NOEXEC ON
GO

PRINT N'Update index for [Catalog].[Equipment_Equiements]'
GO

PRINT N'Dropping [Catalog].[UQ_Catalog_Equipment_Equiements_Key]...';
GO

DROP INDEX [UQ_Catalog_Equipment_Equiements_Key] ON [Catalog].[Equipment_Equiements]
GO

PRINT N'Creating [Catalog].[UQ_Catalog_Equipment_Equiements_Key]...';
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_Catalog_Equipment_Equiements_Key] ON [Catalog].[Equipment_Equiements]
(
  [Ref] ASC,
  [Clients] ASC,
  [Equiement] ASC,
  [Period] ASC
)
WHERE ([IsDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

PRINT N'Change lenght'
GO

ALTER TABLE [Catalog].[TypesDepartures] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[RIM] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Document].[Event] ALTER COLUMN [DetailedDescription] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Document].[Event] ALTER COLUMN [TargInteractions] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Document].[Event] ALTER COLUMN [ResultInteractions] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
DROP INDEX [UQ_Document_Event_Files_Key] ON [Document].[Event_Files]
GO
ALTER TABLE [Document].[Event_Files] ALTER COLUMN [FullFileName] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Document_Event_Files_Key] ON [Document].[Event_Files]
(
  [Ref] ASC,
  [FileName] ASC
)
WHERE ([IsDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Document].[Event_Equipments] ALTER COLUMN [Terget] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Document].[Event_CheckList] ALTER COLUMN [Result] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[SKU] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[ServiceAgreement] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[EquipmentOptions_ListValues] ALTER COLUMN [Val] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[Equipment] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[Equipment_Equiements] ALTER COLUMN [ContactForEquiemnt] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[Equipment_Equiements] ALTER COLUMN [Info] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[Equipment_EquiementsHistory] ALTER COLUMN [ObjectGet] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[Equipment_EquiementsHistory] ALTER COLUMN [Comment] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
DROP INDEX [UQ_Catalog_Equipment_Files_Key] ON [Catalog].[Equipment_Files]
GO
ALTER TABLE [Catalog].[Equipment_Files] ALTER COLUMN [FullFileName] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Catalog_Equipment_Files_Key] ON [Catalog].[Equipment_Files]
(
  [Ref] ASC,
  [FileName] ASC
)
WHERE ([IsDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Catalog].[Client] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[Client] ALTER COLUMN [Address] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
DROP INDEX [UQ_Catalog_Client_Files_Key] ON [Catalog].[Client_Files]
GO
ALTER TABLE [Catalog].[Client_Files] ALTER COLUMN [FullFileName] nvarchar(1000) COLLATE Cyrillic_General_CI_AS NULL
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Catalog_Client_Files_Key] ON [Catalog].[Client_Files]
(
  [Ref] ASC,
  [FileName] ASC
)
WHERE ([IsDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Catalog].[SettingMobileApplication] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[User] ALTER COLUMN [Password] nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL
GO
ALTER TABLE [Catalog].[User] ALTER COLUMN [EMail] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[User] ALTER COLUMN [Phone] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[ClientOptions_ListValues] ALTER COLUMN [Val] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[EventOptions_ListValues] ALTER COLUMN [Val] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Document].[CheckList] ALTER COLUMN [Description] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO
ALTER TABLE [Catalog].[Contacts] ALTER COLUMN [Tel] nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL
GO

PRINT N'Creating [Enum].[StatusTasks]'
GO

CREATE TABLE [Enum].[StatusTasks]
(
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_Enum_StatusTasks] PRIMARY KEY NONCLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
GO


PRINT N'Creating elements in [Enum].[StatusTasks]'

declare @date datetime2 = getdate()
declare @ticksPerDay bigint = 864000000000
declare @date2 datetime2 = @date
declare @dateBinary binary(9) = cast(reverse(cast(@date2 as binary(9))) as binary(9))
declare @days bigint = cast(substring(@dateBinary, 1, 3) as bigint)
declare @time bigint = cast(substring(@dateBinary, 4, 5) as bigint)
declare @ts bigint = @days * @ticksPerDay + @time

INSERT INTO [Enum].[StatusTasks]
           ([Id]
           ,[Timestamp]
           ,[IsDeleted]
           ,[Name]
           ,[Description])
     VALUES
           ('a0a9e67f-483e-419a-a714-859f13c1245c'
           ,@ts
           ,0
           ,'New'
           ,'Новая');

INSERT INTO [Enum].[StatusTasks]
           ([Id]
           ,[Timestamp]
           ,[IsDeleted]
           ,[Name]
           ,[Description])
     VALUES
           ('a0a9e67f-483e-423a-a714-859f13c1245c'
           ,@ts
           ,0
           ,'Done'
           ,'Выполнена');

INSERT INTO [Enum].[StatusTasks]
           ([Id]
           ,[Timestamp]
           ,[IsDeleted]
           ,[Name]
           ,[Description])
     VALUES
           ('a0a9e67f-483e-426b-a714-859f13c1245c'
           ,@ts
           ,0
           ,'Rejected'
           ,'Отклонена');

GO


PRINT N'Creating [Document].[Task]'

CREATE TABLE [Document].[Task](
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Posted] [bit] NULL,
	[DeletionMark] [bit] NULL,
	[Date] [datetime2](7) NOT NULL,
	[Number] [nvarchar](9) NULL,
	[Description] [nvarchar](500) NULL,
	[Client] [uniqueidentifier] NOT NULL,
	[Equipment] [uniqueidentifier] NULL,
	[Event] [uniqueidentifier] NULL,
	CONSTRAINT [PK_Document_Task] PRIMARY KEY NONCLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO

ALTER TABLE [Document].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Catalog_Client_Client] FOREIGN KEY([Client])
REFERENCES [Catalog].[Client] ([Id])
GO

ALTER TABLE [Document].[Task] CHECK CONSTRAINT [FK_Document_Task_Catalog_Client_Client]
GO

ALTER TABLE [Document].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Catalog_Equipment_Equipment] FOREIGN KEY([Equipment])
REFERENCES [Catalog].[Equipment] ([Id])
GO

ALTER TABLE [Document].[Task] CHECK CONSTRAINT [FK_Document_Task_Catalog_Equipment_Equipment]
GO


ALTER TABLE [Document].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Document_Event_Event] FOREIGN KEY([Event])
REFERENCES [Document].[Event] ([Id])
GO

ALTER TABLE [Document].[Task] CHECK CONSTRAINT [FK_Document_Task_Document_Event_Event]
GO


PRINT N'Creating [Document].[Task_Targets]'

CREATE TABLE [Document].[Task_Targets](
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Ref] [uniqueidentifier] NOT NULL,
	[Description]  [nvarchar](500) NULL,
	[IsDone] [bit] NULL,
	CONSTRAINT [PK_Document_Task_Targets] PRIMARY KEY NONCLUSTERED
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

ALTER TABLE [Document].[Task_Targets]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Targets_Document_Task_EntityId] FOREIGN KEY([Ref])
REFERENCES [Document].[Task] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [Document].[Task_Targets] CHECK CONSTRAINT [FK_Document_Task_Targets_Document_Task_EntityId]
GO



PRINT N'Creating [Document].[Task_Status]'

CREATE TABLE [Document].[Task_Status](
  [Timestamp] [bigint] NULL,
  [IsDeleted] [bit] NULL,
  [Id] [uniqueidentifier] NOT NULL,
  [Ref] [uniqueidentifier] NOT NULL,
  [LineNumber] [int] NULL,
  [CommentContractor] [nvarchar](1000) NULL,
  [Status] [uniqueidentifier] NULL,
  [UserMA] [uniqueidentifier] NULL,
  [ActualEndDate] [datetime2](7) NULL,
	CONSTRAINT [PK_Document_Task_Status] PRIMARY KEY NONCLUSTERED
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [Document].[Task_Status] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO

ALTER TABLE [Document].[Task_Status]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Status_Document_Task_EntityId] FOREIGN KEY([Ref])
REFERENCES [Document].[Task] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [Document].[Task_Status] CHECK CONSTRAINT [FK_Document_Task_Status_Document_Task_EntityId]
GO

ALTER TABLE [Document].[Task_Status]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Status_Catalog_User_UserMA] FOREIGN KEY([UserMA])
REFERENCES [Catalog].[User] ([Id])
GO

ALTER TABLE [Document].[Task_Status] CHECK CONSTRAINT [FK_Document_Task_Status_Catalog_User_UserMA]
GO

ALTER TABLE [Document].[Task_Status]  WITH CHECK ADD  CONSTRAINT [FK_Document_Task_Status_Enum_StatusTasks_Status] FOREIGN KEY([Status])
REFERENCES [Enum].[StatusTasks] ([Id])
GO

ALTER TABLE [Document].[Task_Status] CHECK CONSTRAINT [FK_Document_Task_Status_Enum_StatusTasks_Status]
GO

PRINT N'Creating [dbo].[PicturePaths]...';
GO

CREATE TABLE [dbo].[PicturePaths] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Name]        NVARCHAR (200)   NOT NULL,
    [PrivatePath] NVARCHAR (250)   NULL,
    [SharedPath]  NVARCHAR (250)   NULL,
    CONSTRAINT [UQ_PicturePaths_Name] UNIQUE NONCLUSTERED ([Name] ASC),
  CONSTRAINT [PK_PicturePaths] PRIMARY KEY ([Id])
);
GO

PRINT N'Creating unnamed constraint on [dbo].[PicturePaths]...';
GO

ALTER TABLE [dbo].[PicturePaths]
    ADD DEFAULT (newsequentialid()) FOR [Id];
GO

CREATE UNIQUE NONCLUSTERED INDEX [Name_ASC_Unclustered_Unique]
ON [dbo].[PicturePaths] ([Name] ASC)
WITH (PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [default]
GO

IF @@ERROR <> 0 SET NOEXEC ON
GO

PRINT N'Inserting data into [admin].[SyncConfiguration]'

INSERT INTO [admin].[SyncConfiguration]
           ([SyncTable]
           ,[SyncFilter]
           ,[SyncOrder])
     VALUES
           ('Document.Task'
           ,''
           ,41)

INSERT INTO [admin].[SyncConfiguration]
           ([SyncTable]
           ,[SyncFilter]
           ,[SyncOrder])
     VALUES
           ('Document.Tasks_Targets'
           ,''
           ,42)

INSERT INTO [admin].[SyncConfiguration]
           ([SyncTable]
           ,[SyncFilter]
           ,[SyncOrder])
     VALUES
           ('Document.Tasks_Status'
           ,''
           ,43)

INSERT INTO [admin].[SyncConfiguration]
           ([SyncTable]
           ,[SyncFilter]
           ,[SyncOrder])
     VALUES
           ('Enum.StatusTasks'
           ,''
           ,51)
GO


COMMIT TRANSACTION
GO

PRINT 'Finished.'