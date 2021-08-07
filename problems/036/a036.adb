with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A036 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   --  Initial values denoting the numbers 0, 1, 3, 5, 7, and 9.
   Sum_Val : Integer := 25;

   Decimal : String (1 .. 10);
   Binary  : String (1 .. 30);

   Is_Decimal_Palindromic, Is_Binary_Palindromic  : Boolean;

   J, Decimal_Len, Decimal_Len_By_2,
       Binary_Len,  Binary_Len_By_2,
         Temp_Len,  Quotient : Integer;

begin

   for I in 10 .. 1_000_000 loop

      if (I mod 2) = 0 then
         goto Continue;
      end if;

      Move (Source  => Trim (Integer'Image (I), Ada.Strings.Both),
            Target  => Decimal,
            Justify => Ada.Strings.Left);
      Decimal_Len := Trim (Integer'Image (I), Ada.Strings.Both)'Length;

      Is_Decimal_Palindromic := True;

      if Decimal_Len /= 1 then

         Decimal_Len_By_2 := Integer (Float'Floor (Float (Decimal_Len) / 2.0));

         for J in 1 .. Decimal_Len_By_2 loop

            Temp_Len := Decimal_Len - J + 1;

            if Decimal (J) /= Decimal (Temp_Len) then
               Is_Decimal_Palindromic := False;
               exit;
            end if;

         end loop;

      end if;

      if (not Is_Decimal_Palindromic) then
         goto Continue;
      end if;

      Binary := 30 * " ";

      J := 1;
      Quotient := I;

      while Quotient /= 0 loop
         Binary (J) := Character'Val ((Quotient mod 2) + Character'Pos ('0'));
         Quotient   := Integer (Float'Floor (Float (Quotient) / 2.0));
         J := J + 1;
      end loop;

      Is_Binary_Palindromic := True;

      Binary_Len      := Index (Binary, " ") - 1;
      Binary_Len_By_2 := Integer (Float'Floor (Float (Binary_Len) / 2.0));

      for J in 1 .. Binary_Len_By_2 loop
         Temp_Len := Binary_Len - J + 1;
         if Binary (J) /= Binary (Temp_Len) then
            Is_Binary_Palindromic := False;
            exit;
         end if;
      end loop;

      if not Is_Binary_Palindromic then
         goto Continue;
      end if;

      Sum_Val := Sum_Val + I;

      <<Continue>>

   end loop;

   Put (Sum_Val, Width => 0);

end A036;
