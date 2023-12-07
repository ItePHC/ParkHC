//es6 좀더 언어적으로 바뀜, Set, Map가능(Collection)
let set = new Set("abcccdddeeefffff"); // 중복문자 걸러짐
console.log(set);
set.add("g");   // 없으니깐 추가 가능
console.log(set);

console.log(set.has("a"));  //포함시 true 미포함시 false
console.log(set.has("k"));
console.log("길이 : " + set.size);

console.log(...set);               // 중복문자 제거 후 나열하여 출력
set.delete("a");                   // A만 삭제
console.log(...set);

set.clear();                        // 전체삭제
console.log(set.size);


// 비교연산자
let a = 6;
let b = "6";
console.log(a==b);                     // true, 값으로만 비교
console.log(a===b);                    // false, 타입까지 같아야 true

