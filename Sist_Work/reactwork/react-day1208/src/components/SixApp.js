import React, { useState } from 'react';

function SixApp(props) {

    const [names, setNames] = useState(['진평', '현규', '희찬', '민규', '성신']);
    const [irum, setIrum] = useState('');

    // 추가버튼 이벤트
    const btnInsert=()=>{
        setNames(names.concat(irum));     // 배열에 irum데이터 추가
        setIrum('');
    }

    // Enter이벤트
    const txtEnter=(e)=>{
        if(e.key==='Enter'){
            btnInsert();
            /*
                setNames(names.concat(irum));     // 배열에 irum데이터 추가
                setIrum('');
            */
        }
    }

    const dataRemove=(index)=>{
        console.log("remove : " + index);

        // 방법1... slice
        /*
            setNames([
                ...names.slice(0,index),
                ...names.slice(index+1, names.length)
            ])
        */

        // 방법2... filter
        setNames(names.filter((item,i)=>i!==index));
    }

    // 입력이 되도록하는 이벤트
    const txtInput =(e)=>{
        setIrum(e.target.value);
    }

    return (
        <div>
             <h3 className='alert alert-info'>SixApp입니다</h3>


             <input placeholder='이름입력' value={irum} onChange={txtInput} onKeyUp={txtEnter}/>
             <button type='button' className='btn btn-info' style={{marginLeft:'10px'}} onClick={btnInsert}>버튼추가</button>
             <br/>
            <h4>이름을 더블클릭하면 삭제됩니다</h4>

            <ul>
                {
                    names.map((name,index) => (<li className='data' onDoubleClick={()=>dataRemove(index)}>{name}</li>))
                }
            </ul>
        </div>
    );
}

export default SixApp;