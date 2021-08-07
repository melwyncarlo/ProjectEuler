with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A034 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Factorials : constant array (Integer range 1 .. 10) of Integer :=
   (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);

   Sum   : Integer := 0;

   I_Len, Digits_Sum : Integer;

   I_Str : String (1 .. 10);

begin

   for I in 100 .. 1_00_000 loop

      I_Len := Trim (Integer'Image (I), Ada.Strings.Both)'Length;

      I_Str (1 .. I_Len) := Trim (Integer'Image (I), Ada.Strings.Both);

      Digits_Sum := 0;

      for J in 1 .. I_Len loop
         Digits_Sum := Digits_Sum
                     + Factorials (Character'Pos (I_Str (J))
                     - Character'Pos ('0') + 1);
      end loop;

      if Digits_Sum = I then
         Sum := Sum + I;
      end if;

   end loop;

   Put (Sum, Width => 0);

end A034;
