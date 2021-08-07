with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A019 is

   use Ada.Integer_Text_IO;

   --  The first element is a dummy element.
   Month_Constant : constant array (Integer range 1 .. 13) of Integer :=
   (0, 1, -1, 0, 0, 1, 1, 2, 3, 3, 4, 4, 5);

   N : Integer := 0;

   Day_Val : Integer;

begin

   for I in 1901 .. 2000 loop

      for J in 1 .. 12 loop

         Day_Val := (((I - 1) * 365)
                  + Integer (Float'Floor (Float (I - 1) / 400.0))
                  + Integer (Float'Floor (Float (I - 1) / 4.0))
                  - Integer (Float'Floor (Float (I - 1) / 100.0))
                  + ((J - 1) *  30)
                  + Month_Constant (J)
                  + 1);

         if (I mod 4) = 0 and J > 2 then
            Day_Val := Day_Val + 1;
         end if;

         Day_Val := Day_Val mod 7;

         if Day_Val = 0 then
            N := N + 1;
         end if;

      end loop;

   end loop;

   Put (N, Width => 0);

end A019;
