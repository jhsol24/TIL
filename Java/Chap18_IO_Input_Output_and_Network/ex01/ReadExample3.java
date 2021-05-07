package sec02.ex01;

import java.io.FileInputStream;
import java.io.InputStream;

public class ReadExample3 {

   public static void main(String[] args) throws Exception {
      
      InputStream is = new FileInputStream("C:\\Temp2\\test.txt");
      
      int readByteNo;
      
      byte[] readBytes = new byte[8];
      readByteNo = is.read(readBytes, 2, 3);
      //readByteNo = is.read(readBytes, 0, 8);
      for(int i=0; i<readBytes.length; i++) {
         System.out.println(readBytes[i]);
      }
      is.close();
   }

}
