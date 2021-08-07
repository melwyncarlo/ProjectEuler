with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A044 is

   use Ada.Integer_Text_IO;
   use Ada.Numerics.Elementary_Functions;

   Max_N  : constant Integer := 5E3;

   Min_Pd : Integer := 1E7;

   P1, P2, P1pp2, P1mp2 : Integer;

   Sqrt_term : Float;

begin

   for I in 1 .. Max_N loop

      P1 := Integer (Float'Floor (0.5E0 * Float (I)
          * ((3.0E0 * Float (I)) - 1.0E0)));

      for J in (I + 1) .. Max_N loop

         P2 := Integer (Float'Floor ((0.5E0 * Float (J)
             * ((3.0E0 * Float (J)) - 1.0E0))));

         P1pp2 := P1 + P2;

         Sqrt_term := Sqrt (1.0E0 + (24.0E0 * Float (P1pp2)));

         if Sqrt_term = Float'Floor (Sqrt_term) then

            if ((Integer (Sqrt_term) + 1) mod 6) = 0 then

               P1mp2 := P2 - P1;

               Sqrt_term := Sqrt (1.0E0 + (24.0E0 * Float (P1mp2)));

               if Sqrt_term = Float'Floor (Sqrt_term) then

                  if ((Integer (Sqrt_term) + 1) mod 6) = 0 then
                     if P1mp2 < Min_Pd then
                        Min_Pd := P1mp2;
                     end if;
                  end if;

               end if;

            end if;

         end if;

      end loop;

   end loop;

   Put (Min_Pd, Width => 0);

end A044;
