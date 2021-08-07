with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A050 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   FT                : File_Type;
   Last_Index        : Natural;
   Prime_Num         : String (1 .. 10);
   File_Name         : constant String :=
                      "problems/003/PrimeNumbers_Upto_1000000";

   Primes_Nums       : array (Integer range 1 .. 80_000) of Integer;

   N                 : Integer :=  1;
   I_Start           : Integer :=  0;
   Resultant_Prime   : Integer :=  0;
   Count_Val         : Integer := 23;

   Prime_Found       : Boolean := False;

   I, I_By_10, Sum : Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Prime_Num, Last_Index);

      if Integer'Value (Prime_Num (1 .. Last_Index)) > 1_000_000 then
         exit;
      end if;

      if I_Start = 0 then
         if Integer'Value (Prime_Num (1 .. Last_Index)) > 1_00_000 then
            I_Start := N - 1;
         end if;
      end if;

      Primes_Nums (N) := Integer'Value (Prime_Num (1 .. Last_Index));
      N := N + 1;

   end loop;

   Close (FT);

   while Count_Val < 1_000 loop

      I := I_Start;
      Prime_Found := False;

      while I < N loop

         I_By_10 := Integer (Float'Floor (Float (I) / 10.0));

         for J in 1 .. I_By_10 loop

            Sum := 0;

            for K in J .. (J + Count_Val - 1) loop
               Sum := Sum + Primes_Nums (K);
            end loop;

            if Sum > Primes_Nums (I) then
               exit;
            end if;

            if Sum = Primes_Nums (I) then
               Resultant_Prime := Primes_Nums (I);
               Prime_Found     := True;
               Count_Val       := Count_Val + 1;
               exit;
            end if;

         end loop;

         if Prime_Found then
            exit;
         end if;

         I := I + 1;

      end loop;

      Count_Val := Count_Val + 1;

   end loop;

   Put (Resultant_Prime, Width => 0);

end A050;
