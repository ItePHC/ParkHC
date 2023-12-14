import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import RowItem from './RowItem';
import WriteForm from './WriteForm';

function OneApp(props) {

    const [board, setBoard] = useState([
        {
            name:'유재석',
            photo:'1',
            blood:'A',
            today:new Date()
        },
        {
            name:'하하',
            photo:'2',
            blood:'B',
            today:new Date()
        },
        {
            name:'정준하',
            photo:'3',
            blood:'O',
            today:new Date()
        },
        {
            name:'박명수',
            photo:'4',
            blood:'AB',
            today:new Date()
        }
    ]);

    // 데이터 추가 함수 이벤트
    // Board를 바꾸면 렌더링이 되면서 추가된다
    const dataSave =(data)=>{
        setBoard(board.concat({
            /*
            // 1번방식
            name:data.name,
            photo:data.photo,
            blood:data.blood,
            */
            ...data,    // 입력받은 데이터 전체를 의미


            today: new Date()
        }))
    }

    // 데이터 삭제이벤트
    const dataDelete=(idx)=>{
        setBoard(board.filter((item,i)=>(i!==idx)));
    }

    return (
        <div style={{marginLeft:'100px'}}>
            <Alert severity="info">OneApp_테이블만들기(부모자식간의 통신)</Alert> 
            <table className='table table-bordered' style={{width:'500px'}}>
                <caption align='top'><b>Board배열출력</b></caption>
                <thead>
                    <tr className='table-success'>
                        <th width='100'>이름</th>
                        <th width='120'>사진</th>
                        <th width='80'>혈액형</th>
                        <th width='100'>날짜</th>
                        <th width='70'>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        // 데이터 갯수만큼 호출... 출력은 Row에서 가능
                        board.map((row, index)=>
                            (<RowItem row={row} idx={index} onDelete={dataDelete} />)
                        )
                    }
                </tbody>
            </table>
            
                <WriteForm onSave={dataSave}/>
            
        </div>
    );
}

export default OneApp;