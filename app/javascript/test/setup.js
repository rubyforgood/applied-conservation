require('../../../node_modules/jest-enzyme/lib/index.js')
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
