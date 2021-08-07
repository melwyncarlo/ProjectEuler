with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A047 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   Max_N       : constant Integer := 5E5;
   Array_Range : constant Integer := Integer (Float'Floor (
                                              Float (Max_N) / 10.0));

   FT          : File_Type;
   Last_Index  : Natural;
   Prime_Num   : String (1 .. 10);
   File_Name   : constant String  := "problems/003/PrimeNumbers_Upto_1000000";

   I           : Integer := 1;
   Main_Count  : Integer := 0;

   Primes_List : array (Integer range 1 .. Array_Range) of
                        Integer := (others => 0);

   J, Temp_I, I_By_5, Sub_Count : Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Prime_Num, Last_Index);

      if (Integer'Value (Prime_Num (1 .. Last_Index)) > Max_N) then
         exit;
      end if;

      Primes_List (I) := Integer'Value (Prime_Num (1 .. Last_Index));
      I := I + 1;

   end loop;

   Close (FT);

   I := 1000;
   while I <= Max_N loop

      J         := 1;
      Temp_I    := I;
      I_By_5    := Integer (Float'Floor (Float (I) / 5.0));
      Sub_Count := 0;

      while Primes_List (J) < I_By_5 loop

         if (Temp_I mod Primes_List (J)) = 0 then

            while (Temp_I mod Primes_List (J)) = 0 loop
               Temp_I := Temp_I / Primes_List (J);
            end loop;

            Sub_Count := Sub_Count + 1;

            if Sub_Count = 4 then
               exit;
            end if;

         end if;

         J := J + 1;

      end loop;

      if Sub_Count /= 4 then
         Main_Count := 0;
      else

         Main_Count := Main_Count + 1;

         if Main_Count = 4 then
            exit;
         end if;

      end if;

      I := I + 1;

   end loop;

   Put (I - 3, Width => 0);

end A047;
