USE [master]
GO
/****** Object:  Database [Recipes]    Script Date: 9/3/2021 5:51:59 AM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[CategoryRecipes]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[IngredientRecipes]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Ingredients]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[NutritionRecipes]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Nutritions]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Recipes]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Steps]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 9/3/2021 5:52:00 AM ******/
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
/****** Object:  Table [dbo].[UserUseCase]    Script Date: 9/3/2021 5:52:00 AM ******/
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
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (8, N'Salads', 0, CAST(N'2021-09-03T05:06:33.4668289' AS DateTime2), NULL)
GO
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (9, N'Pizza', 0, CAST(N'2021-09-03T05:15:11.9118617' AS DateTime2), NULL)
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
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (97, 8, 25, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [IsDeleted], [CreatedAt], [DeletedAt]) VALUES (98, 8, 26, 0, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[UserUseCase] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryRecipes_RecipeId]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryRecipes_RecipeId] ON [dbo].[CategoryRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngredientRecipes_RecipeId]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_IngredientRecipes_RecipeId] ON [dbo].[IngredientRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ingredients_Name]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ingredients_Name] ON [dbo].[Ingredients]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NutritionRecipes_RecipeId]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_NutritionRecipes_RecipeId] ON [dbo].[NutritionRecipes]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Nutritions_Name]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nutritions_Name] ON [dbo].[Nutritions]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recipes_Name]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Recipes_Name] ON [dbo].[Recipes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recipes_UserId]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_Recipes_UserId] ON [dbo].[Recipes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Steps_RecipeId]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_Steps_RecipeId] ON [dbo].[Steps]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 9/3/2021 5:52:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCase_UserId]    Script Date: 9/3/2021 5:52:00 AM ******/
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
