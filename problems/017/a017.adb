with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A017 is

   use Ada.Integer_Text_IO;
   use Ada.Numerics.Elementary_Functions;

   N : Integer := 0;

   And_Str_Length          : constant Integer := 3;
   Hundred_Str_Length      : constant Integer := 7;
   One_Thousand_Str_Length : constant Integer := 11;

   --  The first elements are dummy elements.
   Ones_Str_Length    : constant array (Integer range 0 .. 9) of Integer :=
   (0, 3, 3, 5, 4, 4, 3, 5, 5, 4);

   Tens_Str_Length    : constant array (Integer range 0 .. 9) of Integer :=
   (0, 3, 6, 6, 5, 5, 5, 7, 6, 6);

   Elevens_Str_Length : constant array (Integer range 0 .. 9) of Integer :=
   (0, 6, 6, 8, 8, 7, 7, 9, 8, 8);

   Number_Length, Ones_Number, Tens_Number : Integer;

begin

   for I in 1 .. 999 loop

      Number_Length := Integer (Float'Floor (Log (Float (I), 10.0))) + 1;
      Ones_Number   := I mod 10;
      Tens_Number   := (Integer (Float'Floor (Float (I) / 10.0))) mod 10;

      if Number_Length > 2 then

         N := N
         + Ones_Str_Length (Integer (Float'Floor (Float (I) / 100.0)))
         + Hundred_Str_Length;

         if Ones_Number > 0 or Tens_Number > 0 then
            N := N + And_Str_Length;
         end if;

      end if;

      if Number_Length > 1 then

         if Tens_Number = 1 then

            if Ones_Number = 0 then
               N := N + Tens_Str_Length (1);
            else
               N := N + Elevens_Str_Length (Ones_Number);
            end if;

            goto Continue;

         else
            N := N + Tens_Str_Length (Tens_Number);
         end if;

      end if;

      N := N + Ones_Str_Length (Ones_Number);

      <<Continue>>

   end loop;

   N := N + One_Thousand_Str_Length;

   Put (N, Width => 0);

end A017;
