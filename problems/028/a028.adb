with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A028 is

   use Ada.Integer_Text_IO;

   N : constant Integer := 1001;
   C : constant Integer := Integer (Float'Floor (Float (N) / 2.0)) + 1;

   Spiral_Array : array (Integer range 1 .. N,
                         Integer range 1 .. N) of Integer;

   I : Integer := C;
   J : Integer := C;

   Sum       : Integer := 0;
   Count_Val : Integer := 2;
   Move_Val  : Integer := 1;
   Right_Val : Integer := 1;
   Down_Val  : Integer := 1;

   Go_Right  : Boolean := True;

begin

   Spiral_Array (I, J) := 1;

   while I > 1 or J < (N - 1) loop

      if (Go_Right) then

         for K in 1 .. Move_Val loop
            J := J + Right_Val;
            if J > N then
               exit;
            end if;
            Spiral_Array (I, J) := Count_Val;
            Count_Val := Count_Val + 1;
         end loop;

         Right_Val := Right_Val * (-1);
         Go_Right  := False;

      else

         for K in 1 .. Move_Val loop
            I := I + Down_Val;
            Spiral_Array (I, J) := Count_Val;
            Count_Val := Count_Val + 1;
         end loop;

         Move_Val := Move_Val + 1;
         Down_Val := Down_Val * (-1);
         Go_Right := True;

      end if;

   end loop;

   for I in 1 .. N loop
      Sum := Sum + Spiral_Array (I, I) + Spiral_Array (N - I + 1, I);
   end loop;

   Sum := Sum - Spiral_Array (C, C);

   Put (Sum, Width => 0);

end A028;
