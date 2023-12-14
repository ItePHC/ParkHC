import React from 'react';
import { useNavigate } from 'react-router-dom';

function Home(props) {

    const navi=useNavigate();


    return (
        <div>
            <button type='button' className='btn btn-info' onClick={()=>{
                navi("/about")
            }}>About</button>
            <button type='button' className='btn btn-success' onClick={()=>{
                navi("/about/영자")
            }}>About2</button>
            <button type='button' className='btn btn-warning'onClick={()=>{
                navi("/food/1/2")
            }}>점심메뉴</button>
            <button type='button' className='btn btn-dark'onClick={()=>{
                navi("/food/3/4")
            }}>저녁메뉴</button>
        </div>
    );
}

export default Home;