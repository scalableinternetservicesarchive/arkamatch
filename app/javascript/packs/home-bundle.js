import ReactOnRails from 'react-on-rails';
import {AppHeader} from '../bundles/Home/components/Header';
import {Main} from '../bundles/Home/components/Main';
import Root from '../bundles/Home/components/Root';
import App from '../bundles/Home/components/App';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
    AppHeader, Main, Root, App
});
