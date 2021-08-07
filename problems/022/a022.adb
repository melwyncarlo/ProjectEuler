with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Characters.Handling;
with Ada.Long_Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A022 is

   use Ada.Text_IO;
   use Ada.Strings.Fixed;
   use Ada.Long_Integer_Text_IO;

   FT             : File_Type;
   Ch             : Character;
   Name_Val       : String (1 .. 50) := 50 * ' ';
   Names_List     : array (Integer range 1 .. 5500) of String (1 .. 50) :=
                          (others => 50 * ' ');
   File_Name      : constant String := "problems/022/p022_names.txt";

   Is_Incremented : Boolean := False;

   Count_Val      : Integer := 1;
   Index_Val      : Integer := 1;

   Alpha_Val, Str_Len : Integer;
   N : Long_Integer;

begin

   Open (FT, In_File, File_Name);

   Get (FT, Ch);

   while not End_Of_File (FT) loop

      Get (FT, Ch);

      if Ada.Characters.Handling.Is_Letter (Ch) then
         Is_Incremented       := False;
         Name_Val (Index_Val) := Ch;
         Index_Val            := Index_Val + 1;
      else
         if not Is_Incremented then
            Index_Val      := 1;
            Is_Incremented := True;

            Names_List (Count_Val) := Name_Val;

            Count_Val := Count_Val + 1;
            Name_Val  := 50 * ' ';
         end if;
      end if;

   end loop;

   Close (FT);

   Count_Val := Count_Val - 1;

   for I in 1 .. (Count_Val - 1) loop
      for J in (I + 1) .. Count_Val loop
         if Names_List (I) > Names_List (J) then
            Name_Val       := 50 * ' ';
            Name_Val       := Names_List (I);
            Names_List (I) := Names_List (J);
            Names_List (J) := Name_Val;
         end if;
      end loop;
   end loop;

   N := 0;

   for I in 1 .. Count_Val loop
      Alpha_Val := 0;

      Str_Len   := Index (Names_List (I), " ") - 1;
      for J in 1 .. Str_Len loop
         Alpha_Val := Alpha_Val + Character'Pos (Names_List (I) (J)) - 64;
      end loop;

      N := N + Long_Integer (I * Alpha_Val);
   end loop;

   Put (N, Width => 0);

end A022;
