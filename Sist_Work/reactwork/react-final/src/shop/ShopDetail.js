import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

function ShopDetail(props) {

    const {num}=useParams();

    //dto 들어올 변수 선언
    const [data,setData]=useState('');

    //url 등록
    let detailUrl="http://localhost:9000/shop/detail?num="+num;

    let photoUrl="http://localhost:9000/save/";

    //스프링으로부터 num에 해당하는 data 받기
    const onDataReceive=()=>{
        axios.get(detailUrl)
        .then(res=>{
            console.log(res.data.sangpum);
            setData(res.data);
        }).catch(err=>{
            alert(err.data);
        })
    }

    //처음 랜더링시 위의 함수 호출
    useEffect(()=>{
        onDataReceive();
    },[])

    return (
        <div>
            <h1>{num}</h1>
        </div>
    );
}

export default ShopDetail;