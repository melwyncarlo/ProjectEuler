with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A004 is

   use Ada.Strings;
   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   ----------------------------------------------------------------------------
   procedure StrRev       (Inp_Str : in out String);
   function Is_Palindrome (N_Val   : in Integer) return Boolean;
   ----------------------------------------------------------------------------
   procedure StrRev (Inp_Str : in out String) is
      N1, N2    : Integer;
      Temp_Char : Character;
   begin
      N1 := Integer (Inp_Str'Length / 2);
      for I in 1 .. N1 loop
         N2                              := Inp_Str'Length - I;
         Temp_Char                       := Inp_Str (Inp_Str'First + I - 1);
         Inp_Str (Inp_Str'First + I - 1) := Inp_Str (Inp_Str'First + N2);
         Inp_Str (Inp_Str'First + N2)    := Temp_Char;
      end loop;
   end StrRev;
   ----------------------------------------------------------------------------
   function Is_Palindrome (N_Val : in Integer) return Boolean is
      N_Str          : constant String  := Trim (Integer'Image (N_Val), Both);
      N_Len_by_2     : constant Float   := Float'Ceiling (Float (
                                           N_Str'Length / 2));
      N_Len_by_2_Int : constant Integer := Integer (N_Len_by_2);
      N_Str_Split_1  : constant String  := N_Str (1 .. N_Len_by_2_Int);
      N_Str_Split_2  : String           := N_Str (N_Len_by_2_Int + 1 ..
                                           N_Str'Length);
   begin
      StrRev (N_Str_Split_2);
      if N_Str_Split_1 = N_Str_Split_2 then
         return True;
      else
         return False;
      end if;
   end Is_Palindrome;
   ----------------------------------------------------------------------------
   N : Integer;
   ----------------------------------------------------------------------------
begin

   Loop_I :
      for I in reverse 900 .. 999 loop

         for J in reverse 900 .. 999 loop
            N := I * J;

            if Is_Palindrome (N) then
               exit Loop_I;
            end if;

         end loop;

      end loop Loop_I;

   Put (N, Width => 0);

end A004;
