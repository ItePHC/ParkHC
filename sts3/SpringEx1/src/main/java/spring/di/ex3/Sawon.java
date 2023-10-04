package spring.di.ex3;

public class Sawon {

	SawonData data;
	
	public Sawon(SawonData data) {
		this.data = data;
	}
	public void writedata() {
		System.out.println("***사원정보***");
		System.out.println("사원명 : "+ data.getSawonname());
		System.out.println("급여 : "+ data.getPay());
		System.out.println("입사일 : "+ data.getIpsaday());
	}
}
