USE [master]
GO
/****** Object:  Database [Dictionary]    Script Date: 21.08.2014 г. 08:57:15 ******/
CREATE DATABASE [Dictionary]
GO
ALTER DATABASE [Dictionary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dictionary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dictionary] SET  MULTI_USER 
GO
ALTER DATABASE [Dictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Dictionary] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Dictionary]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartOfSpeechTypes]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfSpeechTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartOfSpeechTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordId] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PartOfSpeechTypeId] [int] NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Antonyms]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Antonyms](
	[WordId] [int] NOT NULL,
	[AntonymId] [int] NOT NULL,
 CONSTRAINT [PK_Words_Antonyms] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[AntonymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Explanations]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Explanations](
	[WordId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Explanation] [nvarchar](300) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Hyponyms]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Hyponyms](
	[WordId] [int] NOT NULL,
	[HyponymId] [int] NOT NULL,
 CONSTRAINT [PK_Words_Hyponyms] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[HyponymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Synonyms]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Synonyms](
	[WordId] [int] NOT NULL,
	[SynonymId] [int] NOT NULL,
 CONSTRAINT [PK_Words_Synonyms] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[SynonymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words_Translations]    Script Date: 21.08.2014 г. 08:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words_Translations](
	[WordId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
 CONSTRAINT [PK_Words_Translations] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (1, N'Bulgarian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (2, N'English')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (3, N'Russian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (4, N'French')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (5, N'German')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (6, N'Italian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (7, N'Ukrainian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (8, N'British English')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (9, N'Turkish')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[PartOfSpeechTypes] ON 

INSERT [dbo].[PartOfSpeechTypes] ([TypeId], [Type]) VALUES (1, N'verb')
INSERT [dbo].[PartOfSpeechTypes] ([TypeId], [Type]) VALUES (2, N'noun')
INSERT [dbo].[PartOfSpeechTypes] ([TypeId], [Type]) VALUES (3, N'adjective')
SET IDENTITY_INSERT [dbo].[PartOfSpeechTypes] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (1, N'conspire', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (2, N'plan', 2, 2)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (3, N'core', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (4, N'center', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (5, N'fume', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (6, N'gas', 2, 2)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (7, N'smoke', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (8, N'gaudy', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (9, N'garish', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (10, N'flashy', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (11, N'showy', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (12, N'brook', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (13, N'stream', 2, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (14, N'среда', 1, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (15, N'център', 1, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (16, N'ядро', 1, 2)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (17, N'центр', 3, NULL)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (18, N'середина', 3, 2)
INSERT [dbo].[Words] ([WordId], [Word], [LanguageId], [PartOfSpeechTypeId]) VALUES (19, N'ось', 3, NULL)
SET IDENTITY_INSERT [dbo].[Words] OFF
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (1, 2, N'to secretly plan with someone to do something that is harmful or illegal')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (1, 2, N'to happen in a way that produces bad or unpleasant results')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (2, 2, N'a set of actions that have been thought of as a way to do or achieve something')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (2, 2, N'something that a person intends to do')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (2, 2, N'a detailed agreement for telephone service, medical care, insurance, etc.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (2, 1, N'Предварително обмислен ред за извършване на нещо, срок за изпълнението му. План за действие. Календарен план.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (2, 1, N'Кратко набелязване на съдържанието на нещо. План на изказване. План на роман. План конспект.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (1, 1, N'Организиране на нелегална дейност. Занимавам се с конспирация.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (1, 1, N'Запазване в тайна, прикриване на някаква дейност или проява. За конспирация излязох на разходка.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (15, 1, N'Точка, която е еднаквоотдалечена от всички точки на окръжност или кълбо.')
INSERT [dbo].[Words_Explanations] ([WordId], [LanguageId], [Explanation]) VALUES (15, 2, N'the middle point or part of something')
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (1, 2)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (3, 4)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (5, 6)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (5, 7)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (6, 7)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (8, 9)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (8, 10)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (8, 11)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (9, 10)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (9, 11)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (10, 11)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (12, 13)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (14, 15)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (14, 16)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (15, 16)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (17, 18)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (17, 19)
INSERT [dbo].[Words_Synonyms] ([WordId], [SynonymId]) VALUES (18, 19)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (3, 14)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (3, 15)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (3, 16)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (4, 14)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (4, 15)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (4, 16)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (14, 17)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (14, 18)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (14, 19)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (15, 17)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (15, 18)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (15, 19)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (16, 17)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (16, 18)
INSERT [dbo].[Words_Translations] ([WordId], [TranslationId]) VALUES (16, 19)
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_PartOfSpeechTypes] FOREIGN KEY([PartOfSpeechTypeId])
REFERENCES [dbo].[PartOfSpeechTypes] ([TypeId])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_PartOfSpeechTypes]
GO
ALTER TABLE [dbo].[Words_Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Antonyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Antonyms] CHECK CONSTRAINT [FK_Words_Antonyms_Words]
GO
ALTER TABLE [dbo].[Words_Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Antonyms_Words1] FOREIGN KEY([AntonymId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Antonyms] CHECK CONSTRAINT [FK_Words_Antonyms_Words1]
GO
ALTER TABLE [dbo].[Words_Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Explanations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Words_Explanations] CHECK CONSTRAINT [FK_Words_Explanations_Languages]
GO
ALTER TABLE [dbo].[Words_Explanations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Explanations_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Explanations] CHECK CONSTRAINT [FK_Words_Explanations_Words]
GO
ALTER TABLE [dbo].[Words_Hyponyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hyponyms_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Hyponyms] CHECK CONSTRAINT [FK_Words_Hyponyms_Words]
GO
ALTER TABLE [dbo].[Words_Hyponyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hyponyms_Words1] FOREIGN KEY([HyponymId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Hyponyms] CHECK CONSTRAINT [FK_Words_Hyponyms_Words1]
GO
ALTER TABLE [dbo].[Words_Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Synonyms_Words_1] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Synonyms] CHECK CONSTRAINT [FK_Words_Synonyms_Words_1]
GO
ALTER TABLE [dbo].[Words_Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Words_Synonyms_Words_2] FOREIGN KEY([SynonymId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Synonyms] CHECK CONSTRAINT [FK_Words_Synonyms_Words_2]
GO
ALTER TABLE [dbo].[Words_Translations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Translations_Words] FOREIGN KEY([WordId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Translations] CHECK CONSTRAINT [FK_Words_Translations_Words]
GO
ALTER TABLE [dbo].[Words_Translations]  WITH CHECK ADD  CONSTRAINT [FK_Words_Translations_Words_2] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Words] ([WordId])
GO
ALTER TABLE [dbo].[Words_Translations] CHECK CONSTRAINT [FK_Words_Translations_Words_2]
GO
USE [master]
GO
ALTER DATABASE [Dictionary] SET  READ_WRITE 
GO
