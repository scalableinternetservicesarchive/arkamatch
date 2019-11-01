import * as React from 'react';
import Root from './Root';
import { BrowserRouter } from "react-router-dom"

const App = () =>
    <BrowserRouter>
        <Root/>
    </BrowserRouter>;
export default App;