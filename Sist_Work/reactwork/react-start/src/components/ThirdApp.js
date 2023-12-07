import React, { useState } from 'react';
function ThirdApp(props) {

    // 상태관리를 위한 변수설정
    // 중요
    const [message, setMessage] = useState('HappyDay')

    // 엔터이벤트 함수
    const enterEvent = (e)=>{

        if(e.keyCode==13){
            setMessage('');
            e.target.value='';
        }

        // if(e.key == 'Enter'){
        //     setMessage('');
        //     e.target.value='';
        // }
    }

    return (
        <div>
            <h3 className='alert alert-dark'>ThirdApp입니다</h3>
            <h3 style={{color:'red'}}>{message}</h3>
            <h4>메세지를 입력해 주세요</h4>
            <input type='text' style={{width:'300px', fontSize:'2em'}}
            defaultValue={message} 
            onChange={(e)=>{
                console.log(e.target.value);
                
                // Message변수에 입력값 넣기
                setMessage(e.target.value);
            }}
            onKeyUp={enterEvent}
            />
        </div>
    );
}

export default ThirdApp;