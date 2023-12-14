import React from 'react';
import { useParams } from 'react-router-dom';

function About(props) {
    const {name} = useParams();
    return (
        <div>
            <h3>안녕하세요 제 이름은 {name==null?'null':name}입니다</h3>
        </div>
    );
}

export default About;