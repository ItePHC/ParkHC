var a = 1;
let b = 2;

function myfunction(){

    var a = 3;
    let b = 4;

    if(true){
        var a = 5;
        let b = 6;
        
        console.log(a); //  5
        console.log(b); //  6
    }

    console.log(a);     //  5
    console.log(b);     //  4
}
myfunction();
console.log(a);         //  1
console.log(b);         //  2
