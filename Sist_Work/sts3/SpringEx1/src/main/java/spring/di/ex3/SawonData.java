package spring.di.ex3;

public class SawonData {
	private String sawonname;
	private int pay;
	private String ipsaday;
	
	public SawonData() {
		// TODO Auto-generated constructor stub
		
	}
	
	//사워명은 생성자 주입
	public SawonData(String name) {
		// TODO Auto-generated constructor stub
		sawonname = name;
	}
	
	//급여, 입사일은 setter주입
	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getIpsaday() {
		return ipsaday;
	}

	public void setIpsaday(String ipsaday) {
		this.ipsaday = ipsaday;
	}

	public String getSawonname() {
		return sawonname;
	}

	public void setSawonname(String sawonname) {
		this.sawonname = sawonname;
	}
	
	
	
}
