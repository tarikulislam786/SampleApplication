USE [HIWORK_SAMPLE_DB]
GO
/****** Object:  Table [dbo].[AccessLog]    Script Date: 1/17/2019 3:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PersonId] [char](10) NOT NULL,
	[LoginDeviceName] [varchar](15) NULL,
	[LoginIP] [varchar](20) NULL,
	[LoginTime] [datetime] NOT NULL,
	[LogoutTime] [datetime] NULL,
	[PasswordAttemptCount] [tinyint] NULL,
 CONSTRAINT [PK_AccessLog_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdditionalOperationPermission]    Script Date: 1/17/2019 3:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalOperationPermission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [char](10) NOT NULL,
	[ScreenOperationId] [char](2) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_AdditionalOperationPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdditionalScreenPermission]    Script Date: 1/17/2019 3:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalScreenPermission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [char](10) NOT NULL,
	[ScreenId] [char](5) NOT NULL,
	[AccessRight] [char](4) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_AdditionalScreenPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 1/17/2019 3:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [char](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Applications_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationPolicy]    Script Date: 1/17/2019 3:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationPolicy](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ApplicationId] [char](2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_ApplicationPolicies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityInformation]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityInformation](
	[ApplicationId] [bigint] NOT NULL,
	[ApplicationIdLength] [tinyint] NOT NULL,
	[ModuleId] [bigint] NOT NULL,
	[ModuleIdLength] [tinyint] NOT NULL,
	[ScreenId] [bigint] NOT NULL,
	[ScreenIdLength] [tinyint] NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[MenuIdLength] [tinyint] NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
	[UserTypeIdLength] [tinyint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[RoleIdLength] [tinyint] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[PersonIdLength] [tinyint] NOT NULL,
	[ScreenOperationId] [bigint] NOT NULL,
	[ScreenOperationIdLength] [tinyint] NOT NULL,
	[ApplicationPolicyId] [bigint] NOT NULL,
	[ApplicationPolicyIdLength] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[MenuOrder] [tinyint] NOT NULL,
	[MenuIcon] [nvarchar](500) NULL,
	[ParentMenuId] [char](3) NULL,
	[ScreenId] [char](3) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [char](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ApplicationId] [char](2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Modules_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [char](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NOT NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](250) NOT NULL,
	[LastName] [varchar](250) NOT NULL,
	[FatherName] [varchar](250) NULL,
	[Gender] [varchar](20) NULL,
	[DateOfBirth] [datetime] NULL,
	[BirthPlace] [varchar](250) NULL,
	[Nationality] [varchar](250) NULL,
	[TIN] [varchar](50) NULL,
	[SourceOfIncome] [varchar](250) NULL,
	[Occupation] [varchar](250) NULL,
	[Company] [varchar](250) NULL,
	[Designation] [varchar](250) NULL,
	[NationalId] [varchar](50) NULL,
	[PassportNumber] [varchar](50) NULL,
	[DrivingLicenseNo] [varchar](50) NULL,
	[Country] [varchar](250) NULL,
	[State] [varchar](250) NULL,
	[District] [varchar](250) NULL,
	[PostalCode] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PhotoURL] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[SetFrom] [varchar](50) NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [char](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Roles_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAudit]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAudit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [char](3) NOT NULL,
	[ScreenOperationId] [bigint] NOT NULL,
	[HaveAccess] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
	[DataStatusFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_RoleAudit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleWiseOperationPermission]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleWiseOperationPermission](
	[RoleId] [char](3) NOT NULL,
	[ScreenOperationId] [char](2) NOT NULL,
	[HaveAccess] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_RoleWiseOperationPermission] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ScreenOperationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleWiseScreenPermission]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleWiseScreenPermission](
	[RoleId] [char](3) NOT NULL,
	[ScreenId] [char](3) NOT NULL,
	[AccessRight] [char](4) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_RoleWiseScreenPermission_1] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screen]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screen](
	[Id] [char](3) NOT NULL,
	[ModuleId] [char](2) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Type] [nchar](20) NOT NULL,
	[URL] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Screen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScreenOperation]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScreenOperation](
	[Id] [char](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ScreenId] [char](3) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_ScreenOperations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [char](10) NOT NULL,
	[UserTypeId] [char](2) NOT NULL,
	[PersonId] [char](10) NOT NULL,
	[RoleId] [char](3) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[PasswordAgeLimit] [int] NULL,
	[IsPasswordChanged] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[LastLockedDate] [datetime] NULL,
	[WrongPasswordTryLimit] [int] NULL,
	[IsSuperAdmin] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRole](
	[UserId] [char](10) NOT NULL,
	[RoleId] [char](3) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [char](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SetOn] [datetime] NOT NULL,
	[SetBy] [bigint] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdditionalOperationPermission] ADD  CONSTRAINT [DF_AdditionalOperationPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdditionalOperationPermission] ADD  CONSTRAINT [DF_AdditionalOperationPermission_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AdditionalScreenPermission] ADD  CONSTRAINT [DF_AdditionalScreenPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdditionalScreenPermission] ADD  CONSTRAINT [DF_AdditionalScreenPermission_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ApplicationPolicy] ADD  CONSTRAINT [DF_ApplicationPolicy_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ApplicationPolicy] ADD  CONSTRAINT [DF_ApplicationPolicy_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_PersonId1]  DEFAULT ((0)) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_PersonIdLength1]  DEFAULT ((0)) FOR [ApplicationIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ApplicationId1]  DEFAULT ((0)) FOR [ModuleId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ApplicationIdLength1]  DEFAULT ((0)) FOR [ModuleIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ModuleId1]  DEFAULT ((0)) FOR [ScreenId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ScreenId1]  DEFAULT ((0)) FOR [ScreenIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ScreenId1_1]  DEFAULT ((0)) FOR [MenuId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ScreenIdLength1]  DEFAULT ((0)) FOR [MenuIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_UserType]  DEFAULT ((0)) FOR [UserTypeId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_UserTypeIdLength]  DEFAULT ((0)) FOR [UserTypeIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_UserTypeId1]  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_RoleIdLength]  DEFAULT ((0)) FOR [RoleIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_RoleId1]  DEFAULT ((0)) FOR [PersonId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_PersonIdLength]  DEFAULT ((0)) FOR [PersonIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ScreenId1_2]  DEFAULT ((0)) FOR [ScreenOperationId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_ScreenIdLength1_1]  DEFAULT ((0)) FOR [ScreenOperationIdLength]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_MenuId1]  DEFAULT ((0)) FOR [ApplicationPolicyId]
GO
ALTER TABLE [dbo].[IdentityInformation] ADD  CONSTRAINT [DF_IdentityInformation_MenuIdLength1]  DEFAULT ((0)) FOR [ApplicationPolicyIdLength]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF_Module_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF_Module_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RoleAudit] ADD  CONSTRAINT [DF_RoleAudit_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoleAudit] ADD  CONSTRAINT [DF_RoleAudit_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission] ADD  CONSTRAINT [DF_RoleWiseOperationPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission] ADD  CONSTRAINT [DF_RoleWiseOperationPermission_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission] ADD  CONSTRAINT [DF_RoleWiseScreenPermission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission] ADD  CONSTRAINT [DF_RoleWiseScreenPermission_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ScreenOperation] ADD  CONSTRAINT [DF_ScreenOperation_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ScreenOperation] ADD  CONSTRAINT [DF_ScreenOperation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [DF_UserInformation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserInRole] ADD  CONSTRAINT [DF_UserInRole_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserInRole] ADD  CONSTRAINT [DF_UserInRole_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserType] ADD  CONSTRAINT [DF_UserType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserType] ADD  CONSTRAINT [DF_UserType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AdditionalOperationPermission]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalOperationPermissions_ScreenOperations] FOREIGN KEY([ScreenOperationId])
REFERENCES [dbo].[ScreenOperation] ([Id])
GO
ALTER TABLE [dbo].[AdditionalOperationPermission] CHECK CONSTRAINT [FK_AdditionalOperationPermissions_ScreenOperations]
GO
ALTER TABLE [dbo].[AdditionalOperationPermission]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalOperationPermissions_UserInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([Id])
GO
ALTER TABLE [dbo].[AdditionalOperationPermission] CHECK CONSTRAINT [FK_AdditionalOperationPermissions_UserInformation]
GO
ALTER TABLE [dbo].[AdditionalScreenPermission]  WITH CHECK ADD  CONSTRAINT [FK_AdditionalScreenPermissions_UserInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([Id])
GO
ALTER TABLE [dbo].[AdditionalScreenPermission] CHECK CONSTRAINT [FK_AdditionalScreenPermissions_UserInformation]
GO
ALTER TABLE [dbo].[ApplicationPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationPolicies_Applications] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ApplicationPolicy] CHECK CONSTRAINT [FK_ApplicationPolicies_Applications]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([ParentMenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Screen] FOREIGN KEY([ScreenId])
REFERENCES [dbo].[Screen] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Screen]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Modules_Applications] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Modules_Applications]
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleWiseOperationPermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission] CHECK CONSTRAINT [FK_RoleWiseOperationPermissions_Roles]
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleWiseOperationPermissions_ScreenOperations] FOREIGN KEY([ScreenOperationId])
REFERENCES [dbo].[ScreenOperation] ([Id])
GO
ALTER TABLE [dbo].[RoleWiseOperationPermission] CHECK CONSTRAINT [FK_RoleWiseOperationPermissions_ScreenOperations]
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleWiseScreenPermission_Screen] FOREIGN KEY([ScreenId])
REFERENCES [dbo].[Screen] ([Id])
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission] CHECK CONSTRAINT [FK_RoleWiseScreenPermission_Screen]
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleWiseScreenPermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleWiseScreenPermission] CHECK CONSTRAINT [FK_RoleWiseScreenPermissions_Roles]
GO
ALTER TABLE [dbo].[Screen]  WITH CHECK ADD  CONSTRAINT [FK_Screens_Modules] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([Id])
GO
ALTER TABLE [dbo].[Screen] CHECK CONSTRAINT [FK_Screens_Modules]
GO
ALTER TABLE [dbo].[ScreenOperation]  WITH CHECK ADD  CONSTRAINT [FK_ScreenOperation_Screen] FOREIGN KEY([ScreenId])
REFERENCES [dbo].[Screen] ([Id])
GO
ALTER TABLE [dbo].[ScreenOperation] CHECK CONSTRAINT [FK_ScreenOperation_Screen]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Person]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Roles]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_UserType]
GO
ALTER TABLE [dbo].[UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_Role]
GO
ALTER TABLE [dbo].[UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserInRole_UserInformation] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformation] ([Id])
GO
ALTER TABLE [dbo].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_UserInformation]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAdditionalOperationPermissionList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 1 October 2014
-- Description : Get Additional Operation Permission Details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetAdditionalOperationPermissionList]
@Id AS BIGINT, @UserId AS BIGINT , @ScreenOperationId AS BIGINT
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT AOP.Id, AOP.UserId, AOP.ScreenOperationId, AOP.StartDate, AOP.EndDate, AOP.IsActive,
			   AOP.IsDeleted, AOP.CreatedOn, AOP.CreatedBy, AOP.ModifiedOn, AOP.ModifiedBy, 
			   SO.Name AS ScreenOperationName, U.Username 
			   FROM [MAPPLE_DB].[dbo].[AdditionalOperationPermission] AS AOP 
			   INNER JOIN [dbo].[UserInformation] AS U  ON AOP.UserId = U.Id  
			   INNER JOIN [dbo].[ScreenOperation] AS SO  ON AOP.ScreenOperationId = SO.Id 
			WHERE AOP.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND AOP.Id = @AOPId '

IF (@UserId IS NOT NULL AND @UserId > 0)
	SET @Query = @Query + ' AND U.Id = @UId'

IF (@ScreenOperationId IS NOT NULL AND @ScreenOperationId > 0)
	SET @Query = @Query + ' AND SO.Id = @SOId'


EXECUTE sp_executesql @Query, N'@AOPId BIGINT, @UId BIGINT, @SOId BIGINT', @AOPId = @Id , @UId = @UserId, @SOId = @ScreenOperationId

END

--EXEC [dbo].[USP_GetAdditionalOperationPermissionDetails] 1, NULL, NULL
--EXEC [dbo].[USP_GetAdditionalOperationPermissionDetails] NULL, NULL, NULL
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAdditionalScreenPermissionList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 30 September 2014
-- Description : Get Additional Screen Permission details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetAdditionalScreenPermissionList]
@Id AS BIGINT, @UserId AS BIGINT, @ModuleId AS BIGINT, @ScreenId AS BIGINT  
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT ASP.Id,ASP.UserId, ASP.ScreenId,ASP.StartDate, ASP.EndDate, ASP.AccessRight, 
				CASE WHEN SUBSTRING (ASP.AccessRight,1,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanRead,  
				CASE WHEN SUBSTRING (ASP.AccessRight,2,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanCreate,  
				CASE WHEN SUBSTRING (ASP.AccessRight,3,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanUpdate,  
				CASE WHEN SUBSTRING (ASP.AccessRight,4,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanDelete,
				ASP.IsActive, ASP.IsDeleted, ASP.CreatedOn, ASP.CreatedBy, ASP.ModifiedOn, ASP.ModifiedBy,
				U.Username AS UserName, M.Id ModuleId, M.Name AS ModuleName, S.ScreenCode, S.Title AS ScreenTitle
			FROM [dbo].[AdditionalScreenPermission] AS ASP 
				INNER JOIN [MAPPLE_DB].[dbo].[UserInformation] AS U ON ASP.UserId = U.Id  
				INNER JOIN [dbo].[Screen] AS S ON ASP.ScreenId = S.id 
				INNER JOIN [MAPPLE_DB].[dbo].[Module] AS M ON S.ModuleID = M.Id  
			WHERE ASP.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND ASP.Id = @UId'

IF (@UserId IS NOT NULL AND @UserId > 0)
	SET @Query = @Query + ' AND U.Id = @RId'

IF (@ModuleId IS NOT NULL AND @ModuleId > 0)
	SET @Query = @Query + ' AND M.Id = @MId'

IF (@ScreenId IS NOT NULL AND @ScreenId > 0)
	SET @Query = @Query + ' AND S.Id = @SId'

EXECUTE sp_executesql @Query, N'@UId BIGINT, @RId BIGINT, @MId BIGINT, @SId BIGINT', @UId = @Id , @RId = @UserId, @MId = @ModuleId, @SId = @ScreenId

END

--EXEC [dbo].[USP_GetAdditionalScreenPermissionList] NULL, 4,3,NULL
--EXEC [dbo].[USP_GetAdditionalScreenPermissionList] NULL, NULL,NULL,NULL



GO
/****** Object:  StoredProcedure [dbo].[USP_GetNextId]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Mamun
-- Create date : 03 May 2017
-- Description : Get Next Id
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetNextId]
@IdentityField AS VARCHAR(50),
@IdentityLengthField AS VARCHAR(50)
AS
BEGIN
	SET FMTONLY OFF;
	DECLARE @QUERY AS NVARCHAR(MAX);
	DECLARE @Result AS VARCHAR(20);

	SET @QUERY = 'UPDATE [dbo].[IdentityInformation] SET ' + @IdentityField + ' = (SELECT ' + @IdentityField + ' FROM [dbo].[IdentityInformation]) + 1'
	SET @Query = @Query +  'SELECT RIGHT (''0000000000'' + CONVERT(VARCHAR(10), ' + @IdentityField + ' ), (SELECT ' + @IdentityLengthField + ' FROM IdentityInformation)) AS Id FROM IdentityInformation'

	DECLARE @TableId TABLE (Id VARCHAR(20))
	INSERT @TableId EXEC(@QUERY)
	SET @Result = (SELECT Id FROM @TableId)
	SELECT @Result AS Id

	--CREATE TABLE #TableId
	--(
	--	Id VARCHAR(10) 
	--)
	--INSERT INTO #TableId EXEC (@QUERY)
	--SELECT Id FROM #TableId
	--DROP TABLE #TableId
END

--EXEC [dbo].[USP_GetNextId] 'UserTypeId', 'UserTypeIdLength'
--EXEC [dbo].[USP_GetNextId] 'RoleId', 'RoleIdLength'



--UPDATE [dbo].[IdentityInformation] SET UserTypeId = (SELECT UserTypeId FROM [dbo].[IdentityInformation]) + 1
--SELECT RIGHT ('0000000000' + CONVERT(VARCHAR(10), UserTypeId), (SELECT UserTypeIdLength FROM IdentityInformation)) FROM IdentityInformation
--EXECUTE SP_EXECUTESQL @Query
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoleWiseOperationPermissionList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 1 October 2014
-- Description : Get Role WiseOperation Permission Details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetRoleWiseOperationPermissionList]
@Id AS BIGINT, @RoleId AS BIGINT , @ScreenOperationId AS BIGINT
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT  RWOP.Id, RWOP.RoleId, RWOP.ScreenOperationId, RWOP.HaveAccess, RWOP.IsActive, 
             RWOP.IsDeleted, RWOP.CreatedOn, RWOP.CreatedBy, RWOP.ModifiedOn, RWOP.ModifiedBy, 
             R.Name AS RoleName, SO.Name AS ScreenOperationName
             FROM [dbo].[RoleWiseOperationPermission] AS RWOP 
             INNER JOIN [dbo].[Role] AS R ON RWOP.RoleId = R.Id  
             INNER JOIN [dbo].[ScreenOperation] AS SO  ON RWOP.ScreenOperationId = SO.Id 
			 WHERE RWOP.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND RWOP.Id = @RWOPId '

IF (@RoleId IS NOT NULL AND @RoleId > 0)
	SET @Query = @Query + ' AND R.Id = @RId'

IF (@ScreenOperationId IS NOT NULL AND @ScreenOperationId > 0)
	SET @Query = @Query + ' AND SO.Id = @SOId'


EXECUTE sp_executesql @Query, N'@RWOPId BIGINT, @RId BIGINT, @SOId BIGINT', @RWOPId = @Id , @RId = @RoleId, @SOId = @ScreenOperationId

END

--EXEC [dbo].[USP_GetRoleWiseOperationPermissionList] 1, NULL, NULL
--EXEC [dbo].[USP_GetRoleWiseOperationPermissionList] NULL, NULL, NULL
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoleWiseScreenPermissionList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 27 September 2014
-- Description : Get Role Wise Screen Permission details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetRoleWiseScreenPermissionList]
@Id AS BIGINT, @RoleId AS BIGINT, @ModuleId AS BIGINT, @ScreenId AS BIGINT  
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT RWSP.Id, RWSP.RoleId, RWSP.ScreenId, RWSP.AccessRight, 
				CASE WHEN SUBSTRING (RWSP.AccessRight,1,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanRead,  
				CASE WHEN SUBSTRING (RWSP.AccessRight,2,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanCreate,  
				CASE WHEN SUBSTRING (RWSP.AccessRight,3,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanUpdate,  
				CASE WHEN SUBSTRING (RWSP.AccessRight,4,1)=''1'' THEN ''Yes'' ELSE ''No'' END CanDelete,
				RWSP.IsActive, RWSP.IsDeleted, RWSP.CreatedOn, RWSP.CreatedBy, RWSP.ModifiedOn, RWSP.ModifiedBy,
				R.Name AS RoleName, M.Id ModuleId, M.Name AS ModuleName, S.ScreenCode, S.Title AS ScreenTitle
			FROM [dbo].[RoleWiseScreenPermission] AS RWSP 
				INNER JOIN [dbo].[Role] AS R ON RWSP.RoleId = R.Id  
				INNER JOIN [dbo].[Screen] AS S ON RWSP.ScreenId = S.id 
				INNER JOIN [dbo].[Module] AS M ON S.ModuleID = M.Id  
			WHERE RWSP.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + 'AND RWSP.Id = @RWSPId '

IF (@RoleId IS NOT NULL AND @RoleId > 0)
	SET @Query = @Query + 'AND R.Id = @RId'

IF (@ModuleId IS NOT NULL AND @ModuleId > 0)
	SET @Query = @Query + 'AND M.Id = @MId'

IF (@ScreenId IS NOT NULL AND @ScreenId > 0)
	SET @Query = @Query + 'AND S.Id = @SId'

EXECUTE sp_executesql @Query, N'@RWSPId BIGINT, @RId BIGINT, @MId BIGINT, @SId BIGINT', @RWSPId = @Id , @RId = @RoleId, @MId = @ModuleId, @SId = @ScreenId

END

--EXEC [dbo].[USP_GetRoleWiseScreenPermissionList] 2, NULL,NULL,NULL
--EXEC [dbo].[USP_GetRoleWiseScreenPermissionList] NULL, NULL,NULL,NULL





GO
/****** Object:  StoredProcedure [dbo].[USP_GetScreenList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 30 September 2014
-- Description : Get Screen Details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetScreenList]
@Id AS BIGINT, @ModuleId AS BIGINT
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT S.Id,S.ScreenCode,S.ModuleId,S.Title AS ScreenTitle, S.Type, S.URL, 
				   S.IsActive, S.IsDeleted, S.CreatedOn, S.CreatedBy, S.ModifiedOn, S.ModifiedBy,
				   M.Name AS ModuleName 
			 FROM [dbo].[Screen] AS S INNER JOIN [dbo].[Module] AS M ON S.ModuleId = M.Id
			 WHERE S.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND S.Id = @SId '

IF (@ModuleId IS NOT NULL AND @ModuleId > 0)
	SET @Query = @Query + ' AND M.Id = @MId'


EXECUTE sp_executesql @Query, N'@SId BIGINT, @MId BIGINT', @SId = @Id , @MId = @ModuleId

END

--EXEC [dbo].[USP_GetScreenList] NULL, 3
--EXEC [dbo].[USP_GetScreenList] NULL, NULL

GO
/****** Object:  StoredProcedure [dbo].[USP_GetScreenOperationList]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Md Abdul Hannan Mahin
-- Create date : 1 October 2014
-- Description : Get Screen Operation Details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetScreenOperationList]
@Id AS BIGINT, @ScreenId AS BIGINT
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
			'SELECT SO.Id, SO.Name, SO.Description, SO.ScreenId, SO.IsActive,
				SO.IsActive, SO.IsDeleted, SO.CreatedOn, SO.CreatedBy, SO.ModifiedOn, SO.ModifiedBy, S.Title AS ScreenTitle
				FROM [dbo].[ScreenOperation] AS SO 
				INNER JOIN [dbo].[Screen] AS S  ON SO.ScreenId = S.Id
			WHERE SO.IsDeleted = 0'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND SO.Id = @SOId '

IF (@ScreenId IS NOT NULL AND @ScreenId > 0)
	SET @Query = @Query + ' AND S.Id = @SId'


EXECUTE sp_executesql @Query, N'@SOId BIGINT, @SId BIGINT', @SOId = @Id , @SId = @ScreenId

END

--EXEC [dbo].[USP_GetScreenOperationList] 1, NULL
--EXEC [dbo].[USP_GetScreenOperationList] NULL, NULL
GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserDetails]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : M.A.R. Bin Siddiqui
-- Create date : 19 September 2014
-- Description : Get user information details
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetUserDetails]
@Id AS BIGINT, @Username AS NVARCHAR(50)
AS
BEGIN

SET FMTONLY OFF;

DECLARE @Query NVARCHAR(MAX) 

SET @Query = 
	'SELECT UI.Id, UI.UserTypeId, UT.Name AS UserTypeName, UI.RoleId, R.Name AS RoleName,
		UI.Username, UI.Password, UI.PasswordAgeLimit, UI.IsPasswordChanged, UI.IsLocked, UI.LastPasswordChangedDate, 
		UI.LastLockedDate, UI.WrongPasswordTryLimit, UI.IsSuperAdmin, UI.IsActive,
		UI.EmployeeId, E.EmployeeCode,  CONCAT(PI.Title, '' '', PI.FirstName, '' '', PI.MiddleName, '' '', PI.LastName) AS EmployeeName,
		E.CategoryId, EC.Name AS CategoryName,
		E.DepartmentId, Department.Name AS DepartmentName,
		E.DesignationId, Designation.Name AS DesignationName
	FROM [dbo].UserInformation AS UI INNER JOIN
		[dbo].UserType AS UT ON UT.Id = UI.UserTypeId LEFT JOIN 
		[dbo].Role AS R ON R.Id = UI.RoleId INNER JOIN 
		[HRM].Employee AS E ON E.Id = UI.EmployeeId LEFT JOIN 
		[HRM].EmployeeCategory AS EC ON EC.Id = E.CategoryId LEFT JOIN 
		[HRM].Department ON Department.Id = E.DepartmentId LEFT JOIN 
		[HRM].Designation ON Designation.Id = E.DesignationId LEFT JOIN 
		[HRM].PersonalInformation AS PI ON PI.EmployeeId = E.Id 
	WHERE 1=1'

IF (@Id IS NOT NULL AND @Id > 0)
    SET @Query = @Query + ' AND UI.Id = @UId'

IF (@Username IS NOT NULL AND LEN(@Username) > 1)
	SET @Query = @Query + ' AND UI.Username = @UName'

EXECUTE sp_executesql @Query, N'@UId BIGINT, @UName NVARCHAR(50)', @UId = @Id, @UName = @Username

END

--EXEC [dbo].[USP_GetUserDetails] 4, 'admin'
--EXEC [dbo].[USP_GetUserDetails] 4, NULL
--EXEC [dbo].[USP_GetUserDetails] NULL, 'admin'
--EXEC [dbo].[USP_GetUserDetails] NULL, NULL


GO
/****** Object:  StoredProcedure [dbo].[USP_GetUsers]    Script Date: 1/17/2019 3:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : M.A.R. Bin Siddiqui
-- Create date : 19 September 2014
-- Description : Get all users
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetUsers]
AS
BEGIN

	SELECT UI.Id, UI.UserTypeId, UT.Name AS UserTypeName, UI.RoleId, R.Name AS RoleName, UI.Username, UI.IsActive, UI.IsLocked,
		E.EmployeeCode,  CONCAT(PI.Title, ' ', PI.FirstName, ' ', PI.MiddleName, ' ', PI.LastName) AS EmployeeName,
		E.CategoryId, EC.Name AS CategoryName,
		E.DepartmentId, Department.Name AS DepartmentName,
		E.DesignationId, Designation.Name AS DesignationName
	FROM [dbo].UserInformation AS UI INNER JOIN
		[dbo].UserType AS UT ON UT.Id = UI.UserTypeId LEFT JOIN 
		[dbo].Role AS R ON R.Id = UI.RoleId LEFT JOIN 
		[HRM].Employee AS E ON E.Id = UI.EmployeeId INNER JOIN 
		[HRM].EmployeeCategory AS EC ON EC.Id = E.CategoryId LEFT JOIN 
		[HRM].Department ON Department.Id = E.DepartmentId LEFT JOIN 
		[HRM].Designation ON Designation.Id = E.DesignationId LEFT JOIN 
		[HRM].PersonalInformation AS PI ON PI.EmployeeId = E.Id 
	WHERE UI.IsDeleted = 0 ORDER BY UI.Id

END

--EXEC [dbo].[USP_GetUsers]


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A courtesy title. For example, Mr. or Ms.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Title'
GO
