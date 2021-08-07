with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A039 is

   use Ada.Integer_Text_IO;

   P_Max_Solutions : Integer := 0;
   N_Max_Solutions : Integer := 0;

   B, N            : Integer;

   A, B2, P2       : Float;

begin

   for P in reverse 500 .. 1000 loop

      B := 1;
      N := 0;

      loop

         if B = Integer (Float (P) / 2.0) then
            exit;
         end if;

         P2 := Float (P);
         B2 := Float (B);

         A := ((P2 * P2) - (2.0 * P2 * B2)) / ((2.0 * P2) - (2.0 * B2));

         if Float'Floor (A) = A then
            N := N + 1;
         end if;

         B := B + 1;

      end loop;

      if N > N_Max_Solutions then
         N_Max_Solutions := N;
         P_Max_Solutions := P;
      end if;

   end loop;

   Put (P_Max_Solutions, Width => 0);

end A039;
