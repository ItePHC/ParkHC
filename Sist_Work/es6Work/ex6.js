// 화살표함수 : new객체 생성 안됨
// 자바의 Ramda익명함수와 같은 방식(function 키워드 대신 화살표 사용)

/*
    function 함수명(){
        함수로직
    }

    function 함수명(){
        함수로직
    }


    const변수 = function 함수명(){
        함수로직
    }

    const 변수 = ()=>{
        함수로직
    }
*/
function f1(){
    console.log("일반함수 f1");
}
f1();

//화살표
let f2=()=>console.log("화살표함수 f2");                 //한줄이면 {} 생략가능
f2();

//일반
function f3(a,b){
    return a+b;
}

let a=f3(5,7);
console.log(a);

// 화살표
let f4=(a,b)=>a+b;      // 한 줄일땐 리턴 생략가능
let b=f4(11,22);
console.log(b);

//일반
function f5(x,y,z=100){
    return x+y+z;

}

console.log(f5(1,2,3));
console.log(f5(40,50));

// f5를 화살표함수 f6으로 구현 후 호출

let f6=(x,y,z)=>x+y+z;
console.log(f6(4,5,6));