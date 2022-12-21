with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;
procedure StudentGrading is
   No_Of_Questions: Integer:= 0;
   Input_File: File_Type;
   Score: Integer := 0;
   Marks_Per_Question: Integer;
   Graded_Count: Integer;
   type Data_Array is array(Positive range 1..Graded_Count) of Integer;
   Student_Grades: Data_Array;

   function NoOfStudents return Integer is
   begin
      Graded_Count:= -2;
      loop
         declare
            FileLine: String := Get_Line(Input_File);
         begin
            Graded_Count:= Graded_Count + 1;
         end;
      end loop;
   exception
      when End_Error => Close(Input_File);
   return Graded_Count;
   end;

   function CalculateScore(Answer_Key, Student_Record: String) return Integer is
      Ans: Integer:= 0;
      I, J, K: Integer:= 1;

   begin
      while Student_Record(I) /= ' ' loop
         Put(Student_Record(I));
         I:= I + 1;
      end loop;
      Put("            ");
      I:= I + 1;
      J:= I;

      while J <= I + (No_Of_Questions * 2) - 1 loop
         if(Student_Record(J) = Answer_Key(K)) then
            Ans:= Ans + Marks_Per_Question;
         end if;
         K:= K + 2;
         J:= J + 2;
      end loop;
      return Ans;
   end;

   procedure ReadStudentData(Answer_Key: String) is
   begin
      for I in 1..Graded_Count loop
         declare
            Student_Record: String := Get_Line(Input_File);
         begin
            Score:= CalculateScore(Answer_Key, Student_Record);
            Put(Integer'Image(Score));
            New_Line;
            Student_Grades(I):= Score;
         end;
      end loop;
   end;

   procedure SortGrades is
      Temp: Integer;
   begin
      for I in 1..Graded_Count loop
         for J in 1..Graded_Count-I-1 loop
            if (Student_Grades(J) < Student_Grades(J+1)) then
               Temp:= Student_Grades(J);
               Student_Grades(J):= Student_Grades(J+1);
               Student_Grades(J+1):= Temp;
            end if;
         end loop;
      end loop;
   end;

   procedure FrequencyOfGrades is
      Visited_Tracker: array(1..Graded_Count) of Boolean;
      Frequency_Count: Integer;
   begin
      for I in 1..Graded_Count loop
         Visited_Tracker(I):= False;
      end loop;
      for I in 1..Graded_Count loop
         if (Visited_Tracker(I) = False) then
            Frequency_Count:= 1;
            for J in I + 1 .. Graded_Count loop
               if (Student_Grades(I) = Student_Grades(J)) then
                  Visited_Tracker(J):= True;
                  Frequency_Count:= Frequency_Count + 1;
               end if;
            end loop;
            Put_Line(Integer'Image(Student_Grades(I)) & "             " & Integer'Image(Frequency_Count));
         end if;
      end loop;
   end;

begin
   Put("Enter File Name: ");
   declare
      filename: String := Get_Line;
   begin
      Open(File => Input_File, Mode => In_File, Name => filename);
      Graded_Count:= NoOfStudents;
      Open(File => Input_File, Mode => In_File, Name => filename);
      No_Of_Questions:= Integer'Value(Get_Line(Input_File));
   end;

   declare
      Answer_Key: String := Get_Line(Input_File);
      Sum_Scores: Integer:= 0;
      type Data_Array is array(Positive range 1..Graded_Count) of Integer;
   begin
      Marks_Per_Question:= 100 / No_Of_Questions;
      Put_Line("Student ID      Score");
      Put_Line("=====================");
      ReadStudentData(Answer_Key);
      Put_Line("=====================");
      Put_Line("Tests Graded =" & Integer'Image(Graded_Count));
      Put_Line("=====================");
      Put_Line("Score       Frequency");
      Put_Line("=====================");
      SortGrades;
      FrequencyOfGrades;
      Put_Line("=====================");
      Put("Class Average = ");
      for I in 1..Graded_Count loop
         Sum_Scores:= Sum_Scores + Student_Grades(I);
      end loop;
      Ada.Float_Text_IO.Put(Float(Sum_Scores)/Float(Graded_Count), aft => 2, exp => 0);
   end;
end StudentGrading;
