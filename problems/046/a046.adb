with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A046 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;
   use Ada.Numerics.Elementary_Functions;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   Max_N       : constant Integer := 1E5;

   FT          : File_Type;
   Last_Index  : Natural;
   Prime_Num   : String (1 .. 10);
   File_Name   : constant String := "problems/003/PrimeNumbers_Upto_1000000";

   Primes_List : array (Integer range 1 .. Max_N) of Integer;

   Smallest_Odd_Composite_Number : Integer := 0;

   I, J        : Integer;
   B           : Float;

   Prime_Found : Boolean;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Prime_Num, Last_Index);

      if (Integer'Value (Prime_Num (1 .. Last_Index)) > Max_N) then
         exit;
      end if;

      Primes_List (Integer'Value (Prime_Num (1 .. Last_Index))) := 1;

   end loop;

   Close (FT);

   I := 35;
   while I <= Max_N loop

      if Primes_List (I) = 0 then

         J := 2;
         Prime_Found := False;

         while J < I loop

            if Primes_List (J) /= 0 then

               B := Sqrt (Float (I - J) / 2.0);

               if B = Float'Floor (B) then
                  Prime_Found := True;
                  exit;
               end if;

            end if;

            J := J + 1;

         end loop;

         if not Prime_Found then
            Smallest_Odd_Composite_Number := I;
            exit;
         end if;

      end if;

      I := I + 2;

   end loop;

   Put (Smallest_Odd_Composite_Number, Width => 0);

end A046;
