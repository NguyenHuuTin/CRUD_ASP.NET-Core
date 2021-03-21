USE [master]
GO
/****** Object:  Database [DemoCRUD.]    Script Date: 3/21/2021 4:30:24 PM ******/
CREATE DATABASE [DemoCRUD.]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoCRUD.', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoCRUD..mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoCRUD._log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoCRUD._log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoCRUD.] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoCRUD.].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoCRUD.] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoCRUD.] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoCRUD.] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoCRUD.] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoCRUD.] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoCRUD.] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoCRUD.] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoCRUD.] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoCRUD.] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoCRUD.] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoCRUD.] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoCRUD.] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoCRUD.] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoCRUD.] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoCRUD.] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoCRUD.] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoCRUD.] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoCRUD.] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoCRUD.] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoCRUD.] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoCRUD.] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoCRUD.] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoCRUD.] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoCRUD.] SET  MULTI_USER 
GO
ALTER DATABASE [DemoCRUD.] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoCRUD.] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoCRUD.] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoCRUD.] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoCRUD.] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoCRUD.] SET QUERY_STORE = OFF
GO
USE [DemoCRUD.]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 3/21/2021 4:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[Sr_no] [int] IDENTITY(1,1) NOT NULL,
	[Emp_name] [nvarchar](500) NULL,
	[City] [nvarchar](500) NULL,
	[STATE] [nvarchar](500) NULL,
	[Country] [nvarchar](500) NULL,
	[Department] [nvarchar](500) NULL,
	[flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[Sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Employee]    Script Date: 3/21/2021 4:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Employee]
@Sr_no int , @Emp_name nvarchar(500),
@City nvarchar(500), @STATE nvarchar(500),
@Country nvarchar(500), @Department nvarchar(500),
@flag nvarchar(50)
AS begin
	if(@flag = 'insert')
	begin
		insert into dbo.tbl_Employee
		(Emp_name, City, STATE, country, Department)
		values
		(@Emp_name, @City, @STATE, @Country, @Department)
	end
	else if(@flag = 'update')
	begin
		update dbo.tbl_Employee set Emp_name = @Emp_name, City = @City,
		STATE = @STATE, Country = @Country, Department = @Department
		where Sr_no = @Sr_no
	end
	else if(@flag = 'delete')
	begin
		delete from dbo.tbl_Employee where Sr_no = @Sr_no
	end
	else if(@flag = 'getid')
	begin
		select * from tbl_Employee where Sr_no = @Sr_no
	end
	else if(@flag = 'get')
	begin
		select * from tbl_Employee
	end
end
GO
USE [master]
GO
ALTER DATABASE [DemoCRUD.] SET  READ_WRITE 
GO
