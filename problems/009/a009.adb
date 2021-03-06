with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A009 is

   use Ada.Integer_Text_IO;

   B             : Float;
   A, C, Product : Integer;

begin

   A := 1;
   loop
      B := (5.0E+5 - (1.0E+3 * Float (A))) / (1.0E+3 - Float (A));

      if (B - Float (Integer (B))) = 0.0 and B > Float (A) then
         C := Integer (1000.0 - Float (A) - B);

         if B < Float (C) then
            Product := Integer (Float (A) * B * Float (C));
            exit;
         end if;

      end if;

      A := A + 1;
      if A = 1000 then
         A := A + 1;
      end if;

   end loop;

   Put (Product, Width => 0);

end A009;
