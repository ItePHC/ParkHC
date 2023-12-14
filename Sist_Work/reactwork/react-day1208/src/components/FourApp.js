import { Alert, Box } from '@mui/material';
import React from 'react';
import AirplayIcon from '@mui/icons-material/Airplay';

function FourApp(props) {

    const names = ['영환', '성경', '호석', '민규', '성신', '형준']

    // 반복문을 변수에 저장 후 출력해도 된다
    const nameList = names.map((name)=>(<li>{name}</li>));

    //색상을 5개 배열로 주고 결과물을 div로 출력(classname을 box로 줄것)
    const Colors = ['red', 'green', 'yellow', 'blue', 'gold']
    const boxColor = Colors.map((color)=>(<div className='box' style={{backgroundColor:color, marginLeft:'10px'}}></div>));

    return (
        <div>
             <h3 className='alert alert-info'>FourApp입니다</h3>
             <Alert severity="success">배열연습<AirplayIcon/></Alert>
             <div>
                <h3>map연습</h3>
                <ol>
                    {
                     names.map((name,index)=>(<b style={{marginLeft:'10px'}}>{index}:{name}</b>))
                    }
                </ol>
                <ol>
                    {nameList}
                </ol>
                <ol style={{display:'flex'}}>
                    {boxColor}
                </ol>
             </div>
            
        </div>
    );
}

export default FourApp;