import React, { useState } from 'react';

function FifthApp(props) {
    const [name, setName] = useState('');
    const [java, setJava] = useState(0);
    const [react, setReact] = useState(0);
    const [total, setTotal] = useState(0);
    const [avg, setAvg] = useState(0);
    const [Rname, setRName] = useState('');
    const [Rjava, setRJava] = useState(0);
    const [Rreact, setRReact] = useState(0);

    return (
        <div>
            <h3 className='alert alert-dark'>Fifth App입니다</h3>
            <div className='inp'>
                이름 : <input type='text' style={{width:'100px'}}
                onChange={(e)=>{
                    // console.log(e.target.value);
                    setName(e.target.value);
                }}/>
                <span style={{marginLeft:'10px'}}>{name}</span><br/>
                자바점수 : <input type='text' style={{width:'100px'}}
                defaultValue={java}
                onChange={(e)=>{
                // console.log(e.target.value);
                setJava(e.target.value);
                }}/>
                <span style={{marginLeft:'10px'}}>{java}</span><br/>
                
                리액트점수 : <input type='text' style={{width:'100px'}}
                  defaultValue={react}
                  onChange={(e)=>{
                  // console.log(e.target.value);
                  setReact(e.target.value);
                  }}/>
                <span style={{marginLeft:'10px'}}>{react}</span><br/>
                <button type='button' className='btn btn-outline-info' onClick={(e)=>{
                    setRName(name);
                    setRJava(java);
                    setRReact(react);
                    setTotal(parseInt(java)+parseInt(react));
                    setAvg(parseInt(total)/2);

                }}>결과보기</button>
            </div>
            <div className='result'>
            이름 : {Rname}<br/>
            자바점수 : {Rjava}<br/>
            리액트점수 : {Rreact}<br/>
            총점 : {total}<br/>
            평균점수 : {avg}<br/>
            </div>
        </div>
    );
}

export default FifthApp;