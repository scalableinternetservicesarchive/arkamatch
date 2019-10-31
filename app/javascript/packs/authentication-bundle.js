import ReactOnRails from 'react-on-rails';

import Register from '../bundles/Authentication/components/Register';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
    Register,
});
