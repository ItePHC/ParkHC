import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import TwoApp from './components/TwoApp';
import OneApp from './components/OneApp';

function App() {

  const [idx, setIdx] = useState(1);

  const selectComponent =(e)=>{
    setIdx(Number(e.target.value));
  }

  return (
    <div className="App">
      <div style={{fontSize:'20px'}}>
        <label>
          <input type='radio' name='Compo' defaultChecked defaultValue='1' onClick={selectComponent}/>OneApp
        </label>&nbsp;
        <label>  
          <input type='radio' name='Compo' defaultValue='2' onClick={selectComponent}/>TwoApp
        </label>
      </div>
      <hr/>
      {idx===1?<OneApp/>:<TwoApp/>}
    </div>
  );
}

export default App;
