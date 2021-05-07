package sec02.ex01;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class WriteExample3 {

   public static void main(String[] args) throws Exception {
      OutputStream os = new FileOutputStream("C:/Temp2/test44.txt");
      //byte[] data = "ABC".getBytes();
      byte[] data2 = "오후에회식입니다".getBytes("UTF-8");
      //os.write(data, 1, 2);
      os.write(data2, 3, 6);
      os.flush();
      os.close();
   }

}
