import React from 'react';
import img1 from '../image/s1.JPG'

function SecondApp(props) {
    const ImgStyle={
        width:'200px',
        height:'300px',
        border:'10px dotted gold'
    }

    let helloEle=<h2 className='alert alert-dark'>Hello~~</h2>;
    return (
        <div>
        <h2 className='alert alert-danger'>SecondApp입니다</h2>
        <img src={img1} style={ImgStyle}/>
        {helloEle}
        {helloEle}
        </div>
    );
}

export default SecondApp;