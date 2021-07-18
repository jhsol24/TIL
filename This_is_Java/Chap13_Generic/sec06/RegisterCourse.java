package sec06;

import java.util.Arrays;

public class RegisterCourse {
   
   public static void registerCourse(Course<?> course) {
      System.out.println(course.getName() + " 수강생: " + 
            Arrays.toString(course.getStudents()));
    }
   
   public static void registerCourseStudent(Course<? extends Student> course) {
      System.out.println(course.getName() + " 수강생: " + 
            Arrays.toString(course.getStudents()) );
    }
   
   public static void registerCourseWorker(Course<? extends Worker> course) {
      System.out.println(course.getName() + " 수강생: " + 
            Arrays.toString(course.getStudents()));
   }
   
   public static void registerCourseStudent2(Course<? super Student> course) {
      System.out.println(course.getName() + " 수강생: " + 
            Arrays.toString(course.getStudents()));
   }
}
