package day0630;

abstract class AbstEx {
	abstract public void show();
	
}

class OuterEx{

	AbstEx ab = new AbstEx() {
		
		@Override
		public void show() {
			// TODO Auto-generated method stub
			System.out.println("익명 내부 클래스");
		}
	};
}


public class Annonymous_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		OuterEx ex = new OuterEx();
		ex.ab.show();
	}

}
