with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A033 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Products_List    : array (Integer range 1 .. 4, 1 .. 2) of Integer;

   Value_1, Value_2 : Float;

   Count_Val        : Integer := 1;

   Reduced          : Boolean;

   I, Temp_Num_11, Temp_Num_12, Temp_Num_21,
      Temp_Num_22, Temp_Num_3,  Temp_Num_4 : Integer;

begin

   for I in 10 .. 50 loop

      for J in 10 .. 99 loop

         if I >= J or (I mod 10) = 0 or (J mod 10) = 0 then
            goto Continue;
         end if;

         Temp_Num_11 := Character'Pos (Trim (Integer'Image (I),
                        Ada.Strings.Both) (1)) - Character'Pos ('0');

         Temp_Num_12 := Character'Pos (Trim (Integer'Image (I),
                        Ada.Strings.Both) (2)) - Character'Pos ('0');

         Temp_Num_21 := Character'Pos (Trim (Integer'Image (J),
                        Ada.Strings.Both) (1)) - Character'Pos ('0');

         Temp_Num_22 := Character'Pos (Trim (Integer'Image (J),
                        Ada.Strings.Both) (2)) - Character'Pos ('0');

         Temp_Num_3  := 99999;
         Temp_Num_4  := 99999;

         if Temp_Num_11 = Temp_Num_21 and Temp_Num_12 /= Temp_Num_22 then

            Temp_Num_3 := Temp_Num_12;
            Temp_Num_4 := Temp_Num_22;

         elsif Temp_Num_11 = Temp_Num_22 and Temp_Num_12 /= Temp_Num_21 then

            Temp_Num_3 := Temp_Num_12;
            Temp_Num_4 := Temp_Num_21;

         elsif Temp_Num_12 = Temp_Num_21 and Temp_Num_11 /= Temp_Num_22 then

            Temp_Num_3 := Temp_Num_11;
            Temp_Num_4 := Temp_Num_22;

         elsif Temp_Num_12 = Temp_Num_22 and Temp_Num_11 /= Temp_Num_21 then

            Temp_Num_3 := Temp_Num_11;
            Temp_Num_4 := Temp_Num_21;

         end if;

         if Temp_Num_3 /= 99999 then

            Value_1 := (Float'Floor (Float (I) * 1.0E5 / Float (J))) / 1.0E5;
            Value_2 := (Float'Floor (Float (Temp_Num_3) * 1.0E5 /
                        Float (Temp_Num_4))) / 1.0E5;

            if  (Value_1 - Value_2) <  1.0E-5
            and (Value_1 - Value_2) > -1.0E-5
            then
               Products_List (Count_Val, 1) := I;
               Products_List (Count_Val, 2) := J;
               Count_Val := Count_Val + 1;
            end if;

         end if;

         <<Continue>>

      end loop;

   end loop;

      Products_List (1, 1) := Products_List (1, 1) * Products_List (2, 1)
                            * Products_List (3, 1) * Products_List (4, 1);

      Products_List (1, 2) := Products_List (1, 2) * Products_List (2, 2)
                            * Products_List (3, 2) * Products_List (4, 2);

   while Products_List (1, 1) /= 1 and Products_List (1, 2) /= 1 loop

      I := 2;
      Reduced := False;

      while not Reduced loop

         if  (Products_List (1, 1) mod I) = 0
         and (Products_List (1, 2) mod I) = 0
         then
            Products_List (1, 1) := Products_List (1, 1) / I;
            Products_List (1, 2) := Products_List (1, 2) / I;
            Reduced := True;
         else
            I := I + 1;
         end if;

      end loop;

   end loop;

   Put (Products_List (1, 2), Width => 0);

end A033;
