-----------------------------------------------------------------------
--  awa-counters --
--  Copyright (C) 2015 Stephane Carrez
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
with ADO.Objects;
with ADO.Schemas;
with Util.Strings;
with AWA.Index_Arrays;
package AWA.Counters is

   type Counter_Index_Type is new Natural;

   --  Increment the counter identified by <tt>Counter</tt> and associated with the
   --  database object <tt>Object</tt>.
   procedure Increment (Counter : in Counter_Index_Type;
                        Object  : in ADO.Objects.Object_Ref'Class);

private

   type Counter_Def is record
      Table : ADO.Schemas.Class_Mapping_Access;
      Field : Util.Strings.Name_Access;
   end record;

   function "=" (Left, Right : in Counter_Def) return Boolean;
   function "<" (Left, Right : in Counter_Def) return Boolean;
   function "&" (Left  : in String;
                 Right : in Counter_Def) return String;

   package Counter_Arrays is new AWA.Index_Arrays (Counter_Index_Type, Counter_Def);

end AWA.Counters;