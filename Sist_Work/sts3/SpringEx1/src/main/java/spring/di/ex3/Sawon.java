package spring.di.ex3;

public class Sawon {

	SawonData data;
	
	public Sawon(SawonData data) {
		this.data = data;
	}
	public void writedata() {
		System.out.println("***�������***");
		System.out.println("����� : "+ data.getSawonname());
		System.out.println("�޿� : "+ data.getPay());
		System.out.println("�Ի��� : "+ data.getIpsaday());
	}
}
