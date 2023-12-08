import React from 'react';
import Alert from '@mui/material/Alert';
import AppleIcon from '@mui/icons-material/Apple';

function FiveApp(props) {
    return (
        <div>
             <h3 className='alert alert-info'>FiveApp입니다</h3>
             <Alert severity="error">배열연습<AppleIcon/></Alert>
        </div>
    );
}

export default FiveApp;