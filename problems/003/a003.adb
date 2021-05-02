with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Long_Elementary_Functions;
use Ada.Numerics.Long_Elementary_Functions;

-- Copyright 2021 Melwyn Francis Carlo

procedure A003 is

   -- File Reference: http://www.naturalnumbers.org/primes.html

   FT                : File_Type;
   Last_Index        : Natural;
   Prime_Num         : String (1 .. 10);
   Prime_Num_Max     : Long_Integer;
   Prime_Num_Largest : Long_Integer;

   N                 : constant Long_Integer := 600851475143;
   File_Name         : constant String       := "problems/003/PrimeNumbers_Upto_1000000";

begin

   Prime_Num_Max     := Long_Integer (Sqrt (Long_Float (N)));
   Prime_Num_Largest := N;

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop
      Get_Line (FT, Prime_Num, Last_Index);
      exit when Long_Integer'Value (Prime_Num (1 .. Last_Index)) > Prime_Num_Max;

      if (N mod Long_Integer'Value (Prime_Num (1 .. Last_Index))) = 0 then
         Prime_Num_Largest := Long_Integer'Value (Prime_Num (1 .. Last_Index));
      end if;

   end loop;

   Close (FT);

   New_Line (2);
   Put_Line (Long_Integer'Image (Prime_Num_Largest));
   New_Line (2);

end A003;
