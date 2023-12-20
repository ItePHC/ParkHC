import React from 'react';
import { NavLink } from 'react-router-dom';

function Menu(props) {
    return (
        <ul className='menu'>
            <li><NavLink to='/'>Home</NavLink></li>
            <li><NavLink to='/login'>Login</NavLink></li>
            <li><NavLink to='/member/form'>Member</NavLink></li>
            <li><NavLink to='/shop/list'>Shop</NavLink></li>
            <li><NavLink to='/board/list'>Board</NavLink></li>
            <li><NavLink to='/about'>About</NavLink></li>
        </ul>
    );
}

export default Menu;