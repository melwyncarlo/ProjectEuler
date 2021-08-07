with Ada.Long_Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A015 is

   use Ada.Long_Integer_Text_IO;

   Input_Grid_Dimension : constant Integer := 20;

   Routes_N : Long_Float := 1.0;

begin

   for I in 1 .. Input_Grid_Dimension loop
      Routes_N := Routes_N * (Long_Float (I + Input_Grid_Dimension)
                / Long_Float (I));
   end loop;

   Put (Long_Integer (Long_Float'Ceiling (Routes_N)), Width => 0);

end A015;
