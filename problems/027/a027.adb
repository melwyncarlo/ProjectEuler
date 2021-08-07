with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A027 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   FT          : File_Type;
   Last_Index  : Natural;
   Prime_Num   : String (1 .. 10);
   File_Name   : constant String :=
                "problems/003/PrimeNumbers_Upto_1000000";

   Primes_List : array (Integer range 1 .. 1000) of Integer;

   A       : Integer := -999;
   B_Count : Integer :=    0;

   A_Max   : Integer := 0;
   B_Max   : Integer := 0;
   N_Max   : Integer := 0;

   I       : Integer := 1;

   B, N, J, Max_Prime : Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) and I /= 1000 loop

      Get_Line (FT, Prime_Num, Last_Index);

      if Integer'Value (Prime_Num (1 .. Last_Index)) < 1000 then
         B_Count := B_Count + 1;
      end if;
      Primes_List (I) := Integer'Value (Prime_Num (1 .. Last_Index));
      I := I + 1;

   end loop;

   Close (FT);

   while A < 1000 loop

      B := 1;
      while B < B_Count loop

         N := 1;
         J := 1;
         Max_Prime := (N * N) + (A * N) + Primes_List (B);

         while J < 1000 loop

            if Primes_List (J) > Max_Prime then
               exit;
            end if;

            if Max_Prime = Primes_List (J) then
               N := N + 1;
               J := 1;
               Max_Prime := (N * N) + (A * N) + Primes_List (B);
               goto Continue;
            end if;

            J := J + 1;

            <<Continue>>

         end loop;

         if N > N_Max then
            N_Max := N;
            A_Max := A;
            B_Max := Primes_List (B);
         end if;

         B := B + 1;

      end loop;

      A := A + 1;

   end loop;

   Put (A_Max * B_Max, Width => 0);

end A027;
