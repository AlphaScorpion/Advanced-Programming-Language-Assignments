import math
flag = 'true';
total = 0;
while flag:
    print("Enter 0 0 0 to quit");
    print("Enter a b c values \n");
    a = float(input());
    b = float(input());
    c = float(input());
    print("The a b c values are:  " + str(a)+ "  " +str(b)+ "  " +str(c)+ "  \n");
    if a == 0 and b == 0 and c == 0:
        #count = total + 1;
        print(total ," equations were solved.");
        break;
	
    else:
            total += 1;
            determinant = ((b * b) - (4) * (a * c));
		
	
            if determinant>0:
		
                x = (-b+math.sqrt((determinant))/(2.0*a));
                y = (-b-math.sqrt((determinant))/(2.0*a));
                print("Roots are real... \n");
                print("Root 1: " +format(x, '.16E')+ "");
                print("Root 2: " +format(y, '.16E')+ "\n");
               
		
            elif determinant==0:
		
                r1 = (-b)/(2.0*a);
                print("One real root...\n");
                print("Root 1:" +format(r1, '.16E')+ "\n");
                
		
            else:
		
                    z1 = (-b)/(2*a);
                    z2 = math.sqrt((-determinant)/(2*a));
                    z3 = z1 + z2;
                    z4 = z1 - z2;
                    print("Roots are imaginary...");
                    print("Root 1: i*" +format(z3, '.16E')+ "");
                    print("Root 2: i*" +format(z4, '.16E')+ "\n");

