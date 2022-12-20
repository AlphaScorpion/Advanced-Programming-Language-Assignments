public class TestPrimitive{
	public static void main(String args[]){
		
		System.out.println("\n"+ "JAVA HAS 8 PRIMITIVE DATATYPES");
		System.out.println("\n"+ "Illustration of float datatype:");
		System.out.println("***********************************FLOAT******************************************");
		float force;
		float mass = 60.66f;
		float acceleration =  -9.8f;
		force = mass * acceleration;
		System.out.println("The Mass (M)is :" +mass);
		System.out.println("The Acceleration(A) is:" +acceleration);
		System.out.println("The Force is F = M*A:" +force);
		
		System.out.println("\n" + "Illustration of int datatype:");
		System.out.println("***********************************INT******************************************");
		int num1,num2,result;
		num1 = 20000;
		num2 = -9000;
		result = num1 + num2;
		System.out.println("Number 1:" +num1);
		System.out.println("Number 2:" +num2);
		System.out.println("Number 1 + Number 2:" +result);
		
		System.out.println("\n" + "Illustration of long datatype:");
		System.out.println("***********************************LONG******************************************");
		long n1,n2,res;
		n1 = 8000000000L;
		n2 = 90L;
		res = n1 * n2;
		System.out.println("Number 1:" +n1);
		System.out.println("Number 2:" +n2);
		System.out.println("Product of two longvariables is:" +res);
		
		System.out.println("\n" + "Illustration of char datatype:");
		System.out.println("***********************************CHAR******************************************");
		char grade_ascii,grade;
		grade_ascii= 100;
		grade = 'A';
		System.out.println("The ascii value of 100 is:" +grade_ascii);  //it will print the ASCII value
		System.out.println("Grade:" +grade);
		
		System.out.println("\n" + "Illustration of boolean datatype:");
		System.out.println("***********************************BOOLEAN******************************************");
		boolean a = true;
		boolean b = true;
		if(a = true && b == true){
		System.out.println("Value of a=" +a);
	    System.out.println("Value of b=" +b);
		System.out.println("Success!!");
		}
	    else{
		System.out.println("Fail");
		}
		
		System.out.println("\n" + "Illustration of short datatype:");
		System.out.println("***********************************SHORT******************************************");
		short s1,s2,s3,s4,s5;
		s1 = -31000;
		s2 = 3100;
		s3 = 10;
		s4 = 11;
		
		System.out.println("The first short side is:" +s1 + "\n");
		System.out.println("The second short side is:" +s2+ "\n");		
		System.out.println("The third short side is:" +s3+ "\n");
		System.out.println("The fourth short side is:" +s4+ "\n");
		
		System.out.println("\n" + "Illustration of double datatype:");
		System.out.println("***********************************DOUBLE******************************************");
		double d1,d2,d3;
		d1 = 19.99d;
		d2 = 12E4d;
		d3 = d2/d1;
		System.out.println("The first double digit is:" +d1); 
        System.out.println("The value of second double digit 12E4d is:" +d2); 		
		System.out.println("The division of d2/d1 = " +d3);
		
		System.out.println("\n" + "Illustration of byte datatype:");
		System.out.println("***********************************BYTE******************************************");
		String s = "120";
		byte example = 10;
		Byte bb = Byte.valueOf(s); 			//This returns an byte object holding the value of the specified primitive.
		System.out.println("Byte value of string " +s+ " is " +bb);
        System.out.println("Value of byte variable:" +example);		
	
	}
}