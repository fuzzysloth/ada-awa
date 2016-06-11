-----------------------------------------------------------------------
--  AWA.Workspaces.Models -- AWA.Workspaces.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2016 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
pragma Warnings (Off);
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with Ada.Calendar;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
with AWA.Users.Models;
pragma Warnings (On);
package AWA.Workspaces.Models is

   pragma Style_Checks ("-mr");

   type Workspace_Ref is new ADO.Objects.Object_Ref with null record;

   type Workspace_Feature_Ref is new ADO.Objects.Object_Ref with null record;

   type Workspace_Member_Ref is new ADO.Objects.Object_Ref with null record;

   --  --------------------
   --  The workspace controls the features available in the application
   --  for a set of users: the workspace members.  A user could create
   --  several workspaces and be part of several workspaces that other
   --  users have created.
   --  --------------------
   --  Create an object key for Workspace.
   function Workspace_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Workspace from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Workspace_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Workspace : constant Workspace_Ref;
   function "=" (Left, Right : Workspace_Ref'Class) return Boolean;

   --  Set the workspace identifier
   procedure Set_Id (Object : in out Workspace_Ref;
                     Value  : in ADO.Identifier);

   --  Get the workspace identifier
   function Get_Id (Object : in Workspace_Ref)
                 return ADO.Identifier;
   --
   function Get_Version (Object : in Workspace_Ref)
                 return Integer;

   --
   procedure Set_Create_Date (Object : in out Workspace_Ref;
                              Value  : in Ada.Calendar.Time);

   --
   function Get_Create_Date (Object : in Workspace_Ref)
                 return Ada.Calendar.Time;

   --
   procedure Set_Owner (Object : in out Workspace_Ref;
                        Value  : in AWA.Users.Models.User_Ref'Class);

   --
   function Get_Owner (Object : in Workspace_Ref)
                 return AWA.Users.Models.User_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Workspace_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Workspace_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Workspace_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Workspace_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Workspace_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Workspace_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   WORKSPACE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Workspace_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Workspace_Ref;
                   Into   : in out Workspace_Ref);

   --  Create an object key for Workspace_Feature.
   function Workspace_Feature_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Workspace_Feature from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Workspace_Feature_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Workspace_Feature : constant Workspace_Feature_Ref;
   function "=" (Left, Right : Workspace_Feature_Ref'Class) return Boolean;

   --
   procedure Set_Id (Object : in out Workspace_Feature_Ref;
                     Value  : in ADO.Identifier);

   --
   function Get_Id (Object : in Workspace_Feature_Ref)
                 return ADO.Identifier;

   --
   procedure Set_Limit (Object : in out Workspace_Feature_Ref;
                        Value  : in Integer);

   --
   function Get_Limit (Object : in Workspace_Feature_Ref)
                 return Integer;

   --
   procedure Set_Workspace (Object : in out Workspace_Feature_Ref;
                            Value  : in AWA.Workspaces.Models.Workspace_Ref'Class);

   --
   function Get_Workspace (Object : in Workspace_Feature_Ref)
                 return AWA.Workspaces.Models.Workspace_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Workspace_Feature_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Workspace_Feature_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Workspace_Feature_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Workspace_Feature_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Workspace_Feature_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Workspace_Feature_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   WORKSPACE_FEATURE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Workspace_Feature_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Workspace_Feature_Ref;
                   Into   : in out Workspace_Feature_Ref);

   --  --------------------
   --  The workspace member indicates the users who
   --  are part of the workspace.
   --  --------------------
   --  Create an object key for Workspace_Member.
   function Workspace_Member_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Workspace_Member from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Workspace_Member_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Workspace_Member : constant Workspace_Member_Ref;
   function "=" (Left, Right : Workspace_Member_Ref'Class) return Boolean;

   --
   procedure Set_Id (Object : in out Workspace_Member_Ref;
                     Value  : in ADO.Identifier);

   --
   function Get_Id (Object : in Workspace_Member_Ref)
                 return ADO.Identifier;

   --
   procedure Set_Member (Object : in out Workspace_Member_Ref;
                         Value  : in AWA.Users.Models.User_Ref'Class);

   --
   function Get_Member (Object : in Workspace_Member_Ref)
                 return AWA.Users.Models.User_Ref'Class;

   --
   procedure Set_Workspace (Object : in out Workspace_Member_Ref;
                            Value  : in AWA.Workspaces.Models.Workspace_Ref'Class);

   --
   function Get_Workspace (Object : in Workspace_Member_Ref)
                 return AWA.Workspaces.Models.Workspace_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Workspace_Member_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Workspace_Member_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Workspace_Member_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Workspace_Member_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Workspace_Member_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Workspace_Member_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   WORKSPACE_MEMBER_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Workspace_Member_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Workspace_Member_Ref;
                   Into   : in out Workspace_Member_Ref);




private
   WORKSPACE_NAME : aliased constant String := "awa_workspace";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "version";
   COL_2_1_NAME : aliased constant String := "create_date";
   COL_3_1_NAME : aliased constant String := "owner_id";

   WORKSPACE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 4,
      Table => WORKSPACE_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access,
         4 => COL_3_1_NAME'Access
)
     );
   WORKSPACE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := WORKSPACE_DEF'Access;

   Null_Workspace : constant Workspace_Ref
      := Workspace_Ref'(ADO.Objects.Object_Ref with null record);

   type Workspace_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => WORKSPACE_DEF'Access)
   with record
       Version : Integer;
       Create_Date : Ada.Calendar.Time;
       Owner : AWA.Users.Models.User_Ref;
   end record;

   type Workspace_Access is access all Workspace_Impl;

   overriding
   procedure Destroy (Object : access Workspace_Impl);

   overriding
   procedure Find (Object  : in out Workspace_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Workspace_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Workspace_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Workspace_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Workspace_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Workspace_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Workspace_Ref'Class;
                        Impl   : out Workspace_Access);
   WORKSPACE_FEATURE_NAME : aliased constant String := "awa_workspace_feature";
   COL_0_2_NAME : aliased constant String := "id";
   COL_1_2_NAME : aliased constant String := "limit";
   COL_2_2_NAME : aliased constant String := "workspace_id";

   WORKSPACE_FEATURE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 3,
      Table => WORKSPACE_FEATURE_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access
)
     );
   WORKSPACE_FEATURE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := WORKSPACE_FEATURE_DEF'Access;

   Null_Workspace_Feature : constant Workspace_Feature_Ref
      := Workspace_Feature_Ref'(ADO.Objects.Object_Ref with null record);

   type Workspace_Feature_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => WORKSPACE_FEATURE_DEF'Access)
   with record
       Limit : Integer;
       Workspace : AWA.Workspaces.Models.Workspace_Ref;
   end record;

   type Workspace_Feature_Access is access all Workspace_Feature_Impl;

   overriding
   procedure Destroy (Object : access Workspace_Feature_Impl);

   overriding
   procedure Find (Object  : in out Workspace_Feature_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Workspace_Feature_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Workspace_Feature_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Workspace_Feature_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Workspace_Feature_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Workspace_Feature_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Workspace_Feature_Ref'Class;
                        Impl   : out Workspace_Feature_Access);
   WORKSPACE_MEMBER_NAME : aliased constant String := "awa_workspace_member";
   COL_0_3_NAME : aliased constant String := "id";
   COL_1_3_NAME : aliased constant String := "member_id";
   COL_2_3_NAME : aliased constant String := "workspace_id";

   WORKSPACE_MEMBER_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 3,
      Table => WORKSPACE_MEMBER_NAME'Access,
      Members => (
         1 => COL_0_3_NAME'Access,
         2 => COL_1_3_NAME'Access,
         3 => COL_2_3_NAME'Access
)
     );
   WORKSPACE_MEMBER_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := WORKSPACE_MEMBER_DEF'Access;

   Null_Workspace_Member : constant Workspace_Member_Ref
      := Workspace_Member_Ref'(ADO.Objects.Object_Ref with null record);

   type Workspace_Member_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => WORKSPACE_MEMBER_DEF'Access)
   with record
       Member : AWA.Users.Models.User_Ref;
       Workspace : AWA.Workspaces.Models.Workspace_Ref;
   end record;

   type Workspace_Member_Access is access all Workspace_Member_Impl;

   overriding
   procedure Destroy (Object : access Workspace_Member_Impl);

   overriding
   procedure Find (Object  : in out Workspace_Member_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Workspace_Member_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Workspace_Member_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Workspace_Member_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Workspace_Member_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Workspace_Member_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Workspace_Member_Ref'Class;
                        Impl   : out Workspace_Member_Access);
end AWA.Workspaces.Models;
