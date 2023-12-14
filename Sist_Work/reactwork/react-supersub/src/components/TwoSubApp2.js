import React, { useState } from 'react';

function TwoSubApp2(props) {
    
    const [color, setColor]=useState('#ccffcc');
    
    const buttonEvent=()=>{
        // 버튼이벤트
        props.onAddColor(color);
    }


    return (
        <div style={{width:'500px', margin:'0 auto'}}>
            <h2>Two2컴포넌트</h2>
            <div>
                <b>색상선택 : </b>
                <input type='color' defaultValue='#ccffcc' style={{width:'100px'}} onChange={(e)=>{
                    setColor(e.target.value);
                }}/>
                <br/>
                <button type='button' className='btn btn-info btn-sm' onClick={buttonEvent}>색상추가</button>
            </div>
        </div>
    );
}

export default TwoSubApp2;