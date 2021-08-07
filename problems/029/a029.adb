with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A029 is

   use Ada.Text_IO;
   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   N_Str, N_Str_Copy : String (1 .. 200);
   Temp_Product      : String (1 ..   3);

   FT                : File_Type;
   Last_Index        : Natural;
   File_Line         : String (1 .. 201);
   File_Name         : constant String := "problems/029/temp.dat";

   Products_Array    : array (Integer range 1 .. 201,
                              Integer range 1 .. 201) of Character;

   Sum_Val           : Integer := 0;

   Is_First          : Boolean := True;

   Temp_Sum, Str_Length : Integer;

begin

   Create (FT, Out_File, File_Name);

   for I in 2 .. 100 loop

      N_Str (1 .. 200) := 200 * "0";

      if I < 10 then
         N_Str (2 .. 2) := Trim (Integer'Image (I), Ada.Strings.Both);
      else
         N_Str (1 .. Trim (Integer'Image (I), Ada.Strings.Both)'Length) :=
                     Trim (Integer'Image (I), Ada.Strings.Both);
      end if;

      Str_Length := 2;

      Products_Array := (others => (others => Character'Val (0)));

      for J in 2 .. 100 loop

         for M in reverse 1 .. Str_Length loop

            Temp_Sum     := I * (Character'Pos (N_Str (M))
                              -  Character'Pos ('0'));

            Move (Source  => Trim (Integer'Image (Temp_Sum), Ada.Strings.Both),
                  Target  => Temp_Product (1 .. 3),
                  Justify => Ada.Strings.Right,
                  Pad     => '0');

            for K1 in 1 .. M loop
               Products_Array (M, K1) := '0';
            end loop;

            for K2 in (M + 1) .. (M + 3) loop
               Products_Array (M, K2) := Temp_Product (K2 - M);
            end loop;

            for K3 in (M + 4) .. (Str_Length + 3) loop
               Products_Array (M, K3) := '0';
            end loop;

         end loop;

         N_Str (1 .. 200) := 200 * "0";

         for M in reverse 2 .. (Str_Length + 3) loop

            Temp_Sum := 0;

            for N in 1 .. Str_Length loop
               Temp_Sum := Temp_Sum
                         + Character'Pos (Products_Array (N, M))
                         - Character'Pos ('0');
            end loop;

            Temp_Sum := Temp_Sum
                      + Character'Pos (N_Str (M - 1))
                      - Character'Pos ('0');

            N_Str (M - 1) := Character'Val ((Temp_Sum mod 10)
                           + Character'Pos ('0'));
            if (M - 2) > 0 then
               N_Str (M - 2) := Character'Val (Integer (Float'Floor (
                                Float (Temp_Sum) / 10.0))
                              + Character'Pos ('0'));
            end if;

         end loop;

         Str_Length := Str_Length + 2;

         N_Str_Copy (1 .. 200) := 200 * "0";

         N_Str_Copy (201 - Str_Length .. N_Str_Copy'Last) :=
              N_Str (1  .. Str_Length);

         Reset (FT, In_File);
         while not End_Of_File (FT) loop
            Get_Line (FT, File_Line, Last_Index);
            if File_Line (1 .. Last_Index) = N_Str_Copy then
               goto Label_10;
            end if;
         end loop;

         if Is_First then
            Reset (FT, Out_File);
            Is_First := False;
         else
            Reset (FT, Append_File);
         end if;
         Put_Line (FT, N_Str_Copy);

         <<Label_10>>

      end loop;

   end loop;

   Reset (FT, In_File);
   while not End_Of_File (FT) loop
      Get_Line (FT, File_Line, Last_Index);
      Sum_Val := Sum_Val + 1;
   end loop;

   Delete (FT);

   Put (Sum_Val, Width => 0);

end A029;
