with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A005 is

   use Ada.Integer_Text_IO;

   I, N : Integer;

begin

   I := 1;

   loop
      --  Based on the rules of divisibility, not all numbers from 1 to 20
      --  have to be tested against.
      N := 20 * I;
      exit when ((N mod 19) = 0) and ((N mod 17) = 0) and ((N mod 16) = 0)
            and ((N mod 13) = 0) and ((N mod 11) = 0) and ((N mod 9) = 0)
            and ((N mod 8) = 0)  and ((N mod 7) = 0);
      I := I + 1;
   end loop;

   Put (N, Width => 0);

end A005;
