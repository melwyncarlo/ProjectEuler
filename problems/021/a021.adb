with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A021 is

   use Ada.Integer_Text_IO;

   Max_N : constant Integer := 10000 - 1;

   Amicable_Numbers : array (Integer range 1 .. Max_N) of Integer :=
                      (others => 0);

   Proper_Divisors_Sum_1 : Integer;
   Proper_Divisors_Sum_2 : Integer;

   N, J_Max : Integer;

begin

   for I in 2 .. Max_N loop

      Proper_Divisors_Sum_1 := 0;
      Proper_Divisors_Sum_2 := 0;

      J_Max := Integer (Float'Floor (Float (I) / 2.0));

      for J in 1 .. J_Max loop
         if (I mod J) = 0 then
            Proper_Divisors_Sum_1 := Proper_Divisors_Sum_1 + J;
         end if;
      end loop;

      J_Max := Integer (Float'Floor (Float (Proper_Divisors_Sum_1) / 2.0));

      for J in 1 .. J_Max loop
         if (Proper_Divisors_Sum_1 mod J) = 0 then
            Proper_Divisors_Sum_2 := Proper_Divisors_Sum_2 + J;
         end if;
      end loop;

      if I = Proper_Divisors_Sum_2 and I /= Proper_Divisors_Sum_1 then
         Amicable_Numbers (I) := 1;
         Amicable_Numbers (Proper_Divisors_Sum_1) := 1;
      end if;

   end loop;

   N := 0;
   for I in 1 .. Max_N loop
      N := N + (I * Amicable_Numbers (I));
   end loop;

   Put (N, Width => 0);

end A021;
