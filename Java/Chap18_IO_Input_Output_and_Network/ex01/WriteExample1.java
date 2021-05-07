package sec02.ex01;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class WriteExample1 {

   public static void main(String[] args) throws Exception {

      OutputStream os1 = new FileOutputStream("C:/Temp2/test2.txt");

      OutputStream os2 = new FileOutputStream("C:/Temp2/test3.txt");

      byte[] data1 = "ABC".getBytes("UTF-8");
      System.out.println(data1.length);

      System.out.println("==============");

      byte[] data2 = "오후에회식입니다".getBytes("UTF-8");
      System.out.println(data2.length);

      System.out.println(data1[1]);
      //System.out.println(data2[1]);  //한글처리시에는 의미없습니다

      for(int i=0; i<data1.length; i++) {
         os1.write(data1[i]);
      }
      
      for(int i=0; i<data2.length; i++) {
         os2.write(data2[i]);
      }
      os1.flush();
      os1.close();
      os2.flush();
      os2.close();
   }

}
