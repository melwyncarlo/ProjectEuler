with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A026 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Base_Number, Temp_Sub_Str_001,
                Temp_Sub_Str_002, Temp_Sub_Str_02 : String (1 .. 2000);

   Temp_Sub_Str_01 : String (1 .. 10);
   Base_Sub_Number : String (1 ..  8);

   I_Max : Integer :=  0;
   N     : Integer := 80;

   J, Carry_Val, Find_Length, Quotient : Integer;

begin

   for I in 11 .. 999 loop

      if (I mod 2) = 0 then
         goto Continue_I;
      end if;

      if (I mod 5) = 0 then
         goto Continue_I;
      end if;

      if (I mod 7) = 0 then
         goto Continue_I;
      end if;

      Base_Number     := 2000 * "0";
      Base_Number (1) := '1';

      J         := 1;
      Carry_Val := 0;
      while J <= 2000 loop

         Base_Sub_Number := 8 * " ";
         Move (Source  => Trim (Integer'Image (Carry_Val),
                          Ada.Strings.Both),
               Target  => Base_Sub_Number (1 .. 3),
               Justify => Ada.Strings.Right,
               Pad     => '0');
         Base_Sub_Number (4 .. 8) := Base_Number (J .. J + 4);
         Quotient  := Integer'Value (Base_Sub_Number);
         Carry_Val := Quotient mod I;
         Quotient  := Integer (Float'Floor (Float (Quotient) / Float (I)));

         Move (Source  => Trim (Integer'Image (Quotient),
                          Ada.Strings.Both),
               Target  => Base_Sub_Number (1 .. 5),
               Justify => Ada.Strings.Right,
               Pad     => '0');
         Base_Number (J .. J + 4) := Base_Sub_Number (1 .. 5);

         J := J + 5;

      end loop;

      J := 1;
      while Base_Number (J) = '0' loop
         J := J + 1;
      end loop;

      Find_Length := N;

      while J <= (2001 - Find_Length) loop

         Temp_Sub_Str_001 := 2000 * " ";
         Temp_Sub_Str_002 := 2000 * " ";

         Temp_Sub_Str_001 (1 .. Find_Length) :=
            Base_Number (J .. J + Find_Length - 1);

         Temp_Sub_Str_002 (1 .. 2001 - Find_Length - J) :=
            Base_Number (J + Find_Length .. 2000);

         if Index (Temp_Sub_Str_002,
                   Temp_Sub_Str_001 (1 .. Find_Length))
         /= 0
         then

            Temp_Sub_Str_02 := 2000 * " ";

            Temp_Sub_Str_01 := Temp_Sub_Str_001 (1 .. 10);

            Temp_Sub_Str_02 (1 .. Find_Length - 10) :=
               Temp_Sub_Str_001 (11 .. Find_Length);

            if Index (Temp_Sub_Str_02, Temp_Sub_Str_01) = 0 then

               N           := Find_Length;
               Find_Length := Find_Length + 1;

               if Temp_Sub_Str_002 (Index (Temp_Sub_Str_002,
                                           Temp_Sub_Str_001 (1 .. N))
                                        .. 2001 - N - J)
               =  Temp_Sub_Str_002 (1 .. 2001 - N - J)
               then

                  I_Max := I;
                  exit;
               else
                  goto Continue_J;
               end if;

            end if;

         end if;

         J := J + 1;

         <<Continue_J>>

      end loop;

      <<Continue_I>>

   end loop;

   Put (I_Max, Width => 0);

end A026;
