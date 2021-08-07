with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A006 is

   use Ada.Integer_Text_IO;

   N, Sum, Square_Of_Sum, Sum_Of_Square : Integer;

begin

   N             := 100;
   Sum           := Integer ((N * (N + 1)) / 2);
   Square_Of_Sum := Sum * Sum;
   Sum_Of_Square := (N * (N + 1) * ((2 * N) + 1)) / 6;

   Put (Square_Of_Sum - Sum_Of_Square, Width => 0);

end A006;
