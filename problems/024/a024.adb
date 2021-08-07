with Ada.Text_IO;
with Ada.Strings.Fixed;

--  Copyright 2021 Melwyn Francis Carlo

procedure A024 is

   use Ada.Text_IO;
   use Ada.Strings.Fixed;

   N_Max : constant Integer := 10;
   I     : constant Integer := 1_000_000;

   Numbers : array (Integer range 1 .. N_Max) of String (1 .. 1) :=
             ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");

   N               : Integer      := N_Max;
   N_Product       : Long_Integer := Long_Integer (N_Max);
   Max_Permutation : Long_Integer := 1;

   Digits_Val      : String (1 .. N_Max) := N_Max * "0";

   Index_Val       : Integer;

begin

   for J in 2 .. N_Max loop
      Max_Permutation := Max_Permutation * Long_Integer (J);
   end loop;

   Index_Val := Integer (Float'Floor (Float ((I - 1) * Integer (N_Product))
              / Float (Max_Permutation))) + 1;

   Digits_Val (1 .. 1) := Numbers (Index_Val);

   for J in 2 .. N_Max loop

      N := N - 1;
      N_Product := N_Product * Long_Integer (N);

      if Index_Val < (N_Max - 1) then
         Numbers (Index_Val .. (N_Max - 1)) := Numbers ((Index_Val + 1)
                                            .. N_Max);
      end if;

      Index_Val := (Integer (Float'Floor (Float (Long_Integer (I - 1)
                 * N_Product) / Float (Max_Permutation))) mod N) + 1;

      Digits_Val (J .. J) := Numbers (Index_Val);

   end loop;

   Put (Digits_Val);

end A024;
