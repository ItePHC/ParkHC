import React from 'react';

function SixSubApp3(props) {
    return (
        <div>
            <h3 className='alert alert-danger'>SixApp의 세번째 자식입니다</h3>
            <button type='button' className='btn btn-success' onClick={props.incre}>증가</button>
            <button type='button' className='btn btn-danger' onClick={props.decre}>감소</button>
        </div>
    );
}

export default SixSubApp3;