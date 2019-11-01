import ReactOnRails from 'react-on-rails';
import { Register }  from '../bundles/Authentication/components/Register';
import {AppHeader} from '../bundles/Home/components/Header';
import Circle from '../bundles/Authentication/components/Circle';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
    Register, AppHeader, Circle
});
