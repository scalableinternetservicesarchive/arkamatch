import React from 'react'
import ReactDOM from 'react-dom'

const Home = () =>
 <div> Welcome to the Home page of Arkamatch. </div>;


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Home/>,
        document.body.appendChild(document.createElement('div')),
    )
});
