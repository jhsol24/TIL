package sec07.pkg;

public class Child01 extends Parent {

	int childField01 = 10;
	
	void methodChild01() {
		System.out.println("Method 1 of Child 1 class");
	}
	
	void myMethod() {
		System.out.println("Child Overrides Method in Parent");
	}
}
