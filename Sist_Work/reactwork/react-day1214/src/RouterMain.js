import React from 'react';
import Menu from './components/Menu';
import { Routes, Route } from 'react-router-dom';
import { Home, About, Food } from './pages';
import mainimg from './image2/a03.png'



function RouterMain(props) {
    return (
        <div>
            RouterMain   
            {/* 모든 페이지에서 공통으로 포함되는 컴포넌트나 이미지 */}
            <Menu/>
            <img src={mainimg} className='main_photo'/>
            <hr className='line'/>
            <div className='main_comp'>
                <Routes>
                    <Route path='/' element={<Home/>}/>
                    <Route path='/about' element={<About/>}/>
                    {/*path 경로 뒤에 : 가 붙으면 :뒤에 해당하는 값을 파라메타로 넘김을 의미함 해당 문장에선 name을 넘김*/}
                    <Route path='/about/:name' element={<About/>}/>

                    <Route path='/login/*' element={
                    <div><h1>서비스 준비중 입니다</h1>
                    <img src='../image/01.png' />
                    <h3>오늘 점심도 컵라면</h3>
                    </div>
                    }/>

                    <Route path='/food/:food1/:food2/' element={<Food/>}/>
                    <Route path='/food/:food3/:food4/' element={<Food/>}/>

                    {/* 그 외의 매핑일시... */}
                    <Route path='*' element={
                        <h1>잘못된 접근입니다</h1>
                    }/>
                </Routes>
            </div>
        </div>
    );
}

export default RouterMain; 