program roots;
uses uComplex;

var a,b,c,d,x,y,z1,z2,z3,z4:real;
var total:integer;

BEGIN
        total:=0;
        repeat 
        writeln('Enter 0 0 0 to quit');
        writeln('Enter a b c values:');
        
        readln(a,b,c);
        total:=total+1;
        if a=0 then
           begin
            if b=0 then
               begin
                if c=0 then break;
               end
            else writeln('Solution is x:', -c/b)
           end
        else
           begin
              d:=b*b-4*a*c;

              if d>0 then
                 begin
                   x:=(-b+(sqrt(d)))/(2*a);
                   y:=(-b-(sqrt(d)))/(2*a);
                   writeln('Roots are real...');
                   writeln('Root 1:', x);
                   writeln('Root 2:', y);
                 end
              else
                 begin
                   if d=0 then
                   begin
                    writeln('One real root...');
                    writeln('Root 1:', -b/(2*a));
                   end
                   else
                     begin
                       z1:=(-b)/(2*a);
                       z2:=sqrt(-d)/(2*a);
                       z3:= z1+z2;
                       z4:= z1-z2;
                       writeln('Roots are imaginary...');
                       writeln('Root 1:','i*',z3);
                       writeln('Root 2:','i*',z4);
                     end;
                 end;
           end;
        until a+b+c=0;
        writeln(total-1, ' equations were solved');
        readln;

END.
