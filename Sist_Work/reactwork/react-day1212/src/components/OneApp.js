import React, { useEffect, useState } from 'react';

function OneApp(props) {
    const [name, setName] = useState('강호동');
    const [addr, setAddr] = useState('서울시');

    // useEffect : 값 입력시 계속해서 랜더링되며 호출될수 있고, 생성자처럼 딱 한번만 호출될 수도 있다   /   랜더링 오류 확인시 사용할 예정
    // 변경시마다 호출
    /*
    useEffect(()=>{                 
        console.log("state변수가 값 변경시마다 호출");
    });
    */
    useEffect(()=>{                 
        // console.log("  ',[]' 를 붙일경우처음 랜더링시 한번만 호출... 생성자처럼");
        console.log("이름 변경시에만 호출");
    },[name]);

    return (
        <div>
            <h3 className='alert alert-danger'>OneApp입니다_useEffect</h3>
            <h3 style={{display:'flex'}}>이름 : <input type='text' style={{width:'300px'}} className='form-control' defaultValue={name} onChange={(e)=>{
                setName(e.target.value);
            }}/></h3>
            <h3 style={{ display:'flex'}}>주소 : <input type='text' style={{width:'300px'}} className='form-control' defaultValue={addr} onChange={(e)=>{
                setAddr(e.target.value);
            }}/></h3>
            <hr/>
            <h2>이름 : {name}</h2>
            <h2>주소 : {addr}</h2>
        </div>
    );
}

export default OneApp;