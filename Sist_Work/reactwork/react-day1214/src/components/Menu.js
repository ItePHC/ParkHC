import React from 'react';
import {NavLink} from 'react-router-dom';

function Menu(props) {
    return (
        <div>
            <ul className='menu'>
                <li><NavLink to='/'>Home</NavLink></li>
                <li><NavLink to='/about'>About</NavLink></li>
                <li><NavLink to='./about/2' >About_2</NavLink></li>
                {/* <li><NavLink to='/login'>login</NavLink></li> */}
                <li><NavLink to='./food/1/2' >점심메뉴</NavLink></li>
                <li><NavLink to='./food/3/4' >저녁메뉴</NavLink></li>
            </ul>
        </div>
    );
}

export default Menu;