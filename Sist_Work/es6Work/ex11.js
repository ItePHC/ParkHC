const array = [1, 2, 3, 4, 5];    // 3을 제거하고 싶을때    (index기준 2)
// const delIndex = 2;
array.splice(2,1);              // (삭제할 인덱스 번호(시작지점), 삭제할 갯수)
console.log(array);

// slice 
// slice는 원본배열을 건드리지 않고 수정된 복사배열을 리턴한다(교체는 불가능)
// 3,4를 출력
var array2 = [1, 2, 3, 4, 5, 6, 7, 8];
var a2 = array2.slice(2,4);                     // 시작인덱스, 마지막인덱스-1(종료 지점?),, (= substring)
var a3 = array2.slice(1,4);
console.log(a2);
console.log(a3);

// Array.concat(value)
// concat메서드는 원하는 값을 원본배열 끝에 추가한 뒤 새로운 배열을 만든다
let con = [1, 2 , 3].concat([4, 5],[6, 7]);
console.log(con);

// filter
var arr = [1, 2, 3, 4, 5];                      // arr에서 2를 제거하고 싶을때
var delInx = 1;                                 //  2의 인덱스는 1이다

arr = arr.filter(function(item,index){          // filter안에 인자로 함수를 받고, index만 필요함을 명시

    return index !== delInx                     // 배열을 돌면서 인덱스 1이 아닌 나머지만 다시 반환
});
console.log(arr);