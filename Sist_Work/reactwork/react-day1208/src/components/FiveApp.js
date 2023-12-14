import React from 'react';
import Alert from '@mui/material/Alert';
import AppleIcon from '@mui/icons-material/Apple';

import img1 from '../image/12.jpg';
import img2 from '../image/11.jpg';
import img3 from '../image/10.jpg';
import img4 from '../image/9.jpg';
import img5 from '../image/8.jpg';
import img6 from '../image/7.jpg';


function FiveApp(props) {

    // 이미지를 배열변수에 넣기
    const imgArr = [img1, img2, img3, img4, img5, img6];
    const imgArr2 = ['1', '2', '3', '4', '5', '6'];



    return (
        <div>
             <h3 className='alert alert-info'>FiveApp입니다</h3>
             <Alert severity="error">배열연습<AppleIcon/></Alert>
             <h4>src의 이미지를 배열로 넣어 반복하기</h4>
             {
             imgArr.map((myImg)=>(<img src={myImg} style={{width:'150px', marginLeft:'10px', height:'150px'}}/>))
            }
            <br/><br/><br/><br/>
            <h4>public의 이미지를 배열로 넣어 반복하기</h4>
            {
                // 예전방식
                imgArr2.map((photo)=>(<img src={'../image2/'+photo+'.jpg'} className='photo'/>))
            }
             <br/><br/><br/><br/> <br/><br/><br/><br/>
            {
                // 리터럴방식
                imgArr2.map((photo)=>(<img src={`../image2/${photo}.jpg`} className='photo'/>))
            }
        </div>
    );
}

export default FiveApp;