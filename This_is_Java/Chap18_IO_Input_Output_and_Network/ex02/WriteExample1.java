package sec02.ex02;

import java.io.FileWriter;
import java.io.Writer;

public class WriteExample1 {

   public static void main(String[] args) throws Exception {
      Writer writer = new FileWriter("C:/Temp/test.txt");
      char[] data = "홍길동".toCharArray();
      for(int i=0; i<data.length; i++) {
         writer.write(data[i]);
      }
      writer.flush();
      writer.close();
   }

}
