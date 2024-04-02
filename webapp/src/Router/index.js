import Home from '../Page/Home/index';
import Plan from '../Page/PlanPage/index'

const routers = [
  {
    title: 'Home',
    path: '/',
    component: Home,
  },
  {
    title: 'Home',
    path: '/home',
    component: Home,
  },
  {
    title: 'Plan',
    path: '/plan',
    component: Plan,
  },
];

export default routers;

