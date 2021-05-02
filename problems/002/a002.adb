with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Long_Elementary_Functions;
use Ada.Numerics.Long_Elementary_Functions;

procedure A002 is
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

   New_Line (2);
   Put_Line (Integer'Image (Integer (Fn_Sum_Even)));
   New_Line (2);

end A002;
