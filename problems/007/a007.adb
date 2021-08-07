with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A007 is

   use Ada.Integer_Text_IO;

   Nth          : constant Integer := 10001;
   N            : constant Integer := 1E+6;
   Primes_N     : Integer          := 0;
   I, J, Result : Integer;

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

   Loop_K :
      for K in 2 .. N loop

         if Integers_List (K) then
            Primes_N := Primes_N + 1;

            if Primes_N = Nth then
               Result := K;
               exit Loop_K;
            end if;

         end if;

      end loop Loop_K;

   Put (Result, Width => 0);

end A007;
