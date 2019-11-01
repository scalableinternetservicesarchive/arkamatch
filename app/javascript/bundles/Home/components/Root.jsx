import React from "react";
import {withRouter} from "react-router";
import {Layout} from 'antd';
import {AppHeader} from './Header';
const TOKEN_KEY = "arkamatch";
import 'antd/dist/antd.css';
class Root extends React.Component {
    state = {
        isLoggedIn: !!localStorage.getItem(TOKEN_KEY)
    };

    handleLogin = response => {
        localStorage.setItem(TOKEN_KEY, response.data.token);
        this.setState({
            isLoggedIn: true
        });
    };

    handleLogOut = () => {
        localStorage.removeItem(TOKEN_KEY);
        this.setState({
            isLoggedIn: false
        });
        this.props.history.push('/');
    };

    render() {
        return (
            <div className="Root" style={{minHeight: "100vh"}}>
                <Layout>
                    <AppHeader history={this.props.history} isLoggedIn={this.state.isLoggedIn}
                               handleLogOut={this.handleLogOut}/>
                    <Layout style={{minHeight: "100vh"}}>
                    </Layout>
                </Layout>,
            </div>
        );
    }
}

export default withRouter(Root);