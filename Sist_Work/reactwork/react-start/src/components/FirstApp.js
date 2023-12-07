import React from 'react';
import './Mystyle.css';
import img1 from '../image/f1.png';
import img2 from '../image/f2.png';
function FirstApp(props) {
    const styleImg1={
        width:'200px',
        border:'5px solid green',
        marginTop:'20px'
    }

    return (
        <div>
            <h2 className='line'>FirstApp Component!!</h2>
            <div style={{fontFamily:'25px', marginLeft:'100px', backgroundColor:'lightgrat'}}>
                안녕 오늘은 목요일이야
            </div>
            {/* src의 이미지는 import */}
            <img src={img1} style={styleImg1}/>
            <img src={img2} style={{width:'200px', border:'3px dotted pink', marginLeft:'50px'}}/>

            {/* public 이미지는 직접 호출가능 */}
            <h3>public image</h3>
            <img src='../image2/18.png'/>
            <img src='../image2/19.png'/>
        </div>
    );
}

export default FirstApp;