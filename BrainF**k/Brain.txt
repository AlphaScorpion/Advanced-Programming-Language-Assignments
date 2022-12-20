import java.util.*;
class Brain
{
	private static Scanner sc = new Scanner(System.in);
	private static int ptr, length = 65535;
	private static byte memory[] = new byte[length];
	private static void bfinterpreter(String str)
	{
		int cell = 0;
		for(int i=0;i<str.length();i++)
		{
			if(str.charAt(i)=='>')	// > used to increment the data pointer
			{
				if (ptr==length-1) // if the data pointer reaches at the end of the array, mwhen memory is full, pointer returned to zero
					ptr=0;
				else ptr++;
			}
			else if(str.charAt(i)=='<') // < used to decrement the data pointer
			{
				if(ptr==0)				//if the data pointer reaches zero, return it to the right position
					ptr=length-1;
				else 
					ptr--;
			}
			else if(str.charAt(i)=='+') // + increment the byte at data pointer, increases the value of the memory cell 
				memory[ptr]++;
			else if(str.charAt(i)=='-') // - decrement the byte at data pointer, decreases the value of the memory cell
				memory[ptr]--;
			else if(str.charAt(i)=='.')  //. output the byte at the data pointer
				System.out.print((char)(memory[ptr]));
			else if(str.charAt(i)==',')  // , accept one byte of input, store its value in the byte at the data pointer, take value from the user and store it in the array
				memory[ptr]=(byte)(sc.next().charAt(0));
			else if(str.charAt(i)=='[')  // if byte at the data pointer is zero, jump it forward
			{
				if(memory[ptr]==0)
				{
					i++;
					while( cell>0 || str.charAt(i)!=']')
					{
						if(str.charAt(i) == '[')
							cell++;
						else if(str.charAt(i) == ']')
							cell--;
						i++;	
					}
				}	
			}	
			else if(str.charAt(i)==']') //if byte at the data pointer is non-zero, jump back
			{
				if(memory[ptr]!=0)
				{	
					i--;
					while( cell>0 || str.charAt(i)!='[')
					{
						if(str.charAt(i) == ']')
							cell++;
						else if(str.charAt(i) == '[')
							cell--;
						i--;
					}
					i--;
				}
			
			}				
			
		}
	}
	public static void main (String args[])
	{
		

		String str = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.";
		bfinterpreter(str);
		
	}
}
