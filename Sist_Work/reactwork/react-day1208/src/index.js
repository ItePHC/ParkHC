import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
// import OneApp from './components/OneApp';
// import TwoApp from './components/TwoApp';
// import ThreeApp from './components/ThreeApp';
// import FourApp from './components/FourApp';
// import FiveApp from './components/FiveApp';
// import SixApp from './components/SixApp';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
    {/* <OneApp/>
    <TwoApp/>
    <ThreeApp/>
    <FourApp/>
    <FiveApp/>
    <SixApp/> */}
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
