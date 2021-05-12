import java.util.Scanner;
import java.util.Arrays;

public class Exercise09 {
    public static void main(String args[]) {
      boolean run = true;
      int studentNum = 0;
      int[] scores = null;
      Scanner scanner = new Scanner(System.in);
      
       while(run) {
            System.out.println("---------------------");
            System.out.println("1.Student Number | 2.Insert Score | 3.Score List | 4.Summary | 5.Exit");
            System.out.println("---------------------");
            System.out.print("Select> ");
            
            int selectNo = scanner.nextInt();
            
            if(selectNo == 1) {
                System.out.print("Student Number> ");
                studentNum = scanner.nextInt();
            } else if(selectNo == 2) {
                for(int i=0; i < studentNum; i++) {
                    System.out.print("scores["+i+"]> ");
                    scores[i] = scanner.nextInt();
                }
            } else if(selectNo == 3) {
                for(int i=0; i < studentNum; i++) {
                    System.out.print("scores["+i+"]: "+scores[i]);
                }
            } else if(selectNo == 4) {
                Arrays.sort(scores);
                System.out.print("Top Score: "+scores[scores.length-1]);
                int sum = 0;
                double average = 0.0;
                
                for(int i=0; i < studentNum; i++) {
                    sum += scores[i];
                }
                average = (double) sum/studentNum;
                System.out.print("Average Score: "+average);
            } else if(selectNo == 5) {
                run = false;
            }
            System.out.println();
        }
        System.out.println("Exit");
    }
}