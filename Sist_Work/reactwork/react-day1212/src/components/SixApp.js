import React, { useState } from 'react';
import SixSubApp from './SixSubApp';
import SixSubApp2 from './SixSubApp2';
import SixSubApp3 from './SixSubApp3';

function SixApp(props) {

    const [number, setNumber] = useState(10);

    // 증가
    const numberIncrement=()=>{
        setNumber(number+1);
    }

    // 감소
    const numberDecrement=()=>{
        setNumber(number-1);
    }

    return (
        <div>
            <h3 className='alert alert-danger'>SixApp입니다_부모자식간 컴포넌트 통신</h3>
            <SixSubApp name='희찬' age='23'/>
            <SixSubApp name='진평' age='23'/>
            <SixSubApp name='형준' age='24'/>
            {/* props라는 변수로 name,age전달 */}
            <br/><br/>
            <SixSubApp2 flower='수국' price='25000' linecolor='purple'/>
            <SixSubApp2 flower='장미' price='14000' linecolor='pink'/>
            <SixSubApp2 flower='국화' price='22000' linecolor='greenyellow'/>
            <br/><br/>
            <div className='number'>{number}</div>
            <SixSubApp3 incre={numberIncrement} decre={numberDecrement}/>
        </div>
    );
}

export default SixApp;