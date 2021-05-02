with Ada.Text_IO;
use Ada.Text_IO;

-- Copyright 2021 Melwyn Francis Carlo

procedure A001 is

   Val_1A, Val_1B, Val_2A, Val_2B, Val_3A, Val_3B : FLoat;

begin

   Val_1A := Float'Floor ((1000.0 - 1.0) / 3.0);
   Val_1B := 3.0 * ((Val_1A * (Val_1A + 1.0)) / 2.0);
   Val_2A := Float'Floor ((1000.0 - 1.0) / 5.0);
   Val_2B := 5.0 * ((Val_2A * (Val_2A + 1.0)) / 2.0);
   Val_3A := Float'Floor ((1000.0 - 1.0) / 15.0);
   Val_3B := 15.0 * ((Val_3A * (Val_3A + 1.0)) / 2.0);

   New_Line (2);
   Put_Line (Integer'Image (Integer (Val_1B + Val_2B - Val_3B)));
   New_Line (2);

end A001;
