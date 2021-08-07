with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A023 is

   use Ada.Integer_Text_IO;

   Abundant_Numbers : array (Integer range 1 .. 10000) of Integer :=
                      (others => 0);

   N         : Integer := 1;
   Count_Val : Integer := 1;

   J_Max, K, Count_By_2, Proper_Divisors_Sum : Integer;

   Abundant_Sum_Found : Boolean;

begin

   for I in 2 .. 28123 loop

      Proper_Divisors_Sum := 0;

      J_Max := Integer (Float'Floor (Float (I) / 2.0));

      for J in 1 .. J_Max loop
         if (I mod J) = 0 then
            Proper_Divisors_Sum := Proper_Divisors_Sum + J;
         end if;
      end loop;

      if Proper_Divisors_Sum > I then
         Abundant_Numbers (Count_Val) := I;
         Count_Val := Count_Val + 1;
      end if;

      Count_By_2 := Integer (Float'Floor (Float (Count_Val) / 2.0));

      Abundant_Sum_Found := False;

      for J in 1 .. Count_By_2 loop

         K := J;

         while (Abundant_Numbers (J) + Abundant_Numbers (K)) < I loop
            K := K + 1;
         end loop;

         if (Abundant_Numbers (J) + Abundant_Numbers (K)) = I then
            Abundant_Sum_Found := True;
            exit;
         end if;

      end loop;

      if not Abundant_Sum_Found then
         N := N + I;
      end if;

   end loop;

   Put (N, Width => 0);

end A023;
