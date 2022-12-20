package reader;
import java.util.Scanner;
import java.io.*;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Reader extends Thread 
{
  private String filename;
  public Reader (String filename) 
  {
    this.filename = filename;
  }

  public void run()
  {
    System.out.println("\nProcessing file: " + filename);

    File file = new File(filename);

    try(Scanner sc = new Scanner(new FileInputStream(file)))
    {
      int count=0;
      while(sc.hasNext())
      {
        sc.next();
        count++;
      }
      System.out.println("\n" +filename + ": " + count);
    }
    catch(FileNotFoundException ex)
    {
      System.out.println("\nFile " + filename + " not found");
    }
  }

  public static void main(String[] args)
  {
    try
    {
      Reader r4 = new Reader("file4.txt");
      Reader r1 = new Reader("file1.txt");
      Reader r3 = new Reader("file3.txt");
      Reader r2 = new Reader("file2.txt");
      r4.start();
      r1.start();
      r3.start();
      r2.start();
    }
    catch (Exception e)
    {
      System.out.println(e.getMessage());
    }
    System.out.println("\nDone in main!");
  }
}






public interface Event {
   void organise();
}

public class HostingTheEvent implements Event {

   @Override
   public void organise() {
      
   }
}

public class EventFactory {
  
   //use getEvent method to get object of type event 
   public Event getEvent(String eventType){
      if(eventType == null){
         return null;
      }   
      if(eventType.equalsIgnoreCase("BookingTheEvent")){
         return new BookingTheEvent();
         
      } else if(eventType.equalsIgnoreCase("HostingTheEvent")){
         return new HostingTheEvent();
         
      }
      
      return null;
   }
}

public class FactoryPatternDemo {

   public static void main(String[] args) {
      EventFactory eventFactory = new EventFactory();

      //get an object of BookingTheEvent and call its organise method.
      Event event1 = eventFactory.getEvent("BookingTheEvent");

      //call organise method of BookingTheEvent
      event1.organise();

      //get an object of HostingTheEvent and call its organise method.
      Event event2 = eventFactory.getEvent("HostingTheEvent");

      //call organise method of HostingTheEvent
      event2.organise();     
   }
}
