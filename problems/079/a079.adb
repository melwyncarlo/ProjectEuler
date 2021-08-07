with Ada.Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A079 is

   use Ada.Text_IO;

   FT                   : File_Type;
   Last_Index           : Natural;
   Passcode_Attempt_Str : String (1 .. 10);
   File_Name            : constant String := "problems/079/p079_keylog.txt";

   Passcode : String (1 .. 10) := (others => ' ');

   Passcode_Positions : array (Integer range 0 .. 9) of Integer :=
                        (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

   Zero_Pos  : constant Integer := Character'Pos ('0');

   Index_Val : Integer := 1;

   Digit_1, Digit_2, Digit_3, Swap_Val : Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Passcode_Attempt_Str, Last_Index);

      Digit_1 := Character'Pos (Passcode_Attempt_Str (1)) - Zero_Pos;
      Digit_2 := Character'Pos (Passcode_Attempt_Str (2)) - Zero_Pos;
      Digit_3 := Character'Pos (Passcode_Attempt_Str (3)) - Zero_Pos;

      if Passcode_Positions (Digit_1) >= Passcode_Positions (Digit_2) then
         Swap_Val                     := Passcode_Positions (Digit_1);
         Passcode_Positions (Digit_1) := Passcode_Positions (Digit_2);
         Passcode_Positions (Digit_2) := Swap_Val;
      end if;

      if Passcode_Positions (Digit_2) >= Passcode_Positions (Digit_3) then
         Swap_Val                     := Passcode_Positions (Digit_2);
         Passcode_Positions (Digit_2) := Passcode_Positions (Digit_3);
         Passcode_Positions (Digit_3) := Swap_Val;
      end if;

   end loop;

   for I in 0 .. 9 loop

      if Passcode_Positions (I) /= (I + 1) then

         for J in 0 .. 9 loop

            if Passcode_Positions (J) = (I + 1) then
               Passcode (Index_Val) := Character'Val (J + Character'Pos ('0'));
               Index_Val := Index_Val + 1;
               exit;
            end if;

         end loop;

      end if;

   end loop;

   Close (FT);

   Put (Passcode);

end A079;
