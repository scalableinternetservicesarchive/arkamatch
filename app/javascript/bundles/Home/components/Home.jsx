import * as React from 'react';
import { Layout, Menu, Breadcrumb } from 'antd';
import 'antd/dist/antd.css';
const { Header, Content, Footer } = Layout;

const Home = () => (
    <Layout className="layout">
        <Header>
            <Menu
                theme="dark"
                mode="horizontal"
                defaultSelectedKeys={['1']}
                style={{ lineHeight: '64px'}}
            >
                <Menu.Item key="1" onClick={ () => window.location.href="hello_world" }>Home</Menu.Item>
                <Menu.Item key="2">Match</Menu.Item>
                <Menu.Item key="3">Profile</Menu.Item>
            </Menu>
        </Header>
        <Content style={{ padding: '0 50px' }}>
            <Breadcrumb style={{ margin: '16px 0' }}>
                <Breadcrumb.Item>Home</Breadcrumb.Item>
                <Breadcrumb.Item>Users</Breadcrumb.Item>
            </Breadcrumb>
            <div style={{ background: '#fff', padding: 24, minHeight: 280 }}>Content</div>
        </Content>
        <Footer style={{ textAlign: 'center' }}>CS 188 Arkamatch</Footer>
    </Layout>
);


export default Home;