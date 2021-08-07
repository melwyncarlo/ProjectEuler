with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A031 is

   use Ada.Integer_Text_IO;

   Combinations : Integer := 0;

begin

   for I in 0 .. 1 loop
      for J in 0 .. 2 loop
         for K in 0 .. 4 loop
            for L in 0 .. 10 loop
               for M in 0 .. 20 loop
                  for N in 0 .. 40 loop
                     for O in 0 .. 100 loop
                        for P in 0 .. 200 loop
                           if ((I * 200) + (J * 100) + (K * 50) +  (L * 20)
                            +  (M *  10) + (N *   5) + (O *  2) +  P) = 200
                           then
                              Combinations := Combinations + 1;
                           end if;
                        end loop;
                     end loop;
                  end loop;
               end loop;
            end loop;
         end loop;
      end loop;
   end loop;

   Put (Combinations, Width => 0);

end A031;
