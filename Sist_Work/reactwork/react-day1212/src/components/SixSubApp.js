import React from 'react';
import SixSubApp2 from './SixSubApp2';

function SixSubApp(props) {

    console.dir(props);

    return (
        <div>
            {/* <h3 className='alert alert-danger'>SixApp의 자식입니다</h3> */}
            <div className='line'>{props.name}님의 나이는 {props.age}세 입니다</div>
        </div>
    );
}

export default SixSubApp;