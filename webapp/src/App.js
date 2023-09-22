// // // import {useState} from 'react'

// // import { 
// //   DatePicker,
// //   Input,
// //   Button,
// //   Tag,
// // } from 'antd';

// // import { 
// //   UserOutlined,
// //   PayCircleOutlined,
// //   EnvironmentOutlined,
// //   SearchOutlined,
// //  } from '@ant-design/icons';
// //  import 'dayjs/locale/zh-cn';
// // import locale from 'antd/es/date-picker/locale/zh_CN';
// // import './App.css';
// // const { RangePicker } = DatePicker;

// // const clickConfirm = () => {
// //   console.log('jjjjj')

// // }

// function App() {
  
//   return (
//     // <div className="App">
//     //   <div className='header-wrapper'>
//     //     <Input placeholder="出发地" className='hader-input' prefix={<EnvironmentOutlined />}/>
//     //     <div className='header-time'>
//     //       <RangePicker className='header-time-range' locale={locale}/>
//     //     </div>
//     //     <Input placeholder="人数" className='hader-input' prefix={<UserOutlined />}/>
//     //     <Input placeholder="预算" className='hader-input' prefix={<PayCircleOutlined />}/>
//     //   </div>
//     //   <div className='main-wrapper'>
//     //     <div className='title'>我想。。。</div>
//     //     <div className='search-wrapper'>
//     //       <Input placeholder="请以分号分隔" className='main-input' prefix={<SearchOutlined />}/>
//     //       <Button type="primary" className='confiim-button' onClick={clickConfirm}>确认</Button>
//     //     </div>
//     //     <div className='tags-wrapper'>
//     //       <Tag color="red" className='tag-item-shopping'>购物</Tag>
//     //       <Tag color="volcano" className='tag-item-sun'>看日吃</Tag>
//     //       <Tag color="orange" className='tag-item-fish'>吃海鲜</Tag>
//     //       <Tag color="gold" className='tag-item-climb'>登山</Tag>
//     //       <Tag color="lime" className='tag-item-swimming'>游泳</Tag>
//     //       <Tag color="green" className='tag-item-walking'>徒步</Tag>
//     //       <Tag color="cyan" className='tag-item-bbc'>烧烤</Tag>
//     //       <Tag color="blue" className='tag-item-camp'>露营</Tag>
//     //       <Tag color="geekblue" className='tag-item-dive'>潜水</Tag>
//     //       <Tag color="purple" className='tag-item-sking'>滑雪</Tag>
//     //     </div>
//     //   </div>
//     //   <div>
//     //   </div>
//     // </div>
//     <div>
//       jojo
//     </div>
//   );
// }

// export default App;

import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import routers from './Router';

const App = () => {
  return (
    <Router basename={"/travel_gpt"}>
      <Routes> 
        {routers.map((item, index) => {
          return (
            <Route
              key={index}
              exact
              path={item.path}
              element={<item.component />} // 不是老版本的：component 或 render
            />
          );
        })}
      </Routes>
    </Router>
  );
};

export default App;
