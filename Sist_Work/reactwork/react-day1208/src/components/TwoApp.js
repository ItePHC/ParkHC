import React, { useState } from 'react';
import img1 from '../image/1.jpg'

function TwoApp(props) {

    const [photo,setPhoto] = useState('../image2/18.png');
    const changePhoto =(e)=>{
        setPhoto(e.target.value);
    }

    return (
        <div>
            <h3 className='alert alert-info'>TwoApp입니다_Radio버튼</h3>

            <div>
                <b>이미지선택</b>
                <label>
                    <input type='radio' name='photo' value='../image2/18.png' onClick={changePhoto}/>이미지1
                </label>
                &nbsp;&nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/19.png' onClick={changePhoto}/>이미지2
                </label>
                &nbsp;&nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/20.png' onClick={changePhoto}/>이미지3
                </label>
            </div>

            <img src={photo}/>
        </div>
    );
}

export default TwoApp;