with Ada.Text_IO;
use Ada.Text_IO;

procedure A010 is

   N          : constant Integer := 2E+6;
   Primes_Sum : Long_Integer     := 0;
   I, J       : Integer;

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
         Primes_Sum := Primes_Sum + Long_Integer (K);
      end if;

   end loop;

   New_Line (2);
   Put_Line (Long_Integer'Image (Primes_Sum));
   New_Line (2);

end A010;
