
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/16/2023 10:17:24
-- Generated from EDMX file: C:\Users\AHMET GUVEN\Desktop\htmlCss örnekler\ModelFirstWebsite_Plaza\ModelFirstWebsite_Plaza\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Plaza];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PlazaCompany]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompanySet] DROP CONSTRAINT [FK_PlazaCompany];
GO
IF OBJECT_ID(N'[dbo].[FK_CompanyDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DepartmentSet] DROP CONSTRAINT [FK_CompanyDepartment];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentPersonnel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonnelSet] DROP CONSTRAINT [FK_DepartmentPersonnel];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PlazaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlazaSet];
GO
IF OBJECT_ID(N'[dbo].[CompanySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanySet];
GO
IF OBJECT_ID(N'[dbo].[DepartmentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DepartmentSet];
GO
IF OBJECT_ID(N'[dbo].[PersonnelSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonnelSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PlazaSet'
CREATE TABLE [dbo].[PlazaSet] (
    [PlazaNo] int IDENTITY(1,1) NOT NULL,
    [PlazaName] nvarchar(max)  NOT NULL,
    [PlazaAdress] nvarchar(max)  NOT NULL,
    [CompanyPhone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CompanySet'
CREATE TABLE [dbo].[CompanySet] (
    [CompanyNo] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [CompanyAdress] nvarchar(max)  NOT NULL,
    [CompanyPhone] nvarchar(max)  NOT NULL,
    [PlazaPlazaNo] int  NOT NULL
);
GO

-- Creating table 'DepartmentSet'
CREATE TABLE [dbo].[DepartmentSet] (
    [DepartmentNo] int IDENTITY(1,1) NOT NULL,
    [DepartmentName] nvarchar(max)  NOT NULL,
    [DepartmentAdress] nvarchar(max)  NOT NULL,
    [DepartmentPhone] nvarchar(max)  NOT NULL,
    [CompanyCompanyNo] int  NOT NULL
);
GO

-- Creating table 'PersonnelSet'
CREATE TABLE [dbo].[PersonnelSet] (
    [PersonnelNo] int IDENTITY(1,1) NOT NULL,
    [PersonnelName] nvarchar(max)  NOT NULL,
    [PersonnelAdress] nvarchar(max)  NOT NULL,
    [PersonnelPhone] nvarchar(max)  NOT NULL,
    [DepartmentDepartmentNo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PlazaNo] in table 'PlazaSet'
ALTER TABLE [dbo].[PlazaSet]
ADD CONSTRAINT [PK_PlazaSet]
    PRIMARY KEY CLUSTERED ([PlazaNo] ASC);
GO

-- Creating primary key on [CompanyNo] in table 'CompanySet'
ALTER TABLE [dbo].[CompanySet]
ADD CONSTRAINT [PK_CompanySet]
    PRIMARY KEY CLUSTERED ([CompanyNo] ASC);
GO

-- Creating primary key on [DepartmentNo] in table 'DepartmentSet'
ALTER TABLE [dbo].[DepartmentSet]
ADD CONSTRAINT [PK_DepartmentSet]
    PRIMARY KEY CLUSTERED ([DepartmentNo] ASC);
GO

-- Creating primary key on [PersonnelNo] in table 'PersonnelSet'
ALTER TABLE [dbo].[PersonnelSet]
ADD CONSTRAINT [PK_PersonnelSet]
    PRIMARY KEY CLUSTERED ([PersonnelNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PlazaPlazaNo] in table 'CompanySet'
ALTER TABLE [dbo].[CompanySet]
ADD CONSTRAINT [FK_PlazaCompany]
    FOREIGN KEY ([PlazaPlazaNo])
    REFERENCES [dbo].[PlazaSet]
        ([PlazaNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlazaCompany'
CREATE INDEX [IX_FK_PlazaCompany]
ON [dbo].[CompanySet]
    ([PlazaPlazaNo]);
GO

-- Creating foreign key on [CompanyCompanyNo] in table 'DepartmentSet'
ALTER TABLE [dbo].[DepartmentSet]
ADD CONSTRAINT [FK_CompanyDepartment]
    FOREIGN KEY ([CompanyCompanyNo])
    REFERENCES [dbo].[CompanySet]
        ([CompanyNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyDepartment'
CREATE INDEX [IX_FK_CompanyDepartment]
ON [dbo].[DepartmentSet]
    ([CompanyCompanyNo]);
GO

-- Creating foreign key on [DepartmentDepartmentNo] in table 'PersonnelSet'
ALTER TABLE [dbo].[PersonnelSet]
ADD CONSTRAINT [FK_DepartmentPersonnel]
    FOREIGN KEY ([DepartmentDepartmentNo])
    REFERENCES [dbo].[DepartmentSet]
        ([DepartmentNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentPersonnel'
CREATE INDEX [IX_FK_DepartmentPersonnel]
ON [dbo].[PersonnelSet]
    ([DepartmentDepartmentNo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------