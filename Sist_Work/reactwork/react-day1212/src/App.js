import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import OneApp from './components/OneApp';
import SevenApp from './components/SevenApp';
import SixApp from './components/SixApp';
import FiveApp from './components/FiveApp';
import FourApp from './components/FourApp';
import ThreeApp from './components/ThreeApp';
import TwoApp from './components/TwoApp';

function App() {
  const [idx, setIdx] = useState(1);

  const selectComp =(e)=>{
    setIdx(Number(e.target.value));
  }

  return (
    <div className="App">
      <div style={{fontSize:'20px'}}>
        <label>
          <input type='radio' name='Comp' defaultChecked defaultValue='1' onClick={selectComp}/>OneApp
        </label>&nbsp;
        <label>  
          <input type='radio' name='Comp' defaultValue='2' onClick={selectComp}/>TwoApp
        </label>&nbsp;
        <label>  
          <input type='radio' name='Comp' defaultValue='3' onClick={selectComp}/>ThreeApp
        </label>&nbsp;
        <label>  
          <input type='radio' name='Comp' defaultValue='4' onClick={selectComp}/>FourApp
        </label>&nbsp;
        <label>  
          <input type='radio' name='Comp' defaultValue='5' onClick={selectComp}/>FiveApp
        </label>&nbsp;
        <label>    
          <input type='radio' name='Comp' defaultValue='6' onClick={selectComp}/>SixApp
        </label>&nbsp;
        <label>    
          <input type='radio' name='Comp' defaultValue='7' onClick={selectComp}/>SevenApp
        </label>
      </div>
      <hr/>
      {idx===1?<OneApp/>:idx===2?<TwoApp/>:idx===3?<ThreeApp/>:idx===4?<FourApp/>:idx===5?<FiveApp/>:idx===6?<SixApp/>:<SevenApp/>}
    </div>
  );
}

export default App;
