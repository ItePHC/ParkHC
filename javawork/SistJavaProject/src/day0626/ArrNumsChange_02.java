package day0626;

public class ArrNumsChange_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [] arr = {2, 9, 7, 8, 60, 12, 30, 1, 78, 99};
		
		System.out.println("원래 데이터 :");
		
		for(int i = 0; i < arr.length; i++) {		
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		//복습 필			arr이 0일때 => temp가 9가 나와야 해서 1을 추가로 빼는것
		for(int i = 0; i < arr.length/2; i++) {
			int temp = arr[i];
			arr[i] = arr[arr.length-i-1/*0일때 9를 나오게 하기 위해서 -(i+1) */];
			arr[arr.length-i-1]=temp;
		}
		System.out.println("순서 변경 후 데이터 :");
		
		for(int i = 0; i < arr.length; i++) {		
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		//selection sort(오름차순 정렬)
		//Arrays.sort(arr) : 배열 arr을 정렬 한다
		//선택정렬 : 가장 작은 숫자를 앞으로 보내자
		
		//기준데이터는 0부터 끝에서 두번째까지 
		for(int i = 0; i < arr.length - 1/*끝에서 두번째*/; i++) {
			
			//비교하는 데이터는 기준 다음값부터 끝까지
			for(int j = i+1; j<arr.length; j++) { 
				if(arr[i] > arr[j]) {
					int temp = arr[i];
						arr[i] = arr[j];
						arr[j] = temp;
				}
			}
		}
		System.out.println("오름차순 정렬 후 데이터 :");
		
		for(int i = 0; i < arr.length; i++) {		
			System.out.print(arr[i] + " ");
		}
		System.out.println();
	}
	

}
