import './index.css';
import { useNavigate } from 'react-router-dom'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import {
  Button,
} from 'antd';
function Plan () {
	const navigate = useNavigate();
	const data = localStorage.getItem('data');

	const backHome = ()=> {
		navigate('/home');
	}
	// console.log('data', data);
	return (
		data && <div className="plan">
			<h3>为了提高用户体验和产品迭代更新，诚挚邀请您填写下方的调查问卷, 非常感谢你的参与~</h3> 
			<a href="https://www.wjx.cn/vm/mWPzZcY.aspx#" target="_blank" className='feedback_link'>使用体验反馈调查问卷</a>
			<ReactMarkdown className='plan-content' children={data} remarkPlugins={[remarkGfm]} />
			<Button type="primary" className='back_home' onClick={backHome}>返回首页</Button>
		</div>
  );
};

export default Plan;