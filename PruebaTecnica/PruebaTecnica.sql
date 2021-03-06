USE [dbPruebaTecnica]
GO
/****** Object:  Table [dbo].[tbl_Citas]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Citas](
	[IdCita] [int] IDENTITY(1,1) NOT NULL,
	[IdEspecialista] [int] NULL,
	[IdPaciente] [int] NULL,
	[Fecha] [date] NULL,
	[Estado] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_Citas] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Especialistas]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Especialistas](
	[IdEspecialista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Especialidad] [nvarchar](50) NULL,
	[Telefono] [nvarchar](15) NULL,
	[DUI] [nvarchar](50) NULL,
	[JVPM] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Especialistas] PRIMARY KEY CLUSTERED 
(
	[IdEspecialista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Pacientes]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Pacientes](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Telefono] [nvarchar](50) NULL,
	[DUI] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Pacientes] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Citas] ON 

INSERT [dbo].[tbl_Citas] ([IdCita], [IdEspecialista], [IdPaciente], [Fecha], [Estado]) VALUES (1, 1, 1, CAST(N'2022-05-07' AS Date), N'ACTIVO')
SET IDENTITY_INSERT [dbo].[tbl_Citas] OFF
SET IDENTITY_INSERT [dbo].[tbl_Especialistas] ON 

INSERT [dbo].[tbl_Especialistas] ([IdEspecialista], [Nombre], [Especialidad], [Telefono], [DUI], [JVPM]) VALUES (1, N'Test', N'Medicina Interna', N'1312-4567', N'32125467-7', N'789')
SET IDENTITY_INSERT [dbo].[tbl_Especialistas] OFF
SET IDENTITY_INSERT [dbo].[tbl_Pacientes] ON 

INSERT [dbo].[tbl_Pacientes] ([IdPaciente], [Nombre], [Telefono], [DUI]) VALUES (1, N'Test', N'1324-4566', N'12345678-9')
INSERT [dbo].[tbl_Pacientes] ([IdPaciente], [Nombre], [Telefono], [DUI]) VALUES (2, N'Test2', N'9876-5432', N'98765432-1')
SET IDENTITY_INSERT [dbo].[tbl_Pacientes] OFF
/****** Object:  StoredProcedure [dbo].[InsertarCita]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarCita]
	-- Add the parameters for the stored procedure here
	@IdEspecialista int,
	@IdPaciente int,
	@Fecha date,
	@Estado nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Citas]
			([IdEspecialista]
			,[IdPaciente]
			,[Fecha]
			,[Estado])
		VALUES
			(@IdEspecialista
			,@IdPaciente
			,@Fecha
			,@Estado);
	

END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEspecialista]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,, Se utilizara Para Insertar y Actualizar>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarEspecialista]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(100),
	@Especialidad nvarchar(50),
	@Telefono nvarchar(15),
	@DUI nvarchar(50),
	@JVPM nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (SELECT [DUI] FROM [dbo].[tbl_Especialistas] WHERE [DUI]=@DUI) IS NULL
		BEGIN
			INSERT INTO [dbo].[tbl_Especialistas]
				   ([Nombre]
				   ,[Especialidad]
				   ,[Telefono]
				   ,[DUI]
				   ,[JVPM])
			 VALUES
				   (@Nombre
				   ,@Especialidad
				   ,@Telefono
				   ,@DUI
				   ,@JVPM);
		END
	ELSE
		BEGIN
			UPDATE [dbo].[tbl_Especialistas]
			   SET [Nombre] = @Nombre
				  ,[Especialidad] = @Especialidad
				  ,[Telefono] = @Telefono
				  ,[DUI] = @DUI
				  ,[JVPM] = @JVPM
			 WHERE [DUI]=@DUI;
		END



END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPaciente]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,, Se utilizara Para Insertar y Actualizar>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarPaciente]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(100),
	@Telefono nvarchar(15),
	@DUI nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (SELECT [DUI] FROM [dbo].[tbl_Pacientes] WHERE [DUI]=@DUI) IS NULL
		BEGIN
			INSERT INTO [dbo].[tbl_Pacientes]
				   ([Nombre]
				   ,[Telefono]
				   ,[DUI])
			 VALUES
				   (@Nombre
				   ,@Telefono
				   ,@DUI);
		END
	ELSE
		BEGIN
			UPDATE [dbo].[tbl_Pacientes]
			   SET [Nombre] = @Nombre
				  ,[Telefono] = @Telefono
			 WHERE [DUI]=@DUI;
		END

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCitas]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerCitas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdCita]
      ,[IdEspecialista]
      ,[IdPaciente]
      ,[Fecha]
      ,[Estado]
  FROM [dbPruebaTecnica].[dbo].[tbl_Citas]
	

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEspecialistas]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerEspecialistas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdEspecialista]
      ,[Nombre]
      ,[Especialidad]
      ,[Telefono]
      ,[DUI]
      ,[JVPM]
  FROM [dbPruebaTecnica].[dbo].[tbl_Especialistas]
	

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPacientes]    Script Date: 7/5/2022 01:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerPacientes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPaciente]
      ,[Nombre]
      ,[Telefono]
      ,[DUI]
  FROM [dbPruebaTecnica].[dbo].[tbl_Pacientes]
	

END
GO
