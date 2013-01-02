-----------------------------------------------------------------------
--  awa-questions-questions-modules -- Module questions
--  Copyright (C) 2012 Stephane Carrez
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
with ASF.Applications;

with AWA.Modules;
package Awa-questions.Questions.Modules is

   --  The name under which the module is registered.
   NAME : constant String := "questions";

   --  ------------------------------
   --  Module questions
   --  ------------------------------
   type Question_Module is new AWA.Modules.Module with private;
   type Question_Module_Access is access all Question_Module'Class;

   --  Initialize the questions module.
   overriding
   procedure Initialize (Plugin : in out Question_Module;
                         App    : in AWA.Modules.Application_Access;
                         Props  : in ASF.Applications.Config);

   --  Get the questions module.
   function Get_Question_Module return Question_Module_Access;

private

   type Question_Module is new AWA.Modules.Module with null record;

end Awa-questions.Questions.Modules;
