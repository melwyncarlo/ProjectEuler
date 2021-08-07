with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A042 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;
   use Ada.Numerics.Elementary_Functions;

   --  File Reference: http://www.naturalnumbers.org/primes.html

   FT                : File_Type;
   Ch                : Character;
   File_Name         : constant String := "problems/042/p042_words.txt";

   Count_Val         : Integer :=  0;
   Index_Val         : Integer := -1;
   Word_Val          : Integer :=  0;

   Is_Incremented    : Boolean := False;

   Sqrt_Term, N_Term : Float;

begin

   Open (FT, In_File, File_Name);

   Get (FT, Ch);

   while not End_Of_File (FT) loop

      Get (FT, Ch);

      if Ch in 'A' .. 'Z' or Ch in 'a' .. 'z' then

            Word_Val       := Word_Val  + Character'Pos (Ch) - 64;
            Index_Val      := Index_Val + 1;
            Is_Incremented := False;

      else

         if not Is_Incremented then

            Index_Val      := 0;
            Is_Incremented := True;

            Sqrt_Term := Sqrt (1.0 + (8.0 * Float (Word_Val)));
            Word_Val  := 0;

            if (Sqrt_Term - Float (Integer (Sqrt_Term))) = 0.0 then

               N_Term := (Sqrt_Term - 1.0) / 2.0;

               if (N_Term - Float (Integer (N_Term))) = 0.0 then
                  Count_Val := Count_Val + 1;
               end if;

            end if;

         end if;

      end if;

   end loop;

   Close (FT);

   Put (Count_Val, Width => 0);

end A042;
