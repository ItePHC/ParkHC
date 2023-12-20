import React from 'react';
import infoimg from '../image/01.png';

function Info(props) {
    return (
        <div>
            <img src={infoimg} style={{width:'250px'}}/>
            <br/><br/>
            <div>쌍용교육센터</div>
            <div>02-555-1111</div>
        </div>
    );
}

export default Info;