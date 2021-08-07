with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A030 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Sum           : Integer := 0;
   Sum_Of_Powers : Integer := 0;

   Num_len       : Integer;

begin

   for I in 2 .. 1_000_000 loop

      Sum_Of_Powers := 0;

      Num_len := Trim (Integer'Image (I), Ada.Strings.Both)'Length;

      for J in 1 .. Num_len loop
         Sum_Of_Powers := Sum_Of_Powers
                        + ((Character'Pos (Trim (Integer'Image (I),
                          Ada.Strings.Both) (J)) - Character'Pos ('0')) ** 5);
      end loop;

      if Sum_Of_Powers = I then
         Sum := Sum + I;
      end if;

   end loop;

   Put (Sum, Width => 0);

end A030;
