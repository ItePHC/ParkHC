package day0629; 			//각각 입력하는 방법
	

class MyTv { 
	private String ch; 		//채널
	private String vol;		//볼륨
	
	public String getCh() {
		return ch;
	}
	public void setCh(String ch) {
		this.ch = ch;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}
	
	
}



//////////////////////////////////////////////////////////////////////////////
public class ReviewObject_01 {
	
	/*
		TV시청목록
		ebs채널을 시청합니다
		볼륨은 15db입니다
		
		tvn채널을 시청합니다
		볼륨은 22db입니다
		
	*/
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("\t***TV시청목록***");
		
		MyTv tv = new MyTv();
		tv.setCh("ebs");
		tv.getCh();
		tv.setVol("15");
		tv.getVol();
		
		String ch = tv.getCh();
		String vol = tv.getVol();
		
		
		
		MyTv tv2 = new MyTv();
		tv2.setCh("tvn");
		tv2.getCh();
		tv2.setVol("22");
		tv2.getVol();
		
		System.out.println(ch + "채널을 시청합니다");
		System.out.println("볼륨은 " + vol + "입니다");
		System.out.println("-------------------------------------------");
		
		System.out.println(tv2.getCh() + "채널을 시청합니다");
		System.out.println("볼륨은 " + tv2.getVol() + "입니다");
		
	}

}
