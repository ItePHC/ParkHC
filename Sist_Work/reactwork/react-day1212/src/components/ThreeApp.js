import React, { useState } from 'react';

function ThreeApp(props) {
    const [boards, setBoards] = useState(
        {
            no:1,
            writer:'박희찬',
            subject:'day1212',
            photo:'05'
        },
        {
            no:2,
            writer:'김영환',
            subject:'wow',
            photo:'06'
        },
        {
            no:3,
            writer:'유재석',
            subject:'무한도전',
            photo:'07'
        },
        {
            no:4,
            writer:'이상혁',
            subject:'Faker',
            photo:'14'
        },
        {
            no:5,
            writer:'최우제',
            subject:'제우스',
            photo:'09'
        }
    );

    return (
        <div>
            <h3 className='alert alert-danger'>ThreeApp입니다_컴포넌트 배열안에 출력</h3>
            <table className='table table-bordered' style={{width:'600px'}}>
                <caption align='top'><b>배열객체 출력</b></caption>
                <thead>
                    <tr>
                        <th width='60'>번호</th>
                        <th width='100'>사진</th>
                        <th width='260'>제목</th>
                        <th width='100'>작성자</th>
                    </tr>
                </thead>

                <tbody>
                    {
                        boards.map((row,index)=>(<tr>
                            <td>{row.no}</td>
                            <td><img src={`../image2/${row.photo}.png`} style={{width:'50px'}}/></td>
                            <td>{row.subject}</td>
                            <td>{row.writer}</td>
                        </tr>))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default ThreeApp