package sec02.ex01;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class WriteExample2 {

   public static void main(String[] args) throws Exception {
      OutputStream os = new FileOutputStream("C:/Temp2/test33.txt");
      byte[] data1 = "ABC\n".getBytes();
      byte[] data2 = "자바를 열심히 복습하세요".getBytes();
      os.write(data1);
      os.write(data2);
      os.flush();
      os.close();
   }

}
