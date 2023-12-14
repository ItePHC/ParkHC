import React, { useState } from 'react';

function TwoSubApp(props) {

    return (
        <div>
            <br/>
            <br/>
            <b>메세지</b>
            <input type='text' className='form-control' style={{width:'50vw', margin:'0 auto'}} onChange={(e)=>{
                props.onMessage(e.target.value);
            }}/>
            <br/>
            <b>글자색 변경</b>
            <input type='color' defaultValue='#ccccff' className='form-control' style={{width:'50vw', margin:'0 auto'}} onChange={(e)=>{
                props.onColor(e.target.value);
            }}/>
            <br/>
            <b>이미지 변경</b>
            <select className='form-control' style={{width:'50vw', margin:'0 auto'}} onChange={(e)=>{
                props.onPhoto(e.target.value);
            }}>
                {
                [...new Array(20)].map((a,idx)=>(<option>{`${idx+1}`}</option>))
                }
            </select>
        </div>
    );
}

export default TwoSubApp;