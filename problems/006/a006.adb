with Ada.Text_IO;
use Ada.Text_IO;

procedure A006 is

   N, Sum, Square_Of_Sum, Sum_Of_Square : Integer;

begin

   N             := 100;
   Sum           := Integer ((N * (N + 1)) / 2);
   Square_Of_Sum := Sum * Sum;
   Sum_Of_Square := (N * (N + 1) * ((2 * N) + 1)) / 6;

   New_Line (2);
   Put_Line (Integer'Image (Square_Of_Sum - Sum_Of_Square));
   New_Line (2);

end A006;
