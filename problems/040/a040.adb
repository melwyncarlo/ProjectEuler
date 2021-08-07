with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A040 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Max_E       : constant Integer := 7; -- 1E+x

   N           : constant array (Integer range 1 .. Max_E) of Integer :=
                 (1, 10, 100, 1000, 10000, 100000, 1000000);

   Indices     : array (Integer range 1 .. Max_E) of Integer;

   Product_Val : Integer := 1;

   J, Num, Index_Val : Integer;

begin

   Indices (1) := 1;

   for I in 2 .. Max_E loop
      Indices (I) := Indices (I - 1) + (9 * (I - 1) * Integer (10 ** (I - 2)));
   end loop;

   for I in 1 .. Max_E loop

      J := 1;
      while J <= Max_E loop
         if N (I) < Indices (J) then
            exit;
         end if;
         J := J + 1;
      end loop;
      J := J - 2;

      Num := Integer (10 ** J) + Integer ((N (I) - Indices (J + 1)) / (J + 1));

      Index_Val := ((N (I) - Indices (J + 1)) mod (J + 1)) + 1;
      Product_Val := Product_Val * (Character'Pos (
                     Trim (Integer'Image (Num), Ada.Strings.Both) (Index_Val))
                   - Character'Pos ('0'));

   end loop;

   Put (Product_Val, Width => 0);

end A040;
