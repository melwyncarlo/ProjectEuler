with Ada.Long_Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A010 is

   use Ada.Long_Integer_Text_IO;

   N          : constant Integer := 2E+6;
   Primes_Sum : Long_Integer     := 0;
   I, J       : Integer;

   type Large_Array_Bool is array (Integer range 1 .. N + 1) of Boolean;

   Integers_List : Large_Array_Bool := (others => True);

begin

   --  Using the algorithm of Sieve of Eratosthenes

   I := 2;
   while (I * I) <= N loop

      if Integers_List (I) then
         J := I * I;

         while J <= N loop
            Integers_List (J) := False;
            J := J + I;
         end loop;

      end if;

      I := I + 1;
   end loop;

   for K in 2 .. N loop

      if Integers_List (K) then
         Primes_Sum := Primes_Sum + Long_Integer (K);
      end if;

   end loop;

   Put (Primes_Sum, Width => 0);

end A010;
