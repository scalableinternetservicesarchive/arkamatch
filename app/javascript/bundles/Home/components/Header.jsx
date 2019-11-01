import React from 'react';
import {Icon, Layout} from 'antd';
import PropTypes from 'prop-types';
import './Header.css';
const {Header} = Layout;

export class AppHeader extends React.Component {
    static propTypes = {
        isLoggedIn: PropTypes.bool.isRequired,
        handleLogOut: PropTypes.func.isRequired,
    };

    redirectToLogin = () => {
        window.location.href = '/register';
    };

    render() {
        return (
            <Header className="header"> Arkamatch
                {
                    this.props.isLoggedIn ?
                        <a className="logout"
                           onClick={this.props.handleLogOut}
                        >
                            <Icon type="logout"/>
                        </a>
                        :
                        <a className="login"
                           onClick={this.redirectToLogin}
                        >
                            <Icon type="user"/>
                        </a>
                }
            </Header>
        );
    }
}