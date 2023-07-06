package day0629;

public class Employee_04 {
	
	String sawonName;
	int salary;
	
	public Employee_04(String name, int sal) {
		this.sawonName=name;
		this.salary = sal;
	}
	
	//리턴 메서드
	public String getEmp() {
		return sawonName + ", " + salary;
	}
	
	//추상 메서드
	/*
	 public String getEmp();
	 */
	
}
