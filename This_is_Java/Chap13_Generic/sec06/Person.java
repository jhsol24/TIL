package sec06;

public class Person {
   private String name;  //홍길동(일반인)
   
   public Person(String name) {
      this.name = name;
   }

   public String getName() { return name; }
   @Override
   public String toString() { return name; }
}
