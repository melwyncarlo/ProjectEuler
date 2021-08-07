with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A012 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   FT            : File_Type;
   Last_Index    : Natural;
   Prime_Num_Str : String (1 .. 10);
   File_Name     : constant String := "problems/003/PrimeNumbers_Upto_1000000";

   Count_Val     : Integer := 0;
   Divisors_N    : Integer := 1;

   Index, N, N_Max, N_Sum, Prime_Num : Integer;

   Divisors_Arr  : array (Integer range 1 .. 2,
                         Integer range 0 .. 500) of Integer;

begin

   while Divisors_N <= 500 loop

      N     := 1001 + (1000 * Count_Val);
      N_Max := N + 999;

      while N <= N_Max loop

         N_Sum        := N * (N + 1) / 2;
         Divisors_Arr := (others => (others => 0));

         while N_Sum /= 1 loop

            Open (FT, In_File, File_Name);

            while not End_Of_File (FT) loop

               Get_Line (FT, Prime_Num_Str, Last_Index);

               Prime_Num := Integer'Value (Prime_Num_Str (1 .. Last_Index));

               if (N_Sum mod Prime_Num) = 0 then

                  Index := -1;

                  for I in 1 .. Divisors_Arr (1, 0) loop
                     if Divisors_Arr (2, I) = Prime_Num then
                        Index := I;
                        exit;
                     end if;
                  end loop;

                  if Index = -1 then
                     Divisors_Arr (1, 0) := Divisors_Arr (1, 0) + 1;

                     Divisors_Arr (1, Divisors_Arr (1, 0)) :=
                        Divisors_Arr (1, Divisors_Arr (1, 0)) + 1;

                     Divisors_Arr (2, Divisors_Arr (1, 0)) := Prime_Num;
                  else
                     Divisors_Arr (1, Index) := Divisors_Arr (1, Index) + 1;
                  end if;

                  N_Sum := N_Sum / Prime_Num;
                  exit;

               end if;

            end loop;

            Close (FT);

         end loop;

            Divisors_N := 1;
            for I in 1 .. Divisors_Arr (1, 0) loop
               Divisors_N := Divisors_N * (Divisors_Arr (1, I) + 1);
            end loop;

            N := N + 1;

            if Divisors_N > 500 then
               exit;
            end if;

      end loop;

         Count_Val := Count_Val + 1;

   end loop;

   N := N - 1;

   Put (N * (N + 1) / 2, Width => 0);

end A012;
