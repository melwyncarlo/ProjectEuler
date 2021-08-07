with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A016 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   N_Str          : array (Integer range 1 .. 500) of Character :=
                    ('1', '0', '2', '4', others => '0');

   Products_Array : array (Integer range 1 .. 500,
                           Integer range 1 .. 500) of Character;

   Temp_Product   : String (1 .. 4);

   Sum_Of_Digits  : Integer := 0;
   Str_Length     : Integer := 4;

   Temp_Sum       : Integer;

begin

   for I in 2 .. 100 loop

      for J in reverse 1 .. Str_Length loop

         Temp_Sum     := 1024 * (Character'Pos (N_Str (J))
                              -  Character'Pos ('0'));
         Temp_Product := "0000";
         if (Temp_Sum > 0) then
            Temp_Product := Trim (Integer'Image (Temp_Sum),
                            Ada.Strings.Both) (1 .. 4);
         end if;

         for K1 in 1 .. J loop
            Products_Array (J, K1) := '0';
         end loop;

         for K2 in (J + 1) .. (J + 4) loop
            Products_Array (J, K2) := Temp_Product (K2 - J);
         end loop;

         for K3 in (J + 5) .. (Str_Length + 4) loop
            Products_Array (J, K3) := '0';
         end loop;

      end loop;

      N_Str := (others => '0');

      for K in reverse 2 .. (Str_Length + 4) loop

         Temp_Sum := 0;

         for J in 1 .. Str_Length loop
            Temp_Sum := Temp_Sum
                      + Character'Pos (Products_Array (J, K))
                      - Character'Pos ('0');
         end loop;

         Temp_Sum := Temp_Sum
                   + Character'Pos (N_Str (K))
                   - Character'Pos ('0');

         N_Str (K)     := Character'Val ((Temp_Sum mod 10)
                        + Character'Pos ('0'));

         N_Str (K - 1) := Character'Val (Integer (Float'Floor (
                          Float (Temp_Sum) / 10.0)) + Character'Pos ('0'));

      end loop;

      Str_Length := Str_Length + 4;

   end loop;

   for I in 1 .. Str_Length loop
      Sum_Of_Digits := Sum_Of_Digits
                     + Character'Pos (N_Str (I))
                     - Character'Pos ('0');
   end loop;

   Put (Sum_Of_Digits, Width => 0);

end A016;
