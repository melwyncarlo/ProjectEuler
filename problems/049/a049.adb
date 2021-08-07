with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A049 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   N                 : constant Integer := 10;

   FT                : File_Type;
   Last_Index        : Natural;
   Prime_Num         : String (1 .. 10);
   File_Name         : constant String :=
                      "problems/003/PrimeNumbers_Upto_1000000";

   Primes_Nums : array (Integer range 1 .. 1200,
                        Integer range 1 .. N) of Integer
                        := (others => (others => 0));

   Primes_Digits_Occurrences : array (Integer range 1 .. 1200) of Integer
                                      := (others => 0);

   Prime_Digits : String (1 .. N) := (others => Character'Val (0));

   Primes_Digits : array (Integer range 1 .. 1200) of String (1 .. N)
                          := (others => (others => Character'Val (0)));

   Duplicate_Found : Boolean;

   I, J, K, L, M : Integer;

begin

   I := 1;

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Prime_Num, Last_Index);

      if Integer'Value (Prime_Num (1 .. Last_Index)) >= 1000 then

         if Integer'Value (Prime_Num (1 .. Last_Index)) <= 9999 then

            Prime_Digits := "0000000000";

            Prime_Digits (Integer'Value (Prime_Num (1 .. 1)) + 1) := '1';
            Prime_Digits (Integer'Value (Prime_Num (2 .. 2)) + 1) := '1';
            Prime_Digits (Integer'Value (Prime_Num (3 .. 3)) + 1) := '1';
            Prime_Digits (Integer'Value (Prime_Num (4 .. 4)) + 1) := '1';

            Duplicate_Found := False;

            for J in 1 .. I loop

               if Primes_Digits (J) = Prime_Digits then

                  if Primes_Nums (J, N) = 0 then

                     for K in 2 .. N loop
                        if Primes_Nums (J, K) = 0 then
                           Primes_Nums (J, K) := Integer'Value (
                                                 Prime_Num (1 .. Last_Index));
                           exit;
                        end if;
                     end loop;

                     Primes_Digits_Occurrences (J) :=
                     Primes_Digits_Occurrences (J) + 1;

                  end if;

                  Duplicate_Found := True;
                  exit;

               end if;

            end loop;

            if not Duplicate_Found then
               Primes_Digits_Occurrences (I) := 0;
               Primes_Nums (I, 1) := Integer'Value (
                                     Prime_Num (1 .. Last_Index));
               Primes_Digits (I)  := Prime_Digits;
               I := I + 1;
            end if;

         end if;

      end if;

   end loop;

   Close (FT);

   J := 1;
   K := 1;
   L := 1;
   M := 1;

   J_Loop :
      while J <= I loop

         if Primes_Digits_Occurrences (J) >= 3 then

            K := 1;
            while K <= (N - 2) loop

               if Primes_Nums (J, K) = 0 then
                  exit;
               end if;

               if Primes_Nums (J, K) /= 1487 then

                  L := K + 1;
                  while L <= (N - 1) loop

                     if Primes_Nums (J, L) = 0 then
                        exit;
                     end if;

                     M := L + 1;
                     while M <= N loop

                        if Primes_Nums (J, M) = 0 then
                           exit;
                        end if;

                        if (Primes_Nums (J, M) - Primes_Nums (J, L)) =
                           (Primes_Nums (J, L) - Primes_Nums (J, K))
                        then
                           exit J_Loop;
                        end if;

                        M := M + 1;

                     end loop;

                     L := L + 1;

                  end loop;

               end if;

               K := K + 1;

            end loop;

         end if;

         J := J + 1;

      end loop J_Loop;

   Put (Primes_Nums (J, K), Width => 0);
   Put (Primes_Nums (J, L), Width => 0);
   Put (Primes_Nums (J, M), Width => 0);

end A049;
