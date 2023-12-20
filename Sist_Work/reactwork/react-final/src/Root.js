import React from 'react';
import {BrowserRouter} from 'react-router-dom';
import RouteMain from './RouteMain';

function Root(props) {
    return (
        <BrowserRouter>
           <RouteMain/>
        </BrowserRouter>
    );
}

export default Root;