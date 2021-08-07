with Ada.Text_IO;
with Ada.Strings.Fixed;

--  Copyright 2021 Melwyn Francis Carlo

procedure A048 is

   use Ada.Text_IO;
   use Ada.Strings.Fixed;

   Max_N              : constant Integer := 1000;

   Sum_Val            : String (1 .. 10) := "0000000001";

   Temp_Str           : String (1 .. 20);
   Product_Val        : String (1 .. 10);

   Sub_Product_Sum    : array (Integer range 1 .. 10) of String (1 .. 10);

   Carry_Val, Temp_Val, Sub_Product, Sub_Product_Len : Integer;

begin

   for I in 2 .. Max_N loop

      if (I mod 10) /= 0 then

         Product_Val := "0000000001";

         for J in 1 .. I loop

            Sub_Product_Sum := (others => ("0000000000"));

            for K in reverse 1 .. 10 loop

               Sub_Product     := (Character'Pos (Product_Val (K))
                                -  Character'Pos ('0'))
                                * I;

               Sub_Product_Len := Trim (Integer'Image (Sub_Product),
                                  Ada.Strings.Both)'Length;

               if Sub_Product_Len < 10 then

                  Temp_Str (1 .. (10 - Sub_Product_Len))  :=
                  (10 - Sub_Product_Len) * "0";

                  Temp_Str ((11 - Sub_Product_Len) .. 10) :=
                  Trim (Integer'Image (Sub_Product), Ada.Strings.Both);

                  Sub_Product_Len := 10;

               else
                  Temp_Str := Integer'Image (Sub_Product);
               end if;

               Sub_Product_Sum (K) (1 .. K) :=
               Temp_Str ((Sub_Product_Len - K + 1) .. Sub_Product_Len);

            end loop;

            Carry_Val := 0;

            for L in reverse 1 .. 10 loop

               Temp_Val := Character'Pos (Sub_Product_Sum (1) (L))
                         + Character'Pos (Sub_Product_Sum (2) (L))
                         + Character'Pos (Sub_Product_Sum (3) (L))
                         + Character'Pos (Sub_Product_Sum (4) (L))
                         + Character'Pos (Sub_Product_Sum (5) (L))
                         + Character'Pos (Sub_Product_Sum (6) (L))
                         + Character'Pos (Sub_Product_Sum (7) (L))
                         + Character'Pos (Sub_Product_Sum (8) (L))
                         + Character'Pos (Sub_Product_Sum (9) (L))
                         + Character'Pos (Sub_Product_Sum (10) (L))
                         - (Character'Pos ('0') * 10)
                         + Carry_Val;

               Carry_Val := Integer (Float'Floor (
                                    Float (Temp_Val) / 10.0));

               Product_Val (L) := Character'Val (
                                  Character'Pos ('0') + (Temp_Val mod 10));

            end loop;

         end loop;

         Carry_Val := 0;

         for J in reverse 1 .. 10 loop
            Temp_Val    := Character'Pos (Sum_Val (J))
                         + Character'Pos (Product_Val (J))
                         - Character'Pos ('0')
                         - Character'Pos ('0')
                         + Carry_Val;
            Carry_Val   := Integer (Float'Floor (Float (Temp_Val) / 10.0));
            Sum_Val (J) := Character'Val (
                          Character'Pos ('0') + (Temp_Val mod 10));
         end loop;

      end if;

   end loop;

   Put (Sum_Val);

end A048;
