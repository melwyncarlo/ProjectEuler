with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A014 is

   use Ada.Integer_Text_IO;

   N_Count          : Integer := 1E5;

   Max_Count        : Integer := 0;
   Max_Count_Number : Integer := 0;

   I_Count : Integer;

   N : Long_Integer;

begin

   while N_Count < 1E6 loop

      I_Count := 0;
      N := Long_Integer (N_Count);

      while N /= 1 loop

         if (N mod Long_Integer (2)) = 0 then
            N := N / 2;
         else
            N := (3 * N) + 1;
         end if;

         I_Count := I_Count + 1;

      end loop;

      I_Count := I_Count + 1;

      if I_Count > Max_Count then
         Max_Count        := I_Count;
         Max_Count_Number := N_Count;
      end if;

      N_Count := N_Count + 1;

   end loop;

   Put (Max_Count_Number, Width => 0);

end A014;
