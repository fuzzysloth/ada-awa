-----------------------------------------------------------------------
--  awa-images-services -- Image service
--  Copyright (C) 2012, 2013, 2016 Stephane Carrez
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

with Security.Permissions;

with ADO;

with AWA.Modules;

with EL.Expressions;

with AWA.Storages.Models;

--  == Storage Service ==
--  The <tt>Storage_Service</tt> provides the operations to access and use the persisent storage.
--  It controls the permissions that grant access to the service for users.
--
--  Other modules can be notified of storage changes by registering a listener
--  on the storage module.
package AWA.Images.Services is

   package ACL_Create_Storage is new Security.Permissions.Definition ("storage-create");
   package ACL_Delete_Storage is new Security.Permissions.Definition ("storage-delete");
   package ACL_Create_Folder is new Security.Permissions.Definition ("folder-create");

   PARAM_THUMBNAIL_COMMAND : constant String := "thumbnail_command";

   --  ------------------------------
   --  Image Service
   --  ------------------------------
   --  The <b>Image_Service</b> works closely with the storage service.  It extracts the
   --  information of an image, creates the image thumbnail.
   type Image_Service is new AWA.Modules.Module_Manager with private;
   type Image_Service_Access is access all Image_Service'Class;

   --  Initializes the image service.
   overriding
   procedure Initialize (Service : in out Image_Service;
                         Module  : in AWA.Modules.Module'Class);

   procedure Create_Thumbnail (Service : in Image_Service;
                               Source  : in String;
                               Into    : in String;
                               Width   : in out Natural;
                               Height  : in out Natural);

   --  Build a thumbnail for the image identified by the Id.
   procedure Build_Thumbnail (Service : in Image_Service;
                              Id      : in ADO.Identifier);

   --  Save the data object contained in the <b>Data</b> part element into the
   --  target storage represented by <b>Into</b>.
   procedure Create_Image (Service : in Image_Service;
                           File    : in AWA.Storages.Models.Storage_Ref'Class);

   --  Deletes the storage instance.
   procedure Delete_Image (Service : in Image_Service;
                           File    : in AWA.Storages.Models.Storage_Ref'Class);

   --  Scale the image dimension.
   procedure Scale (Width     : in Natural;
                    Height    : in Natural;
                    To_Width  : in out Natural;
                    To_Height : in out Natural);

   --  Get the dimension represented by the string.  The string has one of the following
   --  formats:
   --    original          -> Width, Height := Natural'Last
   --    default           -> Width, Height := 0
   --    <width>x          -> Width := <width>, Height := 0
   --    x<height>         -> Width := 0, Height := <height>
   --    <width>x<height>  -> Width := <width>, Height := <height>
   procedure Get_Sizes (Dimension : in String;
                        Width     : out Natural;
                        Height    : out Natural);

private

   type Image_Service is new AWA.Modules.Module_Manager with record
      Thumbnail_Command : EL.Expressions.Expression;
   end record;

end AWA.Images.Services;
