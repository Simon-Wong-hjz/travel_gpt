import './index.css';
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'

function Plan () {
	const data = localStorage.getItem('data');
	// console.log('data', data);
	return (
		data && <div className="plan"> 
			<ReactMarkdown className='plan-content' children={data} remarkPlugins={[remarkGfm]} />
		</div>
  );
};

export default Plan;