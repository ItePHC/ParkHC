import React, { useState } from 'react';

function TwoApp(props) {

    // 객체처리 변수
    const [inputs, setInputs] = useState({
        name:'강호동',
        addr:'서울시 강남구',
        age:20
    });

    // 3개의 공통함수
    const changeData=(e)=>{
        console.log("name : " + e.target.name);
        console.log("value : " + e.target.value);
    
        // name.value값 얻기
        // e.target이 가지고 있는 객체 한번에 변경하기
        const {name, value}=e.target;
        
        // 변경
        setInputs({
            ...inputs,         // 기존 멤버값은 유지
            [name]:value       // 해당값만 나오고 나머진 사라짐.. 해결법은 펼침연산자
        })
    }
    
    

    return (
        <div>
            <h3 className='alert alert-danger'>TwoApp입니다_state를 객체변수로 테스트</h3>
            <h3 style={{display:'flex'}}>이름 : <input type='text' style={{width:'300px'}} className='form-control' name='name' defaultValue={inputs.name} onChange={changeData}/></h3>
            <h3 style={{display:'flex'}}>주소 : <input type='text' style={{width:'300px'}} className='form-control' name='addr' defaultValue={inputs.addr} onChange={changeData}/></h3>
            <h3 style={{display:'flex'}}>나이 : <input type='text' style={{width:'300px'}} className='form-control' name='age' defaultValue={inputs.age} onChange={changeData}/></h3>
            <hr/>
            <h2>이름 : {inputs.name}, {inputs['name']}</h2>
            <h2>주소 : {inputs.addr}</h2>
            <h2>나이 : {inputs.age}</h2>
        </div>
    );
}

export default TwoApp;