// 배열연습
var numbers = [1, 2, 3, 4, 5];

var processed = numbers.map(function(num){
    return num*num;
});

console.log(processed);

var colors = ['red', 'pink', 'gray', 'yellow', 'cyan'];

colors.map((color, index)=>{
    console.log(color, index);
})