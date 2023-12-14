import React, { useRef, useState } from 'react';

function FourApp(props) {

    // useRef: 변수관리하는 기능
    // state와의 차이점: 값이 변경되어도 다시 랜더링하지 않음

    // 일반 state변수
    const [count, setCount] = useState(0);
    // ref선언하는법
    const countRef = useRef(0);

    // state변수가 증가하는 함수
    const stateIncrement =()=>{
        if(count===10){
            return;
        }
        setCount(count+1);
    }

    // ref변수가 증가하는 함수
    const refIncerment =()=>{
        countRef.current=countRef.current+1;    // ref 선언한 변수.current...   current(정해진 값)
        console.log("countRef : "+countRef.current);          // 랜더링이 안되므로 콘솔로 확인
    }


    return (
        <div>
            <h3 className='alert alert-danger'>FourApp입니다_useRef</h3>
            <button type='button' className='btn btn-danger' onClick={stateIncrement}>state변수 증가</button>
            <div className='number'>{count}</div>
            <button type='button' className='btn btn-danger' onClick={refIncerment}>ref변수 증가</button>
            <div className='number'>{countRef.current}</div>
        </div>
    );
}

export default FourApp;