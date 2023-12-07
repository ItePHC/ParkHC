import React, { useState } from 'react';
import img1 from '../image/s3.JPG'

function FourthApp(props) {
    const [name, setName] = useState('박희찬');
    const [age, setAge] = useState(24);

    return (
        <div>
            <h3 className='alert alert-dark'>Fourth App입니다
            <br/>
            <img src={img1} className='img-thumbnail' style={{width:'40px', marginLeft:'50px'}}/>
            </h3>
            <b style={{fontSize:'25px'}}>이름: {name}  <span style={{marginLeft:'20px'}}>나이 : {age}세</span></b>
            <br/><br/>
            <button type='button' className='btn btn-info' onClick={()=>{
                setName("김영환");
                setAge(25);
            }}>값 변경</button>
            <button type='button' className='btn btn-danger' onClick={()=>{
                setName('박희찬');
                setAge(24);
            }} style={{marginLeft:'20px'}} >초기화</button>
        </div>
    );
}

export default FourthApp;