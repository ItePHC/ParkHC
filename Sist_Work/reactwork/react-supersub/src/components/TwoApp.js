import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import TwoSubApp from './TwoSubApp';
import TwoSubApp2 from './TwoSubApp2';

function TwoApp(props) {

    const [color,setColor] = useState('magenta');
    const [message, setMessage] = useState('오늘은 수요일');
    const [photo, setPhoto] = useState('1');

    const [likeColor,setLikeColor] = useState(['pink','greenyellow','lightBlue'])

    const changeMessage=(msg)=>{
        setMessage(msg);
    }
    const changeColor=(col)=>{
        setColor(col);
    }
    const changePhoto=(pto)=>{
        setPhoto(pto);
    }
    // sub_2 색상추가
    const onAddColorEvent=(co)=>{
        setLikeColor(likeColor.concat(co));
    }
    // 동그란 색상 더블클릭시 삭제
    const deleteLikeColor=(idx)=>{
        setLikeColor(likeColor.filter((a,i)=>(i!==idx)));
    }


    return (
        <div>
            <Alert severity="success">TwoApp</Alert>
            <hr/>
            <h1 style={{color:color}}>{message}</h1>
            <img src={`../image2/${photo}.png`} />
            <br/>
            <div style={{margin:'0 auto'}}>
                {
                    likeColor.map((col,idx)=>(<div className='box' style={{backgroundColor:col}} onDoubleClick={()=>{
                        deleteLikeColor(idx);
                    }}>{idx}</div>))
                }
            </div>
            <br/>
            <TwoSubApp onMessage={changeMessage} onColor={changeColor} onPhoto={changePhoto}/>
            <br/>
            <TwoSubApp2 onAddColor={onAddColorEvent}/>
        </div>
    );
}

export default TwoApp;