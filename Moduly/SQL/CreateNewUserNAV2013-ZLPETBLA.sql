/* Script na vytvoýen¡ u§ivatele do datab ze NAV 2013 */

/* Deklarace */
DECLARE @SID as uniqueidentifier;
DECLARE @UserName as nvarchar(50);
DECLARE @WinSecID as nvarchar(119);
DECLARE @CompName as nvarchar(30);


-- Database Name
  USE DINOTOYS;
-- User Security ID
  SET @SID = '4f40ed43-ff66-4111-98f0-a5131d25ae08';
-- User Name
  SET @UserName = 'ZLPETBLA\PETR';
-- Windows Security ID 
  SET @WinSecID = 'S-1-5-21-3756680473-1538492385-1397906643-1001';
-- Comapane Name
  SET @CompName = '';

/* Vytvoýen¡ u§ivatele */  

INSERT INTO [dbo].[User]
           ([User Security ID]
           ,[User Name]
           ,[Full Name]
           ,[State]
           ,[Expiry Date]
           ,[Windows Security ID]
           ,[Change Password]                                       
           ,[License Type])
     VALUES
           (@SID  
           ,@UserName
           ,''
           ,0
           ,'1753-01-01 00:00:00.000'
           ,@WinSecID
           ,0
           ,0)
INSERT INTO [dbo].[User Property]
           ([User Security ID]
           ,[Password]
           ,[Name Identifier]
           ,[Authentication Key]
           ,[WebServices Key]
           ,[WebServices Key Expiry Date])
     VALUES
           (@SID
           ,''
           ,''
           ,''
           ,''
           ,'1753-01-01 00:00:00.000')
INSERT INTO [dbo].[User Personalization]
           ([User SID]
           ,[Profile ID]
           ,[Language ID]
           ,[Company]
           ,[Debugger Break On Error]
           ,[Debugger Break On Rec Changes]
           ,[Debugger Skip System Triggers])
     VALUES
           (@SID
           ,''
           ,1029
           ,@CompName
           ,1
           ,0
           ,1)
INSERT INTO [dbo].[Access Control]
           ([User Security ID]
           ,[Role ID]
           ,[Company Name])
     VALUES
           (@SID
           ,'SUPER'
           ,'')
           
          