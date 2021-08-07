with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A032 is

   use Ada.Strings.Fixed;
   use Ada.Integer_Text_IO;

   Temp_Str_1, Temp_Str_2 : String (1 .. 10);
   Temp_Str_3             : String (1 .. 20);

   Duplicate_Found        : Boolean;

   Products_List : array (Integer range 1 .. 1000) of Integer := (others => 0);

   Sum_Val       : Integer := 0;
   Count_Val     : Integer := 1;

   Product_Val, Total_Length : Integer;

   Temp_Str_1_Len, Temp_Str_2_Len, Temp_Str_3_Len : Integer;

begin

   for I in 1 .. 9999 loop

      Move (Source  => Trim (Integer'Image (I), Ada.Strings.Both),
            Target  => Temp_Str_1,
            Justify => Ada.Strings.Left);

      Temp_Str_1_Len := Trim (Integer'Image (I), Ada.Strings.Both)'Length;

      if Index (Temp_Str_1, "0") /= 0 then
         goto Continue_I;
      end if;

      Duplicate_Found := False;

      for J in 1 .. Temp_Str_1_Len loop

         for K in 1 .. Temp_Str_1_Len loop

            if J = K then
               goto Continue_K;
            end if;

            if Temp_Str_1 (J) = Temp_Str_1 (K) then
               Duplicate_Found := True;
               exit;
            end if;

            <<Continue_K>>

         end loop;

         if Duplicate_Found then
            exit;
         end if;

      end loop;

      if Duplicate_Found then
         goto Continue_I;
      end if;

      for J in 1 .. 9999 loop

         Move (Source  => Trim (Integer'Image (J), Ada.Strings.Both),
               Target  => Temp_Str_2,
               Justify => Ada.Strings.Left);

         Temp_Str_2_Len := Trim (Integer'Image (J), Ada.Strings.Both)'Length;

         if Index (Temp_Str_2, "0") /= 0 then
            goto Continue_J1;
         end if;

         Duplicate_Found := False;

         for K in 1 .. Temp_Str_2_Len loop

            for L in 1 .. Temp_Str_2_Len loop

               if K = L then
                  goto Continue_L1;
               end if;

               if Temp_Str_2 (K) = Temp_Str_2 (L) then
                  Duplicate_Found := True;
                  exit;
               end if;

               <<Continue_L1>>

            end loop;

            if Duplicate_Found then
               exit;
            end if;

         end loop;

         if Duplicate_Found then
            goto Continue_J1;
         end if;

         Duplicate_Found := False;

         for K in 1 .. Temp_Str_2_Len loop

            if Index (Temp_Str_1, Temp_Str_2 (K .. K)) /= 0 then
               Duplicate_Found := True;
               exit;
            end if;

         end loop;

         if Duplicate_Found then
            goto Continue_J1;
         end if;

         Product_Val := I * J;

         Move (Source  => Trim (Integer'Image (Product_Val), Ada.Strings.Both),
               Target  => Temp_Str_3,
               Justify => Ada.Strings.Left);

         Temp_Str_3_Len := Trim (Integer'Image (Product_Val),
                           Ada.Strings.Both)'Length;

         if Index (Temp_Str_3, "0") /= 0 then
            goto Continue_J1;
         end if;

         Total_Length := Temp_Str_1_Len
                       + Temp_Str_2_Len
                       + Temp_Str_3_Len;

         if Total_Length > 9 then
            exit;
         end if;

         if Total_Length /= 9 then
            goto Continue_J1;
         end if;

         Duplicate_Found := False;

         for K in 1 .. Temp_Str_3_Len loop

            for L in 1 .. Temp_Str_3_Len loop

               if K = L then
                  goto Continue_L2;
               end if;

               if Temp_Str_3 (K) = Temp_Str_3 (L) then
                  Duplicate_Found := True;
                  exit;
               end if;

               <<Continue_L2>>

            end loop;

            if Duplicate_Found then
               exit;
            end if;

         end loop;

         if Duplicate_Found then
            goto Continue_J1;
         end if;

         Duplicate_Found := False;

         for K in 1 .. Temp_Str_3_Len loop

            if Index (Temp_Str_1, Temp_Str_3 (K .. K)) /= 0
            or Index (Temp_Str_2, Temp_Str_3 (K .. K)) /= 0
            then

               Duplicate_Found := True;
               exit;

            end if;

         end loop;

         if Duplicate_Found then
            goto Continue_J1;
         end if;

         Products_List (Count_Val) := Product_Val;

         Count_Val := Count_Val + 1;

         <<Continue_J1>>

      end loop;

      <<Continue_I>>

   end loop;

   for I in 1 .. Count_Val loop
      for J in 1 .. Count_Val loop

         if I = J then
            goto Continue_J2;
         end if;

         if Products_List (I) = Products_List (J) then
            Products_List (J) := 0;
         end if;

         <<Continue_J2>>

      end loop;
   end loop;

   for I in 1 .. Count_Val loop
      Sum_Val := Sum_Val + Products_List (I);
   end loop;

   Put (Sum_Val, Width => 0);

end A032;
