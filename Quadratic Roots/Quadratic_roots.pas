program Quadratic_Equation;
    Var a,b,c,d,x,y,total_count,equation_solved:extended;

BEGIN
  writeln('This program calculates the real or imaginary roots of a quadratic equation.Input is of the form A B C where A,B and C are the coefficients of the equation. Enter 0 0 0 to quit.');
  total_count := 0;  
  repeat 
      
      
  writeln('Enter values of a b c');
  readln(a,b,c);
  equation_solved := (a-b-c);
  
  if a=0 then
      begin
         if (b=0) then
             begin
                 if (c=0) then break
                     else  writeln('No solution for the above values')
             end
         else writeln('Solution is x=',-c/b);
      end
  else
     begin
         d := b*b-4*a*c;
         total_count := total_count+1;
      
      if d>0 then
        begin
           x:=(-b-sqrt(d))/(2*a);
           y:=(-b+sqrt(d))/(2*a);
           writeln('Roots are real, x=',x, ' and y=',y);
        end
      else
        begin
            if d=0 then writeln('One real root; x=',-b/(2*a))
        else
          begin
              writeln('Roots are imaginary x= i* ',Sqrt(-d)/2.0/a, ' and y= i* ' ,-Sqrt(-d)/2.0/a);
          end;
      end;
   
      
end;
until equation_solved=0; 
writeln(total_count:0:0, ' equations were solved' );
readln
end.