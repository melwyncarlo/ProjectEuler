with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A067 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   FT                : File_Type;
   Last_Index        : Natural;
   File_Name         : constant String :=
                      "problems/067/p067_triangle.txt";
   Triangle_Num_Row  : String (1 .. 300);
   Triangle_Num      : String (1 ..   2);

   Triangle : array (Integer range 1 .. 100,
                     Integer range 1 .. 100) of Integer;

   I                 : Integer := 1;
   J, Digits_N       : Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Triangle_Num_Row, Last_Index);

         J        := 1;
         Digits_N := 1;

         for Digits_I in 1 .. Last_Index + 1 loop

            if Digits_N <= 2 then
               Triangle_Num (Digits_N) := Triangle_Num_Row (Digits_I);
               Digits_N := Digits_N + 1;
            else
               Triangle (I, J) := Integer'Value (Triangle_Num);
               Digits_N := 1;
               J := J + 1;
            end if;

         end loop;

      if J <= 100 then
         while J /= 100 loop
            Triangle (I, J) := 0;
            J := J + 1;
         end loop;
      end if;

      I := I + 1;

   end loop;

   Close (FT);

   for I in reverse 1 .. 99 loop

      for J in 1 .. I loop

         if Triangle (I + 1, J) >= Triangle (I + 1, J + 1) then
            Triangle (I, J) := Triangle (I, J) + Triangle (I + 1, J);
         else
            Triangle (I, J) := Triangle (I, J) + Triangle (I + 1, J + 1);
         end if;

      end loop;

   end loop;

   Put (Triangle (1, 1), Width => 0);

end A067;
