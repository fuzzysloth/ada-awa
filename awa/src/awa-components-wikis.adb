-----------------------------------------------------------------------
--  awa-components-wikis -- Wiki rendering component
--  Copyright (C) 2011, 2012, 2013, 2015 Stephane Carrez
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
with Util.Strings;

with Ada.Characters.Conversions;
with ASF.Contexts.Writer;
with ASF.Utils;

with Wiki.Render.Html;
with Wiki.Writers;
package body AWA.Components.Wikis is

   WIKI_ATTRIBUTE_NAMES  : Util.Strings.String_Set.Set;

   type Html_Writer_Type is limited new Wiki.Writers.Html_Writer_Type with record
      Writer : ASF.Contexts.Writer.Response_Writer_Access;
   end record;

   overriding
   procedure Write (Writer  : in out Html_Writer_Type;
                    Content : in Wide_Wide_String);

   --  Write a single character to the string builder.
   overriding
   procedure Write (Writer : in out Html_Writer_Type;
                    Char   : in Wide_Wide_Character);

   overriding
   procedure Write (Writer  : in out Html_Writer_Type;
                    Content : in Unbounded_Wide_Wide_String);


   --  Write an XML element using the given name and with the content.
   --  This is similar to calling <b>Start_Element</b>, <b>Write_Text</b>
   --  and <b>End_Element</b>.
   overriding
   procedure Write_Wide_Element (Writer  : in out Html_Writer_Type;
                                 Name    : in String;
                                 Content : in Unbounded_Wide_Wide_String);

   --  Write an XML attribute within an XML element.
   --  The attribute value is escaped according to the XML escape rules.
   overriding
   procedure Write_Wide_Attribute (Writer  : in out Html_Writer_Type;
                                   Name    : in String;
                                   Content : in Unbounded_Wide_Wide_String);

   --  Start an XML element with the given name.
   overriding
   procedure Start_Element (Writer : in out Html_Writer_Type;
                            Name   : in String);

   --  Closes an XML element of the given name.
   overriding
   procedure End_Element (Writer : in out Html_Writer_Type;
                          Name   : in String);

   --  Write a text escaping any character as necessary.
   overriding
   procedure Write_Wide_Text (Writer  : in out Html_Writer_Type;
                              Content : in Unbounded_Wide_Wide_String);

   overriding
   procedure Write (Writer  : in out Html_Writer_Type;
                    Content : in Wide_Wide_String) is
   begin
      Writer.Writer.Write_Wide_Text (Content);
   end Write;

   --  ------------------------------
   --  Write a single character to the string builder.
   --  ------------------------------
   overriding
   procedure Write (Writer : in out Html_Writer_Type;
                    Char   : in Wide_Wide_Character) is
   begin
      Writer.Writer.Write_Wide_Char (Char);
   end Write;

   overriding
   procedure Write (Writer  : in out Html_Writer_Type;
                    Content : in Unbounded_Wide_Wide_String) is
   begin
      Writer.Writer.Write (Content);
   end Write;


   --  ------------------------------
   --  Write an XML element using the given name and with the content.
   --  This is similar to calling <b>Start_Element</b>, <b>Write_Text</b>
   --  and <b>End_Element</b>.
   --  ------------------------------
   overriding
   procedure Write_Wide_Element (Writer  : in out Html_Writer_Type;
                                 Name    : in String;
                                 Content : in Unbounded_Wide_Wide_String) is
   begin
      Writer.Writer.Write_Wide_Element (Name, Content);
   end Write_Wide_Element;

   --  ------------------------------
   --  Write an XML attribute within an XML element.
   --  The attribute value is escaped according to the XML escape rules.
   --  ------------------------------
   overriding
   procedure Write_Wide_Attribute (Writer  : in out Html_Writer_Type;
                                   Name    : in String;
                                   Content : in Unbounded_Wide_Wide_String) is
   begin
      Writer.Writer.Write_Wide_Attribute (Name, Content);
   end Write_Wide_Attribute;

   --  ------------------------------
   --  Start an XML element with the given name.
   --  ------------------------------
   overriding
   procedure Start_Element (Writer : in out Html_Writer_Type;
                            Name   : in String) is
   begin
      Writer.Writer.Start_Element (Name);
   end Start_Element;

   --  ------------------------------
   --  Closes an XML element of the given name.
   --  ------------------------------
   overriding
   procedure End_Element (Writer : in out Html_Writer_Type;
                          Name   : in String) is
   begin
      Writer.Writer.End_Element (Name);
   end End_Element;

   --  ------------------------------
   --  Write a text escaping any character as necessary.
   --  ------------------------------
   overriding
   procedure Write_Wide_Text (Writer  : in out Html_Writer_Type;
                              Content : in Unbounded_Wide_Wide_String) is
   begin
      Writer.Writer.Write_Wide_Text (Content);
   end Write_Wide_Text;

   --  ------------------------------
   --  Get the wiki format style.  The format style is obtained from the <b>format</b>
   --  attribute name.
   --  ------------------------------
   function Get_Wiki_Style (UI      : in UIWiki;
                            Context : in Faces_Context'Class)
                            return Wiki.Parsers.Wiki_Syntax_Type is
      Format : constant String := UI.Get_Attribute (Name    => FORMAT_NAME,
                                                    Context => Context,
                                                    Default => "dotclear");
   begin
      if Format = "dotclear" then
         return Wiki.Parsers.SYNTAX_DOTCLEAR;
      elsif Format = "google" then
         return Wiki.Parsers.SYNTAX_GOOGLE;
      elsif Format = "phpbb" then
         return Wiki.Parsers.SYNTAX_PHPBB;
      elsif Format = "creole" then
         return Wiki.Parsers.SYNTAX_CREOLE;
      elsif Format = "mediawiki" then
         return Wiki.Parsers.SYNTAX_MEDIA_WIKI;
      else
         return Wiki.Parsers.SYNTAX_MIX;
      end if;
   end Get_Wiki_Style;

   --  ------------------------------
   --  Get the links renderer that must be used to render image and page links.
   --  ------------------------------
   function Get_Links_Renderer (UI      : in UIWiki;
                                Context : in Faces_Context'Class)
                                return Wiki.Render.Link_Renderer_Access is
      Value : constant Util.Beans.Objects.Object := UI.Get_Attribute (Context, LINKS_NAME);
      Bean  : constant access Util.Beans.Basic.Readonly_Bean'Class
           := Util.Beans.Objects.To_Bean (Value);
   begin
      if Bean = null then
         return null;
      elsif not (Bean.all in Link_Renderer_Bean'Class) then
         return null;
      else
         return Link_Renderer_Bean'Class (Bean.all)'Access;
      end if;
   end Get_Links_Renderer;

   --  ------------------------------
   --  Render the wiki text
   --  ------------------------------
   overriding
   procedure Encode_Begin (UI      : in UIWiki;
                           Context : in out Faces_Context'Class) is
      use ASF.Contexts.Writer;
      use type Wiki.Render.Link_Renderer_Access;
   begin
      if not UI.Is_Rendered (Context) then
         return;
      end if;
      declare
         Writer   : constant Response_Writer_Access := Context.Get_Response_Writer;
         Html     : aliased Html_Writer_Type;
         Renderer : aliased Wiki.Render.Html.Html_Renderer;
         Format   : constant Wiki.Parsers.Wiki_Syntax_Type := UI.Get_Wiki_Style (Context);
         Value    : constant Util.Beans.Objects.Object := UI.Get_Attribute (Context, VALUE_NAME);
         Links    : Wiki.Render.Link_Renderer_Access;
      begin
         Html.Writer := Writer;
         Writer.Start_Element ("div");
         UI.Render_Attributes (Context, WIKI_ATTRIBUTE_NAMES, Writer);

         if not Util.Beans.Objects.Is_Empty (Value) then
            Links := UI.Get_Links_Renderer (Context);
            if Links /= null then
               Renderer.Set_Link_Renderer (Links);
            end if;
            Renderer.Set_Writer (Html'Unchecked_Access);
            Wiki.Parsers.Parse (Renderer'Unchecked_Access,
                                Util.Beans.Objects.To_Wide_Wide_String (Value),
                                Format);
         end if;
         Writer.End_Element ("div");
      end;
   end Encode_Begin;

   --  ------------------------------
   --  Get the value identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Link_Renderer_Bean;
                       Name : in String) return Util.Beans.Objects.Object is
   begin
      return Util.Beans.Objects.Null_Object;
   end Get_Value;

   function Starts_With (Content : in Unbounded_Wide_Wide_String;
                         Item    : in String) return Boolean is
      use Ada.Characters.Conversions;

      Pos : Positive := 1;
   begin
      if Length (Content) < Item'Length then
         return False;
      end if;
      for I in Item'Range loop
         if Item (I) /= To_Character (Element (Content, Pos)) then
            return False;
         end if;
         Pos := Pos + 1;
      end loop;
      return True;
   end Starts_With;

   --  ------------------------------
   --  Return true if the link is an absolute link.
   --  ------------------------------
   function Is_Link_Absolute (Renderer : in Link_Renderer_Bean;
                              Link     : in Unbounded_Wide_Wide_String) return Boolean is
   begin
      return Starts_With (Link, "http://") or Starts_With (Link, "https://");
   end Is_Link_Absolute;

   procedure Make_Link (Renderer : in Link_Renderer_Bean;
                        Link     : in Unbounded_Wide_Wide_String;
                        Prefix   : in Unbounded_Wide_Wide_String;
                        URI      : out Unbounded_Wide_Wide_String) is
   begin
      if Renderer.Is_Link_Absolute (Link) then
         URI := Link;
      else
         URI := Prefix & Link;
      end if;
   end Make_Link;

   --  ------------------------------
   --  Get the image link that must be rendered from the wiki image link.
   --  ------------------------------
   overriding
   procedure Make_Image_Link (Renderer : in Link_Renderer_Bean;
                              Link     : in Unbounded_Wide_Wide_String;
                              URI      : out Unbounded_Wide_Wide_String;
                              Width    : out Natural;
                              Height   : out Natural) is
   begin
      Renderer.Make_Link (Link, Renderer.Image_Prefix, URI);
      Width  := 0;
      Height := 0;
   end Make_Image_Link;

   --  ------------------------------
   --  Get the page link that must be rendered from the wiki page link.
   --  ------------------------------
   overriding
   procedure Make_Page_Link (Renderer : in Link_Renderer_Bean;
                             Link     : in Unbounded_Wide_Wide_String;
                             URI      : out Unbounded_Wide_Wide_String;
                             Exists   : out Boolean) is
   begin
      Renderer.Make_Link (Link, Renderer.Page_Prefix, URI);
      Exists := True;
   end Make_Page_Link;

begin
   ASF.Utils.Set_Text_Attributes (WIKI_ATTRIBUTE_NAMES);
end AWA.Components.Wikis;
