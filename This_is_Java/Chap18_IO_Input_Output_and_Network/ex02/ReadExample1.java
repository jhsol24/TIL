package sec02.ex02;

import java.io.FileReader;
import java.io.Reader;

public class ReadExample1 {

   public static void main(String[] args) throws Exception {
      Reader reader = new FileReader("C:/Temp2/test.txt");
      
      int readData;
      
      while( true ) {
         readData = reader.read();
         
         if(readData == -1) {
            break;
         }
         System.out.print((char) readData);
         //System.out.print(readData+" ");
         
      }
      
      reader.close();
   
   }

}
