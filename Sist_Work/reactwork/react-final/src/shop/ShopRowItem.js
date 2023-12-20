import React from 'react';
import { useNavigate } from 'react-router-dom';

function ShopRowItem({idx,row}) {

    let photoUrl="http://localhost:9000/save/";

    const navi=useNavigate();

    return (
        <tr>
            <td>{idx+1}</td>
            <td>  <b><img src={photoUrl+row.photo} className='small'/></b>
            <b>{row.sangpum}</b>
          </td>
            <td>
                <button type='button' className='btn btn-info'
                onClick={()=>{
                   // navi("/shop/detail/"+row.num);
                   navi(`/shop/detail/${row.num}`);
                }}>상세보기</button>
            </td>
        </tr>
            
        
    );
}

export default ShopRowItem;