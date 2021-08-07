with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;
with Ada.Numerics.Long_Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A025 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;
   use Ada.Numerics.Long_Elementary_Functions;

   Fibonacci_Val        : array (Integer range 1 .. 3) of String (1 .. 1000) :=
                                (others => 1000 * "0");

   Summand_1, Summand_2 : String (1 .. 10);

   Val_1_Length         : Integer := 3;
   Val_2_Length         : Integer := 2;

   Summation            : Long_Integer;

   I, J, Str_Length, Val_0_Length, Temp_Index, Temp_Len : Integer;

begin

   Fibonacci_Val (1) (998)  := '1';
   Fibonacci_Val (1) (999)  := '4';
   Fibonacci_Val (1) (1000) := '4';
   Fibonacci_Val (2) (999)  := '8';
   Fibonacci_Val (2) (1000) := '9';
   Fibonacci_Val (3) (999)  := '5';
   Fibonacci_Val (3) (1000) := '5';

   I := 12;

   while Fibonacci_Val (1) (1) = '0' loop

      Fibonacci_Val (3) := Fibonacci_Val (2);
      Fibonacci_Val (2) := Fibonacci_Val (1);

      if Val_2_Length > Val_1_Length then
         Str_Length := Val_2_Length;
      else
         Str_Length := Val_1_Length;
      end if;

      Str_Length := Integer (Float'Floor (Float (Str_Length - 1) / 10.0)
                  + 1.0) * 10;

      Val_0_Length := 0;

      J := 1;
      while J < Str_Length loop

         Summand_1 := Fibonacci_Val (2) (992 - J .. 1001 - J);
         Summand_2 := Fibonacci_Val (3) (992 - J .. 1001 - J);

         Summation := Long_Integer'Value (Summand_1)
                    + Long_Integer'Value (Summand_2)
                    + ((Character'Pos (Fibonacci_Val (1) (1001 - J))
                      - Character'Pos ('0'))
                      * Boolean'Pos (J /= 1));

         Temp_Len := Integer (Long_Float'Floor (Log (Long_Float (Summation),
                     10.0))) + 1;

         Temp_Index := 991 - J;

         if Temp_Index = 0 then
            Temp_Index := 1;
            Move (Source  => Trim (Long_Integer'Image (Summation),
                             Ada.Strings.Both),
                  Target  => Fibonacci_Val (1) (Temp_Index .. Temp_Index + 9),
                  Justify => Ada.Strings.Right,
                  Pad     => '0');
         else
            Move (Source  => Trim (Long_Integer'Image (Summation),
                             Ada.Strings.Both),
                  Target  => Fibonacci_Val (1) (Temp_Index .. Temp_Index + 10),
                  Justify => Ada.Strings.Right,
                  Pad     => '0');
         end if;

         if J = (Str_Length - 9) then
            Val_0_Length := J + Temp_Len - 1;
         end if;

         J := J + 10;

      end loop;

      Val_2_Length := Val_1_Length;
      Val_1_Length := Val_0_Length;

      I := I + 1;

   end loop;

   Put (I, Width => 0);

end A025;
