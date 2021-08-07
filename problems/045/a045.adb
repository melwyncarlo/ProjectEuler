with Ada.Long_Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A045 is

   use Ada.Long_Integer_Text_IO;

   ----------------------------------------------------------------------------
   Max_N : constant Integer := 1E5;
   ----------------------------------------------------------------------------
   type Double is digits 10;
   ----------------------------------------------------------------------------
   --  Newton-Raphson's Method for calculating the square root.
   --  xn   = x0     - ( f(x0) / f'(x0) )
   --  x(n) = x(n-1) - ( ((x(n-1) * x(n-1)) - x0) / (2 * x(n-1)) )
   function Sqrt (x0 : Double) return Double;
   ----------------------------------------------------------------------------
   function Sqrt (x0 : Double) return Double is
      Max_Iterations : constant Integer := 25;
      xn : Double := x0;
   begin
      for I in 1 .. Max_Iterations loop
         xn := xn - (((xn * xn) - x0) / (2.0 * xn));
      end loop;
      return xn;
   end Sqrt;
   ----------------------------------------------------------------------------
   Tn, Sqrt_Term : Double;
   ----------------------------------------------------------------------------
begin

   for I in 286 .. Max_N loop

      Tn := Double (I + 1) / 2.0;
      Tn := Tn * Double (I);

      Sqrt_Term := Sqrt (1.0E0 + (24.0E0 * Tn));

      if (Sqrt_Term - Double (Long_Integer (Sqrt_Term))) = 0.0 then

         if ((Long_Integer (Sqrt_Term) + 1) mod 6) = 0 then

            Sqrt_Term := Sqrt (1.0E0 + (8.0E0 * Tn));

            if (Sqrt_Term - Double (Long_Integer (Sqrt_Term))) = 0.0 then

               if ((Long_Integer (Sqrt_Term) + 1) mod 4) = 0 then
                  exit;
               end if;

            end if;

         end if;

      end if;

   end loop;

   Put (Long_Integer (Tn), Width => 0);

end A045;
