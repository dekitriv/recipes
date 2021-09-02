USE [master]
GO
/****** Object:  Database [Recipes]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE DATABASE [Recipes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Recipes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Recipes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Recipes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Recipes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Recipes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Recipes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Recipes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Recipes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Recipes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Recipes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Recipes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Recipes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Recipes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Recipes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Recipes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Recipes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Recipes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Recipes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Recipes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Recipes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Recipes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Recipes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Recipes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Recipes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Recipes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Recipes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Recipes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Recipes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Recipes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Recipes] SET  MULTI_USER 
GO
ALTER DATABASE [Recipes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Recipes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Recipes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Recipes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Recipes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Recipes] SET QUERY_STORE = OFF
GO
USE [Recipes]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryRecipes]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRecipes](
	[CategoryId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryRecipes] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientRecipes]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientRecipes](
	[IngredientId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[Amount] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_IngredientRecipes] PRIMARY KEY CLUSTERED 
(
	[IngredientId] ASC,
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NutritionRecipes]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NutritionRecipes](
	[NutritionId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[Amount] [real] NOT NULL,
 CONSTRAINT [PK_NutritionRecipes] PRIMARY KEY CLUSTERED 
(
	[NutritionId] ASC,
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutritions]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutritions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Nutritions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Servings] [real] NOT NULL,
	[CookTime] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Steps]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Steps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Steps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](450) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCase]    Script Date: 9/2/2021 6:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserUseCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210827204827_initialization', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210828000450_fixing', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210828001835_fixing1', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210829194703_adding', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210830233144_fixing indexes for database', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210830233432_fixing indexes 2', N'5.0.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210831035214_123', N'5.0.9')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Dinner', 0, CAST(N'2021-08-28T21:14:24.1456517' AS DateTime2), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, N'Breakfast', 0, CAST(N'2021-08-29T19:31:13.9525288' AS DateTime2), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (3, N'Cake', 0, CAST(N'2021-08-29T19:31:17.8220461' AS DateTime2), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (7, N'Desert', 0, CAST(N'2021-09-02T18:15:51.5334128' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (1, 1)
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (3, 1)
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (2, 6)
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (3, 6)
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (2, 7)
GO
INSERT [dbo].[CategoryRecipes] ([CategoryId], [RecipeId]) VALUES (3, 8)
GO
INSERT [dbo].[IngredientRecipes] ([IngredientId], [RecipeId], [Amount]) VALUES (2, 1, N'50')
GO
INSERT [dbo].[IngredientRecipes] ([IngredientId], [RecipeId], [Amount]) VALUES (2, 7, N'35')
GO
INSERT [dbo].[IngredientRecipes] ([IngredientId], [RecipeId], [Amount]) VALUES (2, 8, N'200 grams')
GO
INSERT [dbo].[IngredientRecipes] ([IngredientId], [RecipeId], [Amount]) VALUES (3, 6, N'3')
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Banana', 0, CAST(N'2021-08-28T23:06:04.8359613' AS DateTime2), NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, N'Coconut', 0, CAST(N'2021-08-29T19:31:43.2331343' AS DateTime2), NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (3, N'Tomato', 0, CAST(N'2021-08-29T19:31:46.1675446' AS DateTime2), NULL)
GO
INSERT [dbo].[Ingredients] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (4, N'Potato', 0, CAST(N'2021-08-29T19:31:56.1294183' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
INSERT [dbo].[NutritionRecipes] ([NutritionId], [RecipeId], [Amount]) VALUES (1, 8, 255)
GO
INSERT [dbo].[NutritionRecipes] ([NutritionId], [RecipeId], [Amount]) VALUES (2, 1, 30)
GO
INSERT [dbo].[NutritionRecipes] ([NutritionId], [RecipeId], [Amount]) VALUES (2, 6, 30)
GO
INSERT [dbo].[NutritionRecipes] ([NutritionId], [RecipeId], [Amount]) VALUES (2, 7, 25)
GO
SET IDENTITY_INSERT [dbo].[Nutritions] ON 
GO
INSERT [dbo].[Nutritions] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Kcal', 0, CAST(N'2021-08-28T23:01:53.5954755' AS DateTime2), NULL)
GO
INSERT [dbo].[Nutritions] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, N'Fat', 0, CAST(N'2021-08-29T03:37:08.4387512' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Nutritions] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 
GO
INSERT [dbo].[Recipes] ([Id], [Name], [Description], [Image], [Servings], [CookTime], [UserId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Recipe 1 EDIT', N'Description 1', N'image.jpg', 4, 33, 1, 0, CAST(N'2021-08-29T04:11:19.0683995' AS DateTime2), NULL)
GO
INSERT [dbo].[Recipes] ([Id], [Name], [Description], [Image], [Servings], [CookTime], [UserId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (6, N'Recipe 2 ', N'Description 1', N'image.jpg', 2, 23, 1, 0, CAST(N'2021-08-31T01:34:55.8222722' AS DateTime2), NULL)
GO
INSERT [dbo].[Recipes] ([Id], [Name], [Description], [Image], [Servings], [CookTime], [UserId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (7, N'Pancakes', N'Description 123', N'e0370028-41ae-4ca7-947e-54763acf93ba_Screenshot_3.png', 3, 35, 2, 0, CAST(N'2021-09-02T17:20:50.7581060' AS DateTime2), NULL)
GO
INSERT [dbo].[Recipes] ([Id], [Name], [Description], [Image], [Servings], [CookTime], [UserId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (8, N'Banana pancakes', N'Description 123', N'bd4332b4-35c7-4156-aa54-11d5617bb0a7_attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg', 3, 25, 8, 0, CAST(N'2021-09-02T17:47:06.8333921' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
SET IDENTITY_INSERT [dbo].[Steps] ON 
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Step 1', 1, 1, 0, CAST(N'2021-08-29T04:11:19.0684753' AS DateTime2), NULL)
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, N'Step 2', 2, 1, 0, CAST(N'2021-08-29T04:11:19.0684765' AS DateTime2), NULL)
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (8, N'Step 1', 1, 6, 0, CAST(N'2021-08-31T01:34:55.8223542' AS DateTime2), NULL)
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (9, N'Step 2', 2, 6, 0, CAST(N'2021-08-31T01:34:55.8223552' AS DateTime2), NULL)
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (10, N'Step 1', 1, 7, 0, CAST(N'2021-09-02T17:20:50.7581790' AS DateTime2), NULL)
GO
INSERT [dbo].[Steps] ([Id], [Text], [Order], [RecipeId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (11, N'Peel banana, then insert in pancake', 1, 8, 0, CAST(N'2021-09-02T17:47:06.8334862' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Steps] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2021-08-30T02:30:58.7435683' AS DateTime2), N'Search Categories EF', N'{"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2021-08-30T02:31:13.9611112' AS DateTime2), N'Search Category EF', N'1', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2021-08-30T02:34:29.0099698' AS DateTime2), N'Search Category EF', N'1', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2021-08-30T02:34:55.9048776' AS DateTime2), N'Search Category EF', N'2', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2021-08-30T02:34:58.0766879' AS DateTime2), N'Search Category EF', N'3', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2021-08-30T02:34:59.1075822' AS DateTime2), N'Search Category EF', N'4', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2021-08-30T03:55:03.1709703' AS DateTime2), N'Search Nutritions EF', N'{"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2021-08-30T03:55:21.2137525' AS DateTime2), N'Search Nutrition EF', N'5', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2021-08-30T03:55:34.9722249' AS DateTime2), N'Search Ingredients EF', N'{"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2021-08-30T04:56:51.9026932' AS DateTime2), N'Search Recipe EF', N'1', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2021-08-30T05:56:37.1320877' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2021-08-30T05:57:24.8344355' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"EDIT","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2021-08-30T05:57:28.2173185' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"EDIT1321","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2021-08-30T05:57:35.0514839' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2021-08-30T05:57:45.0454842' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"Deki","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2021-08-30T05:59:13.5197008' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"Deki","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2021-08-30T05:59:19.7375260' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"Dekic","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2021-08-30T05:59:21.6360359' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"Dekicc","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2021-08-30T05:59:26.5955630' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2021-08-30T05:59:33.9196561' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":"1","PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2021-08-30T05:59:50.5205039' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":3,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2021-08-30T05:59:52.7916068' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":333,"CookTimeMax":null,"CategoryIds":[],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2021-08-30T06:00:10.8081544' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[1],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2021-08-30T06:00:53.4757688' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[2],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2021-08-30T06:00:56.0402795' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[1],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2021-08-30T06:00:57.9077125' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[5],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2021-08-30T06:01:02.0347594' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[3],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2021-08-30T06:01:03.4011107' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[2],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2021-08-30T06:01:04.9423676' AS DateTime2), N'Search Recipes EF', N'{"ServingsMin":null,"ServingsMax":null,"CookTimeMin":null,"CookTimeMax":null,"CategoryIds":[1],"IngredientIds":[],"UserIds":[],"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2021-08-31T00:14:41.9762838' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2021-08-31T00:16:07.2679127' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2021-08-31T00:17:58.5148498' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2021-08-31T00:19:49.2009770' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2021-08-31T00:26:30.4387821' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2021-08-31T00:27:07.6087317' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2021-08-31T00:27:41.5403886' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2021-08-31T00:28:24.4972465' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2021-08-31T00:31:12.9111297' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2021-08-31T00:40:29.4080777' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 1 EDIT","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2021-08-31T00:40:59.7252148' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2021-08-31T00:42:18.8310241' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2021-08-31T00:44:33.9216251' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"50"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2021-08-31T00:46:28.8753703' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2021-08-31T00:50:04.0162452' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2021-08-31T00:51:02.1086502' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2021-08-31T00:54:51.3507555' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2021-08-31T00:55:26.6809465' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2021-08-31T00:55:43.0016607' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":1,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2021-08-31T00:57:47.5488998' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2021-08-31T01:01:53.0672777' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2021-08-31T01:03:23.2506155' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2021-08-31T01:04:58.7576393' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2021-08-31T01:11:22.9312163' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2021-08-31T01:19:01.0381466' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2021-08-31T01:20:04.2688432' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":1,"Name":null},{"Id":1,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2021-08-31T01:23:41.5259449' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2021-08-31T01:24:27.7788303' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2021-08-31T01:25:07.6641332' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":4.0,"CookTime":33,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":1,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2021-08-31T01:25:57.6457493' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2021-08-31T01:29:27.3876066' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":0,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2021-08-31T01:29:49.3371120' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":5,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2021-08-31T01:30:09.6707456' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":1,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2021-08-31T01:32:23.3217767' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":1,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2021-08-31T01:33:54.5891869' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":1,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2021-08-31T01:34:54.5720671' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Recipe 2 ","Description":"Description 1","Image":"image.jpg","Servings":2.0,"CookTime":23,"UserId":1,"Author":null,"Categories":[{"Id":2,"Name":null},{"Id":3,"Name":null}],"Ingredients":[{"Id":3,"Amount":"3"}],"Nutritions":[{"Id":2,"Amount":30.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0},{"Id":0,"Text":"Step 2","Order":2,"RecipeId":0}]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2021-08-31T05:59:28.4078204' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Sima","LastName":"Strahota","Email":"sima@sima.com","Password":"sifra1","ConfirmPassword":"sifra2","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2021-08-31T05:59:52.1246575' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Sima","LastName":"Strahota","Email":"sima@sima.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2021-08-31T06:05:35.5086642' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Sima","LastName":"Strahota","Email":"sima@sima.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2021-08-31T06:06:53.8077141' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Patak","LastName":"Daca","Email":"dejan.trivunovic.12.18@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2021-08-31T06:10:04.3963590' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Garfild","LastName":"Macak","Email":"garfild@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2021-08-31T06:12:15.8952977' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Garfild","LastName":"Macak","Email":"garfil1d@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2021-08-31T06:14:20.3451238' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Garfild","LastName":"Macak","Email":"garfil123d@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2021-08-31T06:15:15.6886783' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Garfild","LastName":"Macak","Email":"deki@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2021-08-31T06:15:58.2201574' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Garfild","LastName":"Macak","Email":"bauchanel@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2021-08-31T22:35:27.5062007' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'Fake Api Actor Admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2021-09-01T01:46:54.6103677' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Marko","LastName":"Markovic","Email":"marko@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2021-09-01T01:48:28.7424455' AS DateTime2), N'Create User EF', N'{"Id":0,"FirstName":"Marko","LastName":"Markovic","Email":"marko@gmail.com","Password":"sifra123","ConfirmPassword":"sifra123","AllowedUseCases":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2021-09-01T01:58:57.6732485' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2021-09-01T01:59:53.0707882' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2021-09-01T02:00:54.8480871' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'(8) Marko Markovic')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2021-09-01T02:05:59.1405669' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'(8) Marko Markovic')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2021-09-01T02:13:21.1492090' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":1}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2021-09-01T02:13:35.5614514' AS DateTime2), N'Search Logs EF', N'{"DateMin":null,"DateMax":null,"Actor":null,"Keyword":null,"PerPage":10,"Page":3}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2021-09-02T05:56:04.4495558' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2021-09-02T05:56:34.1429747' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2021-09-02T06:00:08.0475649' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2021-09-02T06:10:34.6884404' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2021-09-02T06:14:11.3282073' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2021-09-02T06:15:28.3935467' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2021-09-02T06:41:07.1911435' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"ImageFile":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2021-09-02T06:42:47.2202092' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"ImageFile":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2021-09-02T06:46:34.8037546' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2021-09-02T06:48:14.3263674' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2021-09-02T06:48:51.0533928' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2021-09-02T06:50:54.2557510' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2021-09-02T06:51:22.5962074' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2021-09-02T06:55:24.8720680' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2021-09-02T07:12:35.7006605' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":null,"Image":null,"Servings":4.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"5"}],"Nutritions":[{"Id":2,"Amount":5.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2021-09-02T07:18:54.4478165' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"ImageFile":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2021-09-02T07:19:16.1465278' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"ImageFile":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2021-09-02T07:19:48.5924968' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":null,"Description":null,"ImageFile":null,"Image":null,"Servings":0.0,"CookTime":0,"UserId":0,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2021-09-02T07:20:24.4711756' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2021-09-02T07:20:54.5303841' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2021-09-02T07:21:42.7645640' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2021-09-02T07:23:00.4902990' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2021-09-02T07:23:25.6751220' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"\"Pancakes\"","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2021-09-02T07:24:55.0051937' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2021-09-02T07:25:42.8338419' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2021-09-02T07:27:45.6359021' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2021-09-02T07:28:12.0661218' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2021-09-02T07:29:13.6877024' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2021-09-02T07:30:12.9872258' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2021-09-02T07:30:31.8878940' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2021-09-02T07:31:53.2590754' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2021-09-02T07:34:54.5944668' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2021-09-02T07:36:18.7453471' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2021-09-02T07:36:43.0969987' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2021-09-02T07:39:42.7645295' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2021-09-02T07:40:20.5238151' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2021-09-02T07:43:38.8277094' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2021-09-02T07:43:55.2757641' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2021-09-02T17:15:25.7437544' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2021-09-02T17:15:52.3083862' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2021-09-02T17:16:13.3494329' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2021-09-02T17:18:37.9619823' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2021-09-02T17:19:01.7675440' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":null,"ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[],"Ingredients":[{"Id":2,"Amount":"35"}],"Nutritions":[],"Steps":[]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2021-09-02T17:20:28.5523579' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"35"}],"Nutritions":[{"Id":2,"Amount":0.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2021-09-02T17:20:50.6623526' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"Screenshot_3.png\""],"Content-Type":["image/png"]},"Length":260157,"Name":"ImageFile","FileName":"Screenshot_3.png"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"35"}],"Nutritions":[{"Id":2,"Amount":25.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2021-09-02T17:39:08.9015787' AS DateTime2), N'Update Recipe EF', N'{"Id":7,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\""],"Content-Type":["image/jpeg"]},"Length":98385,"Name":"ImageFile","FileName":"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg"},"Image":null,"Servings":3.0,"CookTime":35,"UserId":2,"Author":null,"Categories":[{"Id":2,"Name":null}],"Ingredients":[{"Id":2,"Amount":"35"}],"Nutritions":[{"Id":2,"Amount":25.0}],"Steps":[{"Id":0,"Text":"Step 1","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2021-09-02T17:46:40.7494358' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\""],"Content-Type":["image/jpeg"]},"Length":98385,"Name":"ImageFile","FileName":"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg"},"Image":null,"Servings":3.0,"CookTime":25,"UserId":8,"Author":null,"Categories":[{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"200 grams"}],"Nutritions":[{"Id":1,"Amount":255.0}],"Steps":[{"Id":0,"Text":"Peel banana, then insert in pancake","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2021-09-02T17:47:06.8053306' AS DateTime2), N'Create Recipe EF', N'{"Id":0,"Name":"Banana pancakes","Description":"Description 123","ImageFile":{"ContentDisposition":"form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"ImageFile\"; filename=\"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg\""],"Content-Type":["image/jpeg"]},"Length":98385,"Name":"ImageFile","FileName":"attachment-richard-pasquarella-rqnfxdgxoba-unsplash.jpg"},"Image":null,"Servings":3.0,"CookTime":25,"UserId":8,"Author":null,"Categories":[{"Id":3,"Name":null}],"Ingredients":[{"Id":2,"Amount":"200 grams"}],"Nutritions":[{"Id":1,"Amount":255.0}],"Steps":[{"Id":0,"Text":"Peel banana, then insert in pancake","Order":1,"RecipeId":0}]}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2021-09-02T18:15:50.3713595' AS DateTime2), N'Create Category EF', N'{"Id":0,"Name":"Desert"}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2021-09-02T18:16:38.1208894' AS DateTime2), N'Create Category EF', N'{"Id":0,"Name":"Salads"}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2021-09-02T18:21:09.1021432' AS DateTime2), N'Create Category EF', N'{"Id":0,"Name":"Salads"}', N'Unauthorized Actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2021-09-02T18:21:27.0051488' AS DateTime2), N'Update Category EF', N'{"Id":3,"Name":"Salads"}', N'Unauthorized Actor')
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, N'Deki', N'Dekic', N'deki@gmail.com', N'sifra1', 0, CAST(N'2021-08-29T03:51:30.7966667' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, N'Sima', N'Strahota', N'sima@sima.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T05:59:52.1825058' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (3, N'Patak', N'Daca', N'dejan.trivunovic.12.18@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T06:06:53.9037190' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (4, N'Garfild', N'Macak', N'garfild@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T06:10:05.5594945' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (5, N'Garfild', N'Macak', N'garfil1d@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T06:12:15.9046808' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (6, N'Garfild', N'Macak', N'garfil123d@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T06:14:20.3576363' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (7, N'Garfild', N'Macak', N'bauchanel@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-08-31T06:15:58.2308757' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (8, N'Marko', N'Markovic', N'marko@gmail.com', N'566A489658425A07B32ED07C34D7A25CB4C3B16947799FDAE2E8A9715CFCE412', 0, CAST(N'2021-09-01T01:48:30.1075968' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCase] ON 
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (1, 2, 10, 0, CAST(N'2021-08-31T05:59:52.1824377' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (2, 2, 11, 0, CAST(N'2021-08-31T05:59:52.1825069' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (3, 2, 12, 0, CAST(N'2021-08-31T05:59:52.1825073' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (4, 2, 13, 0, CAST(N'2021-08-31T05:59:52.1825076' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (5, 2, 14, 0, CAST(N'2021-08-31T05:59:52.1825079' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (6, 2, 15, 0, CAST(N'2021-08-31T05:59:52.1825083' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (7, 2, 16, 0, CAST(N'2021-08-31T05:59:52.1825086' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (8, 2, 17, 0, CAST(N'2021-08-31T05:59:52.1825090' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (9, 2, 18, 0, CAST(N'2021-08-31T05:59:52.1825093' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (10, 2, 19, 0, CAST(N'2021-08-31T05:59:52.1825097' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (11, 2, 20, 0, CAST(N'2021-08-31T05:59:52.1825100' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (12, 3, 10, 0, CAST(N'2021-08-31T06:06:53.9036487' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (13, 3, 11, 0, CAST(N'2021-08-31T06:06:53.9037200' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (14, 3, 12, 0, CAST(N'2021-08-31T06:06:53.9037204' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (15, 3, 13, 0, CAST(N'2021-08-31T06:06:53.9037207' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (16, 3, 14, 0, CAST(N'2021-08-31T06:06:53.9037211' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (17, 3, 15, 0, CAST(N'2021-08-31T06:06:53.9037215' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (18, 3, 16, 0, CAST(N'2021-08-31T06:06:53.9037218' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (19, 3, 17, 0, CAST(N'2021-08-31T06:06:53.9037222' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (20, 3, 18, 0, CAST(N'2021-08-31T06:06:53.9037225' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (21, 3, 19, 0, CAST(N'2021-08-31T06:06:53.9037229' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (22, 3, 20, 0, CAST(N'2021-08-31T06:06:53.9037233' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (23, 4, 10, 0, CAST(N'2021-08-31T06:10:05.5594258' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (24, 4, 11, 0, CAST(N'2021-08-31T06:10:05.5594956' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (25, 4, 12, 0, CAST(N'2021-08-31T06:10:05.5594960' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (26, 4, 13, 0, CAST(N'2021-08-31T06:10:05.5594964' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (27, 4, 14, 0, CAST(N'2021-08-31T06:10:05.5594967' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (28, 4, 15, 0, CAST(N'2021-08-31T06:10:05.5594971' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (29, 4, 16, 0, CAST(N'2021-08-31T06:10:05.5594974' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (30, 4, 17, 0, CAST(N'2021-08-31T06:10:05.5594978' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (31, 4, 18, 0, CAST(N'2021-08-31T06:10:05.5594981' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (32, 4, 19, 0, CAST(N'2021-08-31T06:10:05.5594985' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (33, 4, 20, 0, CAST(N'2021-08-31T06:10:05.5594989' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (34, 5, 10, 0, CAST(N'2021-08-31T06:12:15.9046777' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (35, 5, 11, 0, CAST(N'2021-08-31T06:12:15.9046812' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (36, 5, 12, 0, CAST(N'2021-08-31T06:12:15.9046816' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (37, 5, 13, 0, CAST(N'2021-08-31T06:12:15.9046819' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (38, 5, 14, 0, CAST(N'2021-08-31T06:12:15.9046823' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (39, 5, 15, 0, CAST(N'2021-08-31T06:12:15.9046826' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (40, 5, 16, 0, CAST(N'2021-08-31T06:12:15.9046830' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (41, 5, 17, 0, CAST(N'2021-08-31T06:12:15.9046834' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (42, 5, 18, 0, CAST(N'2021-08-31T06:12:15.9046837' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (43, 5, 19, 0, CAST(N'2021-08-31T06:12:15.9046841' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (44, 5, 20, 0, CAST(N'2021-08-31T06:12:15.9046845' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (45, 6, 10, 0, CAST(N'2021-08-31T06:14:20.3576180' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (46, 6, 11, 0, CAST(N'2021-08-31T06:14:20.3576367' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (47, 6, 12, 0, CAST(N'2021-08-31T06:14:20.3576371' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (48, 6, 13, 0, CAST(N'2021-08-31T06:14:20.3576375' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (49, 6, 14, 0, CAST(N'2021-08-31T06:14:20.3576378' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (50, 6, 15, 0, CAST(N'2021-08-31T06:14:20.3576382' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (51, 6, 16, 0, CAST(N'2021-08-31T06:14:20.3576385' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (52, 6, 17, 0, CAST(N'2021-08-31T06:14:20.3576389' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (53, 6, 18, 0, CAST(N'2021-08-31T06:14:20.3576393' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (54, 6, 19, 0, CAST(N'2021-08-31T06:14:20.3576396' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (55, 6, 20, 0, CAST(N'2021-08-31T06:14:20.3576400' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (56, 7, 10, 0, CAST(N'2021-08-31T06:15:58.2308546' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (57, 7, 11, 0, CAST(N'2021-08-31T06:15:58.2308888' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (58, 7, 12, 0, CAST(N'2021-08-31T06:15:58.2309018' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (59, 7, 13, 0, CAST(N'2021-08-31T06:15:58.2309127' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (60, 7, 14, 0, CAST(N'2021-08-31T06:15:58.2309227' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (61, 7, 15, 0, CAST(N'2021-08-31T06:15:58.2309321' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (62, 7, 16, 0, CAST(N'2021-08-31T06:15:58.2309414' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (63, 7, 17, 0, CAST(N'2021-08-31T06:15:58.2309511' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (64, 7, 18, 0, CAST(N'2021-08-31T06:15:58.2309592' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (65, 7, 19, 0, CAST(N'2021-08-31T06:15:58.2309672' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (66, 7, 20, 0, CAST(N'2021-08-31T06:15:58.2309762' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (67, 8, 10, 0, CAST(N'2021-09-01T01:48:30.1075131' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (68, 8, 11, 0, CAST(N'2021-09-01T01:48:30.1075979' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (69, 8, 12, 0, CAST(N'2021-09-01T01:48:30.1075983' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (70, 8, 13, 0, CAST(N'2021-09-01T01:48:30.1075987' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (71, 8, 14, 0, CAST(N'2021-09-01T01:48:30.1075990' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (72, 8, 15, 0, CAST(N'2021-09-01T01:48:30.1075994' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (73, 8, 16, 0, CAST(N'2021-09-01T01:48:30.1075998' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (74, 8, 17, 0, CAST(N'2021-09-01T01:48:30.1076001' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (75, 8, 18, 0, CAST(N'2021-09-01T01:48:30.1076005' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (76, 8, 19, 0, CAST(N'2021-09-01T01:48:30.1076008' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (77, 8, 20, 0, CAST(N'2021-09-01T01:48:30.1076012' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (82, 8, 24, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (83, 8, 1, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (84, 8, 2, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (87, 8, 3, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (88, 8, 4, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (89, 8, 5, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (90, 8, 6, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (91, 8, 7, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (92, 8, 8, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (93, 8, 9, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (94, 8, 21, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (95, 8, 22, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (96, 8, 23, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[UserUseCase] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryRecipes_RecipeId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryRecipes_RecipeId] ON [dbo].[CategoryRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngredientRecipes_RecipeId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_IngredientRecipes_RecipeId] ON [dbo].[IngredientRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ingredients_Name]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ingredients_Name] ON [dbo].[Ingredients]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NutritionRecipes_RecipeId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_NutritionRecipes_RecipeId] ON [dbo].[NutritionRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Nutritions_Name]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nutritions_Name] ON [dbo].[Nutritions]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recipes_Name]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Recipes_Name] ON [dbo].[Recipes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recipes_UserId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Recipes_UserId] ON [dbo].[Recipes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Steps_RecipeId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Steps_RecipeId] ON [dbo].[Steps]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCase_UserId]    Script Date: 9/2/2021 6:26:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCase_UserId] ON [dbo].[UserUseCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryRecipes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryRecipes_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryRecipes] CHECK CONSTRAINT [FK_CategoryRecipes_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategoryRecipes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryRecipes_Recipes_RecipeId] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[CategoryRecipes] CHECK CONSTRAINT [FK_CategoryRecipes_Recipes_RecipeId]
GO
ALTER TABLE [dbo].[IngredientRecipes]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRecipes_Ingredients_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([Id])
GO
ALTER TABLE [dbo].[IngredientRecipes] CHECK CONSTRAINT [FK_IngredientRecipes_Ingredients_IngredientId]
GO
ALTER TABLE [dbo].[IngredientRecipes]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRecipes_Recipes_RecipeId] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[IngredientRecipes] CHECK CONSTRAINT [FK_IngredientRecipes_Recipes_RecipeId]
GO
ALTER TABLE [dbo].[NutritionRecipes]  WITH CHECK ADD  CONSTRAINT [FK_NutritionRecipes_Nutritions_NutritionId] FOREIGN KEY([NutritionId])
REFERENCES [dbo].[Nutritions] ([Id])
GO
ALTER TABLE [dbo].[NutritionRecipes] CHECK CONSTRAINT [FK_NutritionRecipes_Nutritions_NutritionId]
GO
ALTER TABLE [dbo].[NutritionRecipes]  WITH CHECK ADD  CONSTRAINT [FK_NutritionRecipes_Recipes_RecipeId] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([Id])
GO
ALTER TABLE [dbo].[NutritionRecipes] CHECK CONSTRAINT [FK_NutritionRecipes_Recipes_RecipeId]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Users_UserId]
GO
ALTER TABLE [dbo].[Steps]  WITH CHECK ADD  CONSTRAINT [FK_Steps_Recipes_RecipeId] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Steps] CHECK CONSTRAINT [FK_Steps_Recipes_RecipeId]
GO
ALTER TABLE [dbo].[UserUseCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCase] CHECK CONSTRAINT [FK_UserUseCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Recipes] SET  READ_WRITE 
GO
