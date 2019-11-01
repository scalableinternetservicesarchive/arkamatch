import React from "react";
import {Redirect, Route, Switch} from "react-router-dom";


export class Main extends React.Component {

    getRegister = () =>
        <Redirect to="/register"/>;


    getRoot = () => {
        return <Redirect to="/"/>;
    };


    render() {
        return (
            <div className="mainPage">
                <Switch>
                    <Route path="/register" render={this.getRegister}/>
                    <Route render={this.getRoot}/>
                </Switch>
            </div>
        );
    }

}