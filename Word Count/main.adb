with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Float_Text_IO;
use Ada.Text_IO;

procedure main is


   --declaring the array type
   MembersMax : CONSTANT Positive := 150;
   SUBTYPE MyRange IS Positive RANGE 1..MembersMax;
   TYPE IntArray IS ARRAY(MyRange) of Integer;
   Frequency : ARRAY(1..150) of Integer := (others => 0);

   --declaring the variables
   Input : File_Type;
   file_name : Ada.Strings.Unbounded.Unbounded_String;
   Total_Question:Ada.Strings.Unbounded.Unbounded_String;
   answer: Ada.Strings.Unbounded.Unbounded_String;
   Answer_values:IntArray;
   Student_values:IntArray;
   Cost : Integer;
   count_num_of_questions : Integer;
   total_sum : Integer;
   total_Student : Integer;
   z123 : Integer;

   package Student_Type1 is

   private
     Type Student_Type1 is new Integer range 1 .. 1000;
     Type Student_Grade is new Integer range 1 .. 1000;

   end Student_Type1;

   --Creating records
   type Student_Type is record
      Student_ID   : Integer;
      Student_Grade : Integer;
   end record;

   -- Parse string into array.
   FUNCTION parseString ( str : Ada.Strings.Unbounded.Unbounded_String ; Len : Integer) RETURN  IntArray IS
   st       : String   := Ada.Strings.Unbounded.to_string(str);
   current : Positive := st'First;
   L       : Positive := 1;
   Numbers : IntArray;

   begin
   for i in st'range loop
      if st (i) = ' ' then
         Numbers(L) := Integer'Value(st (current .. i-1));
         L := L + 1;
         current := i + 1;
      end if;

      if i = st'last then
         Numbers(L) := Integer'Value(st (current .. i));
         L := L + 1;
         current := i + 1;
      end if;
      end loop;
   RETURN Numbers;
   end parseString;

   --Calculate the score of student
   FUNCTION grading_score ( Answer_values : IntArray; Student_values : IntArray ; Len : Integer ; Cost : Integer) RETURN  Integer IS
      total : Integer;
      I : Positive := 1;
      begin
         total := 0;
         LOOP
         if Answer_values(I) = Student_values(I+1) then
            total := total + Cost;
         end if;
         I := I + 1;
         exit when I = Len + 1;
      END LOOP;
      RETURN total;
   end grading_score;

   --Procedure: Read entire data from file
   --calculate score of the students and parse the data
   --update the count/frequency.

   PROCEDURE readSData IS
      result : Integer;
      frequency_index : Integer;


   BEGIN
      while not End_OF_File (Input) loop
         declare
            Line : String := Get_Line (Input);

         begin
         Student_values := parseString(Ada.Strings.Unbounded.To_Unbounded_String(Line),count_num_of_questions+1);
         result := grading_score(Answer_values,Student_values,count_num_of_questions,Cost);
         Ada.Integer_Text_IO.Put(Student_values(1), Width=>5);
         Ada.Integer_Text_IO.Put(result);
         Ada.Text_IO.New_Line;
         frequency_index := result + 1;
         Frequency(frequency_index) := Frequency(frequency_index) + 1;
         total_Student := total_Student + 1;
         total_sum := total_sum + result;
         end;
      end loop;
   END readSData;

begin
   -- get file name from user
   Ada.Text_IO.Put("Enter A File Name: ");
   file_name := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);

   --Open file
   Open (File => Input,
         Mode => In_File,
         Name => Ada.Strings.Unbounded.To_String(file_name));

   --read all question from file
   Total_Question := Ada.Strings.Unbounded.To_Unbounded_String(Get_Line(Input));

   --convert total question string to integer
   count_num_of_questions := Integer'Value(Ada.Strings.Unbounded.To_String(Total_Question));
   Cost := 100 / count_num_of_questions;
   total_Student := 0;
   total_sum := 0;

   -- read answer keys from file
   answer := Ada.Strings.Unbounded.To_Unbounded_String(Get_Line(Input));

   --convert total question string to array
   Answer_values := parseString(answer,count_num_of_questions);
   Ada.Text_IO.Put("Student ID    Score");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   --read student data from file and convert it into array
   readSData;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   -- print total student
   Ada.Text_IO.Put("Tests graded = ");
   Ada.Integer_Text_IO.Put(total_Student, Width => 1);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("Score     Frequency");
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   -- print score frequncey
   z123 := 150;
   WHILE (z123 > 0) LOOP
      IF Frequency(z123) > 0 THEN
         Ada.Integer_Text_IO.Put(z123-1, Width => 3);
         Ada.Integer_Text_IO.Put(Frequency(z123), Width => 12);
         Ada.Text_IO.New_Line;
      END IF;
      z123 := z123 - 1;
   END LOOP;

   Ada.Text_IO.Put("===================");
   Ada.Text_IO.New_Line;

   --calculate average
   Ada.Text_IO.Put("Class Average = ");
   Ada.Integer_Text_IO.Put(total_sum / total_Student, Width => 1);
   Ada.Text_IO.New_Line;
   Ada.Text_IO.New_Line;
   Ada.Text_IO.New_Line;
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("(*** Beware!! The data files can vary in number of questions up to 50, and there can be any number (at least 1) of students. Your program must be flexible! ***)");
   Ada.Text_IO.New_Line;

   --Close file
   Ada.Text_IO.Close(File => Input);
exception
   when End_Error =>
      if Is_Open(Input) then
         Close (Input);
      end if;
end main;
