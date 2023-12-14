import React, { useRef, useState } from 'react';

function FiveApp(props) {

    const [result,setResult] = useState('');
    const nameRef=useRef('');
    const javaRef=useRef('');
    const springRef=useRef('');
    const reactRef=useRef('');

    const buttonResult=()=>{
        // 데이터 읽어오기
        let name = nameRef.current.value;
        let java = Number(javaRef.current.value);
        let spring = Number(springRef.current.value);
        let react = Number(reactRef.current.value);

        let tot = java+spring+react;
        let avg = (tot/3).toFixed(2);
        
        let r = `[결과확인]
        이름 : ${name}
        자바점수 : ${java}
        스프링점수 : ${spring}
        리액트점수 : ${react}
        총점 : ${tot}
        평균 : ${avg}`;

        setResult(r);
    }

    return (
        <div>
            <h3 className='alert alert-danger'>FiveApp입니다_useRef예제</h3>
            <h4>이름입력 : <input type='text' ref={nameRef} /></h4>
            <h4>자바점수 : <input type='text' ref={javaRef} /></h4>
            <h4>스프링점수 : <input type='text' ref={springRef} /></h4>
            <h4>리액트점수 : <input type='text' ref={reactRef} /></h4>
            <button type='button' className='btn btn-info' onClick={buttonResult}>결과확인</button>

            <h2 className='alert alert-info' style={{whiteSpace:'pre-wrap'}}>{result}</h2>
        </div>
    );
}

export default FiveApp;