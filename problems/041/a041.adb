with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A041 is

   use Ada.Text_IO;
   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   Digit : constant String (1 .. 9) := "123456789";

   FT            : File_Type;
   Last_Index    : Natural;
   Prime_Num     : String (1 .. 10);
   File_Name     : constant String := "problems/003/PrimeNumbers_Upto_1000000";

   Largest_Pandigital_Prime : Integer := 0;

   Is_Pandigital : Boolean;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Prime_Num, Last_Index);

      if Integer'Value (Prime_Num (1 .. Last_Index)) > 7654321 then
         exit;
      end if;

      Is_Pandigital := True;

      for I in 1 .. Last_Index loop
         if Index (Prime_Num (1 .. Last_Index), Digit (I .. I)) = 0 then
            Is_Pandigital := False;
            exit;
         end if;
      end loop;

      if Is_Pandigital then
         if Integer'Value (Prime_Num (1 .. Last_Index))
          > Largest_Pandigital_Prime
         then
            Largest_Pandigital_Prime := Integer'Value (
                                        Prime_Num (1 .. Last_Index));
         end if;
      end if;

   end loop;

   Close (FT);

   Put (Largest_Pandigital_Prime, Width => 0);

end A041;
