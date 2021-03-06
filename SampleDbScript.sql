USE [EstimLabs]
GO
/****** Object:  Table [dbo].[CBRTestEntry]    Script Date: 3/28/2019 1:55:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBRTestEntry](
	[Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConcreteTestResultEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConcreteTestResultEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestNo] [int] NULL,
	[CubeNo] [int] NULL,
	[DateOfCasting] [datetime2](7) NULL,
	[DateOfTest] [datetime2](7) NULL,
	[Slump] [int] NULL,
	[Age] [int] NULL,
	[CubeSize] [int] NULL,
	[CubeWeight] [decimal](18, 6) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ConcreteTestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DensityAbsorbtionTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DensityAbsorbtionTestEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SampleNo] [int] NULL,
	[MassOfSSDSampleInAir] [float] NULL,
	[MassOfBasketSampleInWater] [float] NULL,
	[MassOfEmptyBasketInWater] [float] NULL,
	[MassOfOvenDriedSampleInAir] [float] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DensityAbsorbtionTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldDensityTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldDensityTestEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SrNo] [varchar](50) NULL,
	[Chainage] [int] NULL,
	[OMC] [float] NULL,
	[MDD] [float] NULL,
	[WetDensity] [float] NULL,
	[DryDensity] [float] NULL,
	[FMC] [float] NULL,
	[Depth] [float] NULL,
 CONSTRAINT [PK_FieldDensityTestEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlakinessIndexTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlakinessIndexTestEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FlakinessIndexTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LimeConsumtionTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LimeConsumtionTestEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Temprature] [float] NULL,
	[LimeContent] [float] NULL,
	[RecordedPH] [float] NULL,
	[CorrectedPH] [float] NULL,
 CONSTRAINT [PK_LimeConsumtionTestEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlasticIndexLinearShrinkageTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlasticIndexLinearShrinkageTestEntry](
	[Id] [int] NULL,
	[Type] [varchar](50) NULL,
	[Penetration] [float] NULL,
	[ContainerNo] [varchar](50) NULL,
	[MassOfContainer] [float] NULL,
	[MassOfWetSoilContainer] [float] NULL,
	[MassOfDrySoilContainer] [float] NULL,
	[MassOfWater] [float] NULL,
	[MassOfDrySoil] [float] NULL,
	[MoistureContent] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectMaster]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Contractor] [nvarchar](50) NULL,
	[ContractNo] [nvarchar](50) NULL,
	[Engineer] [nvarchar](50) NULL,
	[ConsultingCompany] [nvarchar](50) NULL,
	[ProjectStartDate] [datetime2](7) NULL,
	[ProjectEndDate] [datetime2](7) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProjectMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSBMechanicalTestEntry]    Script Date: 3/28/2019 1:55:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSBMechanicalTestEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SrNo] [varchar](50) NULL,
	[NominalDiameter] [float] NULL,
	[EffectiveDiameter] [float] NULL,
	[EffectiveMassPerMeter] [float] NULL,
	[YieldLoad] [float] NULL,
	[EffectiveLoad] [float] NULL,
	[Elongation] [float] NULL,
 CONSTRAINT [PK_MechanicalTestOfRSB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SampleCalculation]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SampleCalculation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SampleNo] [int] NULL,
	[Square]  AS (coalesce([SampleNo],(0))*coalesce([SampleNo],(0))),
	[SqaureRoot]  AS ([Id]*[Id]),
 CONSTRAINT [PK_SampleCalculation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeiveAnalysisTest]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeiveAnalysisTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestMethod] [varchar](50) NULL,
	[TestName_Calculated] [varchar](500) NULL,
	[ProjectId] [int] NULL,
	[Material] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[OriginalSource] [varchar](50) NULL,
	[SampleNo] [int] NULL,
	[SampledDate] [datetime2](7) NULL,
	[TestedDate] [datetime2](7) NULL,
	[TestedBy] [varchar](50) NULL,
	[BSSpecification] [varchar](50) NULL,
	[FinenessModulas] [float] NULL,
	[ContractorSign] [varchar](50) NULL,
	[Approved] [varchar](50) NULL,
	[MoistureContentOfSand] [float] NULL,
	[LaboratoryName] [varchar](50) NULL,
	[LaboratoryDescription] [varchar](500) NULL,
 CONSTRAINT [PK_SeiveAnalysisTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeiveTestResultEntry]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeiveTestResultEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceTestId] [int] NULL,
	[SeiveSize] [float] NULL,
	[WeightRetained] [float] NULL,
	[SampleNo] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SeiveTestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestCategoryMaster]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestCategoryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_TestCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProjectMaster] ON 
GO
INSERT [dbo].[ProjectMaster] ([Id], [ProjectName], [Description], [Contractor], [ContractNo], [Engineer], [ConsultingCompany], [ProjectStartDate], [ProjectEndDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'SIX LANES DUAL CARRIAGE WAY PHASE', N'WIDENING OF MOROGORO ROAD SECTION (KIMARA-KIBAHA)TO SIX LANES DUAL CARRIAGE WAY PHASE I:KIMARA DSM COAST BOARDER SECTION19KM INCLUDING CONSTRUCTION OF KIBAMBA,KILUVYA AND MPIJI BRIDGES UNDER DESIGN AND BUILD CONTRACT NO TRD/HQ/1004/2018/19', N'Estim Inc', N'TRD/HQ/1004/2018/19', N'', N'Tandroads Engineering Consulting Unit -TECU', NULL, NULL, NULL, N'Admin', NULL, NULL, 1)
GO
INSERT [dbo].[ProjectMaster] ([Id], [ProjectName], [Description], [Contractor], [ContractNo], [Engineer], [ConsultingCompany], [ProjectStartDate], [ProjectEndDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'REHABILITATION DMDP', N'REHABILITATION AND UPGRADING OF SELECTED INFRASTRUCTURE UNDER DMDP - PACKAGE 3:
 Upgrading of External, Kisukuru, Majichumvi-Kilungule and Kilungule – Korogwe Roads ', N'Estim Inc', NULL, NULL, N'H.P Gauff / Nimeta', NULL, NULL, NULL, N'Admin', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ProjectMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SampleCalculation] ON 
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (1, 5)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (2, 2)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (3, 1)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (4, 2)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (5, 1)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (6, 2)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (7, 1)
GO
INSERT [dbo].[SampleCalculation] ([Id], [SampleNo]) VALUES (8, 16)
GO
SET IDENTITY_INSERT [dbo].[SampleCalculation] OFF
GO
SET IDENTITY_INSERT [dbo].[SeiveAnalysisTest] ON 
GO
INSERT [dbo].[SeiveAnalysisTest] ([Id], [TestMethod], [TestName_Calculated], [ProjectId], [Material], [Source], [OriginalSource], [SampleNo], [SampledDate], [TestedDate], [TestedBy], [BSSpecification], [FinenessModulas], [ContractorSign], [Approved], [MoistureContentOfSand], [LaboratoryName], [LaboratoryDescription]) VALUES (1, N'CML 1.7', N'SeiveAnalysis_20_July_2018', 6, N'WHITISH', N'CAMBODIYA', N'STOCKPILE', 131, CAST(N'2018-07-20T00:00:00.0000000' AS DateTime2), CAST(N'2018-07-24T00:00:00.0000000' AS DateTime2), N'REVINA', NULL, NULL, NULL, NULL, 0, N'NESTIM MATERIALS  LABORATORYULL', N'MATERIAL TESTED AT ESTIM MATERIALS  LABORATORY, MWENGE - DAR ES SALAAM')
GO
SET IDENTITY_INSERT [dbo].[SeiveAnalysisTest] OFF
GO
SET IDENTITY_INSERT [dbo].[SeiveTestResultEntry] ON 
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, 50, 0, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 1, 37.5, 0, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, 1, 28, 79.5, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, 1, 20, 78.2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, 1, 14, 146.7, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, 1, 9.5, 105.9, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, 1, 4.75, 227, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, 1, 2, 140.7, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, 1, 1.18, 60.2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, 1, 0.6, 83.2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, 1, 0.425, 50.4, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, 1, 0.3, 48.5, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, 1, 0.15, 80.7, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[SeiveTestResultEntry] ([Id], [ReferenceTestId], [SeiveSize], [WeightRetained], [SampleNo], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, 1, 0.075, 51.9, NULL, NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SeiveTestResultEntry] OFF
GO
SET IDENTITY_INSERT [dbo].[TestCategoryMaster] ON 
GO
INSERT [dbo].[TestCategoryMaster] ([Id], [Category], [ParentId]) VALUES (1, N'Earthquack', NULL)
GO
INSERT [dbo].[TestCategoryMaster] ([Id], [Category], [ParentId]) VALUES (2, N'Seive Analysis', NULL)
GO
INSERT [dbo].[TestCategoryMaster] ([Id], [Category], [ParentId]) VALUES (3, N'Compression Test', NULL)
GO
INSERT [dbo].[TestCategoryMaster] ([Id], [Category], [ParentId]) VALUES (4, N'FlaskIndex', NULL)
GO
SET IDENTITY_INSERT [dbo].[TestCategoryMaster] OFF
GO
ALTER TABLE [dbo].[ConcreteTestResultEntry] ADD  CONSTRAINT [DF_ConcreteTestResult_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[DensityAbsorbtionTestEntry] ADD  CONSTRAINT [DF_DensityAbsorbtionTest_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProjectMaster] ADD  CONSTRAINT [DF_ProjectMaster_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SeiveTestResultEntry] ADD  CONSTRAINT [DF_SeiveTestResult_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SeiveAnalysisTest]  WITH CHECK ADD  CONSTRAINT [FK_SeiveAnalysisTest_ProjectMaster] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectMaster] ([Id])
GO
ALTER TABLE [dbo].[SeiveAnalysisTest] CHECK CONSTRAINT [FK_SeiveAnalysisTest_ProjectMaster]
GO
ALTER TABLE [dbo].[SeiveTestResultEntry]  WITH CHECK ADD  CONSTRAINT [FK_SeiveTestResultEntry_SeiveAnalysisTest] FOREIGN KEY([ReferenceTestId])
REFERENCES [dbo].[SeiveAnalysisTest] ([Id])
GO
ALTER TABLE [dbo].[SeiveTestResultEntry] CHECK CONSTRAINT [FK_SeiveTestResultEntry_SeiveAnalysisTest]
GO
/****** Object:  StoredProcedure [dbo].[GetAllMasterTestCategory]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Arvind Mepani
-- Create date: 23-March-2019
-- Description:	Initial SP for EF 
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMasterTestCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id,Category from TestCategoryMaster;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSeiveAnalysisTestData]    Script Date: 3/28/2019 1:55:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Arvind Mepani
-- Create date: 23-March-2019
-- Description:	Initial SP for EF 
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSeiveAnalysisTestData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select * from ProjectMaster;

	Select * from SeiveAnalysisTest;

	Select * from SeiveTestResultEntry;
    -- Insert statements for procedure here
	
END
GO
