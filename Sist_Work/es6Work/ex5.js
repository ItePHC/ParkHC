let arr1=[2,4,6];
let arr2=[6,7];
let arr3 = [11,12,...arr1,22,...arr2];
console.log(arr3.length);
console.log(arr3);

let arr4 = [...[100,200],...arr2];
console.log(arr4);
function fsum(arr){
    let sum = 0;
    
    /*
    // 방법1
    for(i=0; i<arr.length; i++){
        sum+=arr[i];
    }

    console.log("합계 : " + sum);
    */

    //방법2
    for(let a in arr){
        sum += arr[a];
    }
    console.log("합계 : " + sum);
}
fsum(arr3);

function func3(a, b, c, d, e){
    console.log(a, b, c, d, e);
}
// func3(arr);
func3(...arr3);