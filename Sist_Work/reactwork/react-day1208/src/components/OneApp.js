import React, { useState } from 'react';

function OneApp(props) {

    const [number, setNumber] = useState(0);
    const numIncre =()=>{
        if(number===10){
            alert('10까지만 증가합니다');
            return;
        }

        setNumber(number+1);
    }
    const numDecre =()=>{
        if(number===0){
            alert('0까지만 감소합니다');
            return;
        }
        setNumber(number-1);
        
    }

    return (
        <div>
            <h3 className='alert alert-info'>OneApp입니다</h3>
            <div className='number'>
                {number}
            </div>

            <button type='button' className='btn btn-info' onClick={()=>{
                numIncre()
            }}>숫자 증가</button>
            <button type='button' className='btn btn-danger' style={{marginLeft:'10px'}}onClick={()=>{
                numDecre()
            }}>숫자 감소</button>
        </div>
    );
}

export default OneApp;