import * as React from 'react';
import './Circle.css';
import {Button} from 'antd';

const Circle = () => {
    return (
        <React.Fragment>
            <span className="dot circle">  BasketBall  </span>
            <span className="dot circle">  Tennis  </span>
            <span className="dot circle">  Video games  </span>
            <span className="dot circle">  Table Tennis  </span>
            <div>
            <Button type="primary" onClick={ () => { console.log("Send Request over here")} }>
                Register
            </Button>
            </div>
        </React.Fragment>
    )
};


export default Circle;
