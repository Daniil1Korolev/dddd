set ansi_nulls on

go
set ansi_padding on
go
set quoted_identifier on

go
create database [cesarShop]
go
use [cesarShop]
go


CREATE TABLE [dbo].[Role]
(
 [ID_Role] int not null identity(1,1) ,
 [Role]    varchar(15) not null ,

 constraint [UQ_Role] unique ([Role]),
 constraint [PK_Role] primary key clustered ([ID_Role] ASC)
);
GO

insert into [dbo].[Role] ([Role])
values('Пользователь'),
('Администратор')
go

CREATE TABLE [dbo].[Product_Category]
(
 [ID_PC] int not null identity(1,1) ,
 [Category]    varchar(15) not null ,

 constraint [UQ_PC] unique ([Category]),
 constraint [PK_PC] primary key clustered ([ID_PC] ASC)
);
GO

insert into [dbo].[Product_Category] ([Category])
values('Продукт'),
('Топинг')
go

CREATE TABLE [dbo].[Card]
(
 [ID_Card] int not null identity(1,1) ,
 [Card]    varchar(50) not null ,
 [Discount]    int not null,

 constraint [UQ_Card] unique ([Card]),
 constraint [PK_Card] primary key clustered ([ID_Card] ASC)
);
GO

insert into [dbo].[Card] ([Card],[Discount])
values('-',0),
('Бронзовая',5),
('Серебрянная',10),
('Золотая',20)
go

CREATE TABLE [dbo].[User]
(
 [ID_User] int not null identity(1,1),
 [Login_User] varchar(25) not null,
 [Password_User] varchar(25) not null,
 [Balance] int not null,
 [Role_ID] int not null,
 [Card_ID] int not null,

 constraint [UQ_Login] unique ([Login_User]),
 constraint [PK_User] primary key clustered ([ID_User] ASC),
 constraint [FK_Role] foreign key ([Role_ID])  references [dbo].[Role]([ID_Role]),
 constraint [FK_Card] foreign key ([Card_ID])  references [dbo].[Card]([ID_Card])
);
GO

CREATE TABLE [dbo].[Product]
(
 [ID_Product] int not null identity(1,1),
 [Product] varchar(50) not null ,
 [Quality] int not null ,
 [Cost_TP] int not null ,
 [PC_ID] int not null,

 constraint [UQ_Product] unique ([Product]),
 constraint [PK_Product] primary key clustered ([ID_Product] ASC),
 constraint [FK_PC] foreign key ([PC_ID])  references [dbo].[Product_Category]([ID_PC])
);
GO

select SUM([Cost_Order]) from [dbo].[Order] WHERE [User_ID] = 2

CREATE TABLE [dbo].[Order]
(
 [ID_Order] int not null identity(1,1),
 [Cost_Order] int not null ,
 [DateTime_Order] datetime not null ,
 [User_ID] int not null 

 constraint [PK_Order] primary key clustered ([ID_Order] ASC),
 constraint [FK_User]  foreign key ([User_ID])  references [dbo].[User]([ID_User])
);
GO

select * from  [dbo].[Order]

insert into [dbo].[User] ([Login_User],[Password_User],[Balance],[Role_ID],[Card_ID]) 
values ('admin','admin',50000,2,1)
