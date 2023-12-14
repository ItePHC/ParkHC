import React, { useState } from 'react';

function WriteForm({onSave}) {

    const [name, setName] = useState('');
    const [blood, setBlood] = useState('A');
    const [photo, setPhoto] = useState('1');
    
    // 버튼이벤트
    const addDataEvent =()=>{
        // 부모 컴포넌트에서 만든 onsave를 호출
        onSave({name,blood,photo});
    }

    return (
        <div>
            <b>이름 : </b>
            <input type='text' style={{width:'120px'}} onChange={(e)=>{
                setName(e.target.value);
            }}/>

            <b style={{marginLeft:'30px'}}>혈액형 : </b>
            <select onChange={(e)=>{
                setBlood(e.target.value);
            }}>
                <option >A</option>
                <option>B</option>
                <option>AB</option>
                <option>O</option>
            </select>

            <b style={{marginLeft:'30px'}}>사진 : </b>
            <select onChange={(e)=>{
                setPhoto(e.target.value);
            }} defaultValue='1'>
                {
                    // 1~10까지 map으로 돌리기 1~10
                    [...new Array(10)].map((img, idx)=>(<option>{`${idx+1}`}</option>))
                }
            </select>

            <button type='button' className='btn btn-info' style={{marginLeft:'30px'}} onClick={addDataEvent}>추가</button>
        </div>
    );
}

export default WriteForm;