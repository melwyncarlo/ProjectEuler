with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Copyright 2021 Melwyn Francis Carlo

procedure A063 is

   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   Str : constant String (1 .. 12) := "Hello World ";

   Num : constant Integer := 2021;

begin

   Put (Str);
   Put (Num, Width => 0);

end A063;
