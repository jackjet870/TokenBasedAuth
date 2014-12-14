

/****** Object:  Database [brewday]    Script Date: 12/14/2014 11:24:05 AM ******/
CREATE DATABASE [brewday]
GO

USE [brewday]
GO

ALTER DATABASE [brewday] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [brewday].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [brewday] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [brewday] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [brewday] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [brewday] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [brewday] SET ARITHABORT OFF 
GO

ALTER DATABASE [brewday] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [brewday] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [brewday] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [brewday] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [brewday] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [brewday] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [brewday] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [brewday] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [brewday] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [brewday] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [brewday] SET  DISABLE_BROKER 
GO

ALTER DATABASE [brewday] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [brewday] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [brewday] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [brewday] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [brewday] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [brewday] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [brewday] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [brewday] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [brewday] SET  MULTI_USER 
GO

ALTER DATABASE [brewday] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [brewday] SET DB_CHAINING OFF 
GO

ALTER DATABASE [brewday] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [brewday] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [brewday] SET  READ_WRITE 
GO

CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO

