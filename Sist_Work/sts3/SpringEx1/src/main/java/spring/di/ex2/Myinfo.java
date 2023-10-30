package spring.di.ex2;

public class Myinfo {
	String name;
	int age;
	String addr;
	public Myinfo(String name, int age, String addr) {
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "MyInfo[name = "+name+", age = "+age+", addr = "+addr+"]";
	}
}
