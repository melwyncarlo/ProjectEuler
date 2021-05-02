with Ada.Text_IO;
use Ada.Text_IO;

-- Copyright 2021 Melwyn Francis Carlo

procedure A007 is

   Nth      : constant Integer := 10001;
   N        : constant Integer := 1E+6;
   Primes_N : Integer          := 0;
   I, J     : Integer;

   type Large_Array_Bool is array (Integer range 1 .. N + 1) of Boolean;

   Integers_List : Large_Array_Bool := (others => True);

begin

   -- Using the algorithm of Sieve of Eratosthenes

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
         Primes_N := Primes_N + 1;

         if Primes_N = Nth then
            New_Line (2);
            Put_Line (Integer'Image (K));
            New_Line (2);
            return;
         end if;

      end if;

   end loop;

end A007;
