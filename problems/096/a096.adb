with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Characters.Handling;

--  Copyright 2021 Melwyn Francis Carlo

procedure A096 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;
   use Ada.Characters.Handling;

   File_Name            : constant String := "problems/096/p096_sudoku.txt";
   Last_Index           : Natural;
   Num_Str              : String (1 .. 10);
   FT                   : File_Type;

   Sum                  : Integer := 0;
   Index                : Integer := 0;
   Sub_Index            : Integer := 1;

   I, I2, J, J2         : Integer;

   Duplicate_Found      : Boolean;

   Is_Fixed_Cell        : array (Integer range 1 .. 9,
                                 Integer range 1 .. 9) of Boolean;

   Digit                : array (Integer range 1 .. 9,
                                 Integer range 1 .. 9,
                                 Integer range 1 .. 9) of Boolean;

   Sudoku               : array (Integer range 1 .. 50,
                                 Integer range 1 .. 9,
                                 Integer range 1 .. 9) of Integer;

begin

   Open (FT, In_File, File_Name);

   while not End_Of_File (FT) loop

      Get_Line (FT, Num_Str, Last_Index);

      if not Is_Digit (Num_Str (1)) then
         Sub_Index := 1;
         Index     := Index + 1;
         goto Next_Line;
      end if;

      for K in 1 .. 9 loop
         Sudoku (Index, Sub_Index, K) := Character'Pos (Num_Str (K))
                                       - Character'Pos ('0');
      end loop;
      Sub_Index := Sub_Index + 1;

      <<Next_Line>>

   end loop;

   Close (FT);

   for Puzzle in 1 .. 50 loop

      Is_Fixed_Cell := (others => (others => False));

      for I in 1 .. 9 loop
         for J in 1 .. 9 loop
            if Sudoku (Puzzle, I, J) /= 0 then
               Is_Fixed_Cell (I, J) := True;
            end if;
         end loop;
      end loop;

      Digit := (others => (others => (others => False)));

      I := 1;
      while I <= 9 loop
         J := 1;
         while J <= 9 loop

            if Is_Fixed_Cell (I, J) then
               J := J + 1;
               goto Continue;
            end if;

            I2 := (Integer ((I - 1) / 3) * 3) + 1;
            J2 := (Integer ((J - 1) / 3) * 3) + 1;

            Duplicate_Found := True;

            if not Digit (I, J, 1) or not Digit (I, J, 2)
            or not Digit (I, J, 3) or not Digit (I, J, 4)
            or not Digit (I, J, 5) or not Digit (I, J, 6)
            or not Digit (I, J, 7) or not Digit (I, J, 8)
            or not Digit (I, J, 9)
            then

               for K in 1 .. 9 loop

                  if Digit (I, J, K) then
                     goto Sub_Continue;
                  end if;

                  Duplicate_Found := False;

                  for L in 1 .. 9 loop
                     if L /= I then
                        if Sudoku (Puzzle, L, J) = K then
                           Duplicate_Found := True;
                           exit;
                        end if;
                     end if;
                     if L /= J then
                        if Sudoku (Puzzle, I, L) = K then
                           Duplicate_Found := True;
                           exit;
                        end if;
                     end if;
                  end loop;

                  if not Duplicate_Found then
                     if Sudoku (Puzzle, I2,     J2)     = K
                     or Sudoku (Puzzle, I2,     J2 + 1) = K
                     or Sudoku (Puzzle, I2,     J2 + 2) = K
                     or Sudoku (Puzzle, I2 + 1, J2)     = K
                     or Sudoku (Puzzle, I2 + 1, J2 + 1) = K
                     or Sudoku (Puzzle, I2 + 1, J2 + 2) = K
                     or Sudoku (Puzzle, I2 + 2, J2)     = K
                     or Sudoku (Puzzle, I2 + 2, J2 + 1) = K
                     or Sudoku (Puzzle, I2 + 2, J2 + 2) = K
                     then
                        Duplicate_Found := True;
                     end if;
                  end if;

                  if not Duplicate_Found then
                     Digit (I, J, K) := True;
                     Sudoku (Puzzle, I, J) := K;
                     exit;
                  end if;

                  <<Sub_Continue>>

               end loop;

            end if;

            if Duplicate_Found then
               for K in 1 .. 9 loop
                  Digit (I, J, K) := False;
               end loop;
               Sudoku (Puzzle, I, J) := 0;

               J := J - 1;
               if J = 0 then
                  J := 9;
                  I := I - 1;
               end if;

               while Is_Fixed_Cell (I, J) loop
                  J := J - 1;
                  if J = 0 then
                     J := 9;
                     I := I - 1;
                  end if;
               end loop;

            else
               J := J + 1;
            end if;

            <<Continue>>

         end loop;
         I := I + 1;
      end loop;

      Sum := Sum + (Sudoku (Puzzle, 1, 1) * 100)
                 + (Sudoku (Puzzle, 1, 2) * 10)
                 +  Sudoku (Puzzle, 1, 3);

   end loop;

   Put (Sum, Width => 0);

end A096;
