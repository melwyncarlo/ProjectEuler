with Ada.Integer_Text_IO;
with Ada.Numerics.Long_Elementary_Functions;

--  Copyright 2021 Melwyn Francis Carlo

procedure A002 is

   use Ada.Integer_Text_IO;
   use Ada.Numerics.Long_Elementary_Functions;

   ----------------------------------------------------------------------------
   function Binets_Formula (N_Val : in Integer) return Long_Float;

   function Binets_Formula (N_Val : in Integer) return Long_Float is
   begin
      return (1.0 / Sqrt (5.0)) * ((((1.0 + Sqrt (5.0)) / 2.0) ** N_Val)
                                -  (((1.0 - Sqrt (5.0)) / 2.0) ** N_Val));
   end Binets_Formula;
   ----------------------------------------------------------------------------
   N                   : Integer;
   Fn_Sum, Fn_Sum_Even : Long_Float;

   Fn_Max              : constant Long_Float := 4.0E+6;
   ----------------------------------------------------------------------------
begin

   N           := Integer (Log ((Fn_Max * Sqrt (5.0)) + 0.5)
                        /  Log ((1.0    + Sqrt (5.0)) / 2.0));
   Fn_Sum      := Binets_Formula (N + 2) - 1.0;
   Fn_Sum_Even := Fn_Sum / 2.0;

   Put (Integer (Fn_Sum_Even), Width => 0);

end A002;
