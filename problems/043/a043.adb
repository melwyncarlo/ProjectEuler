with Ada.Long_Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A043 is

   use Ada.Long_Integer_Text_IO;

   Main_Num  : String (1 .. 10) := "0123456789";
   Temp_Char : String (1 ..  1);

   Pandigital_Num_List : array (Integer range 1 .. 100) of Long_Integer :=
   (others => 0);

   Sum       : Long_Integer := 0;

   Count_Val : Integer := 1;

   Duplicate_Found : Boolean;

begin

   for I in 1 .. 10 loop

      Temp_Char           := Main_Num (10 .. 10);
      Main_Num (10 .. 10) := Main_Num (9  ..  9);
      Main_Num (9  ..  9) := Main_Num (8  ..  8);
      Main_Num (8  ..  8) := Main_Num (7  ..  7);
      Main_Num (7  ..  7) := Main_Num (6  ..  6);
      Main_Num (6  ..  6) := Main_Num (5  ..  5);
      Main_Num (5  ..  5) := Main_Num (4  ..  4);
      Main_Num (4  ..  4) := Main_Num (3  ..  3);
      Main_Num (3  ..  3) := Main_Num (2  ..  2);
      Main_Num (2  ..  2) := Main_Num (1  ..  1);
      Main_Num (1  ..  1) := Temp_Char;

      for J in 1 .. 9 loop

         Temp_Char           := Main_Num (10 .. 10);
         Main_Num (10 .. 10) := Main_Num (9  ..  9);
         Main_Num (9  ..  9) := Main_Num (8  ..  8);
         Main_Num (8  ..  8) := Main_Num (7  ..  7);
         Main_Num (7  ..  7) := Main_Num (6  ..  6);
         Main_Num (6  ..  6) := Main_Num (5  ..  5);
         Main_Num (5  ..  5) := Main_Num (4  ..  4);
         Main_Num (4  ..  4) := Main_Num (3  ..  3);
         Main_Num (3  ..  3) := Main_Num (2  ..  2);
         Main_Num (2  ..  2) := Temp_Char;

         for K in 1 .. 8 loop

            Temp_Char           := Main_Num (10 .. 10);
            Main_Num (10 .. 10) := Main_Num (9  ..  9);
            Main_Num (9  ..  9) := Main_Num (8  ..  8);
            Main_Num (8  ..  8) := Main_Num (7  ..  7);
            Main_Num (7  ..  7) := Main_Num (6  ..  6);
            Main_Num (6  ..  6) := Main_Num (5  ..  5);
            Main_Num (5  ..  5) := Main_Num (4  ..  4);
            Main_Num (4  ..  4) := Main_Num (3  ..  3);
            Main_Num (3  ..  3) := Temp_Char;

            for L in 1 .. 7 loop

               Temp_Char           := Main_Num (10 .. 10);
               Main_Num (10 .. 10) := Main_Num (9  ..  9);
               Main_Num (9  ..  9) := Main_Num (8  ..  8);
               Main_Num (8  ..  8) := Main_Num (7  ..  7);
               Main_Num (7  ..  7) := Main_Num (6  ..  6);
               Main_Num (6  ..  6) := Main_Num (5  ..  5);
               Main_Num (5  ..  5) := Main_Num (4  ..  4);
               Main_Num (4  ..  4) := Temp_Char;

               for M in 1 .. 6 loop

                  Temp_Char           := Main_Num (10 .. 10);
                  Main_Num (10 .. 10) := Main_Num (9  ..  9);
                  Main_Num (9  ..  9) := Main_Num (8  ..  8);
                  Main_Num (8  ..  8) := Main_Num (7  ..  7);
                  Main_Num (7  ..  7) := Main_Num (6  ..  6);
                  Main_Num (6  ..  6) := Main_Num (5  ..  5);
                  Main_Num (5  ..  5) := Temp_Char;

                  for N in 1 .. 5 loop

                     Temp_Char           := Main_Num (10 .. 10);
                     Main_Num (10 .. 10) := Main_Num (9  ..  9);
                     Main_Num (9  ..  9) := Main_Num (8  ..  8);
                     Main_Num (8  ..  8) := Main_Num (7  ..  7);
                     Main_Num (7  ..  7) := Main_Num (6  ..  6);
                     Main_Num (6  ..  6) := Temp_Char;

                     for O in 1 .. 4 loop

                        Temp_Char           := Main_Num (10 .. 10);
                        Main_Num (10 .. 10) := Main_Num (9  ..  9);
                        Main_Num (9  ..  9) := Main_Num (8  ..  8);
                        Main_Num (8  ..  8) := Main_Num (7  ..  7);
                        Main_Num (7  ..  7) := Temp_Char;

                        for P in 1 .. 3 loop

                           Temp_Char           := Main_Num (10 .. 10);
                           Main_Num (10 .. 10) := Main_Num (9  ..  9);
                           Main_Num (9  ..  9) := Main_Num (8  ..  8);
                           Main_Num (8  ..  8) := Temp_Char;

                           for Q in 1 .. 2 loop

                              Temp_Char           := Main_Num (10 .. 10);
                              Main_Num (10 .. 10) := Main_Num (9  ..  9);
                              Main_Num (9  ..  9) := Temp_Char;

                              if  Main_Num (6 .. 6) /= "5"
                              and Main_Num (6 .. 6) /= "0"
                              then
                                 goto Continue;
                              end if;

                              if Integer'Value (Main_Num (4 .. 4)) mod 2 /= 0
                              then
                                 goto Continue;
                              end if;

                              if (Integer'Value (Main_Num (3 .. 3))
                              +   Integer'Value (Main_Num (4 .. 4))
                              +   Integer'Value (Main_Num (5 .. 5))) mod 3 /= 0
                              then
                                 goto Continue;
                              end if;

                              if Integer'Value (Main_Num (5 .. 7)) mod 7 /= 0
                              then
                                 goto Continue;
                              end if;

                              if Integer'Value (Main_Num (6 .. 8)) mod 11 /= 0
                              then
                                 goto Continue;
                              end if;

                              if Integer'Value (Main_Num (7 .. 9)) mod 13 /= 0
                              then
                                 goto Continue;
                              end if;

                              if Integer'Value (Main_Num (8 .. 10)) mod 17 /= 0
                              then
                                 goto Continue;
                              end if;

                              Duplicate_Found := False;

                              for R in 1 .. Count_Val loop
                                 if Pandigital_Num_List (R)
                                 =  Long_Integer'Value (Main_Num)
                                 then

                                    Duplicate_Found := True;
                                    exit;

                                 end if;
                              end loop;

                              if not Duplicate_Found then

                                 Pandigital_Num_List (Count_Val) :=
                                 Long_Integer'Value (Main_Num);

                                 Sum := Sum
                                      + Long_Integer'Value (Main_Num);
                                 Count_Val := Count_Val + 1;

                              end if;

                              <<Continue>>

                           end loop;
                        end loop;
                     end loop;
                  end loop;
               end loop;
            end loop;
         end loop;
      end loop;
   end loop;

   Put (Sum, Width => 0);

end A043;
