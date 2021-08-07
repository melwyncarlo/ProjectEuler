with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A052 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Nx          : constant Integer := 6;
   N_Max       : constant Integer := 10;

   Num_Nx_Str  : array (Integer range   1 .. Nx) of
                                String (1 .. N_Max);
   Digits_Set_1, Digits_Set_2 : String (1 .. N_Max);

   Same_Digits : Boolean;

   N           : Integer := 6;
   Num_1x      : Integer := 125875;

   Num_Nx, Num_Max, Temp_Index : Integer;

begin

   while N /= N_Max loop

      Num_Max := Integer (Float'Floor (5.0 * (10.0 ** (N - 1)) / 3.0));

      while Num_1x <= Num_Max loop

         Num_Nx     := 0;

         Digits_Set_1 := N_Max * '0';

         for K in 1 .. Nx loop

            Num_Nx := Num_Nx + Num_1x;
            Num_Nx_Str (K) (1 .. N) := Trim (Integer'Image (Num_Nx),
                                       Ada.Strings.Both);

            Digits_Set_2 := N_Max * '0';

            for L in 1 .. Nx loop
               Temp_Index := Character'Pos (Num_Nx_Str (K) (L))
                           - Character'Pos ('0')
                           + 1;
               Digits_Set_2 (Temp_Index) := '1';
            end loop;

            if K = 1 then
               Digits_Set_1 := Digits_Set_2;
               goto Continue;
            end if;

            Same_Digits := True;

            if Digits_Set_1 /= Digits_Set_2 then
               Same_Digits := False;
               exit;
            end if;

            <<Continue>>

         end loop;

         if Same_Digits then
            exit;
         end if;

         Num_1x := Num_1x + 1;

      end loop;

      if Same_Digits then
         exit;
      end if;

      N := N + 1;

   end loop;

   Put (Num_1x, Width => 0);

end A052;
