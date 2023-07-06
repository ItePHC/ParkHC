package day0626;

public class ReviewArr_08 {

	public static void main(String[] args) {		
		//	해당 배열을 for문을 이용해서 출력하시오
		
		//1. ex) 0번지 : 영환이
		
		String[] names = {"영환이", "수환이", "동환이", "성환이"};
		
		for(int i = 0; i < names.length; i++) {
			System.out.println(i + "번지 : " + names[i]);
		}
		System.out.println();
		
		
		//2. 해당 배열을 가로로 출력하시오 
		int [] nums = {2, 4, 5, 7, 8};
		
		for(int i = 0; i < nums.length; i++) {
			System.out.print(nums[i] + "  ");
		}
		System.out.println();
		
		
		// flowers
		String [] flowers = {"장미", "안개꽃", "피안화", "진달래", "벚꽃"};
		
		for(int i = 0; i < flowers.length; i++) {
			System.out.print(flowers[i] + "  ");
		}
		System.out.println();
		
		
		
		// colors
		String [] color = {"빨강", "주황", "노랑", "초록", "파랑"};
		
		for(int i = 0; i < color.length; i++) {
			System.out.print(color[i] + "색  ");
		}
		System.out.println();
		
	}

}
