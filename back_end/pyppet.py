import requests
from bs4 import BeautifulSoup
import time

login_data = {
    'user[email]': 'mertdusunceli@gmail.com',
    'user[password]': '123456',
    'user[remember_me]': '0',
    'commit': 'Log in'
}

def job():
	with requests.Session() as s:
	    url = 'http://localhost:3000/users/sign_in'
	    # r = s.get(url, headers=headers)
	    r = s.get(url)
	    soup = BeautifulSoup(r.content, 'html5lib')
	    login_data['authenticity_token'] = soup.find('input', attrs={'name': 'authenticity_token'})['value']
	    # r = s.post(url, data=login_data, headers=headers)
	    # print(login_data)
	    r = s.post(url, data=login_data)
	    # print(r.content)
	    url2 = 'http://localhost:3000/update_views/new'
	    r = s.get(url2)
	    # print(r.content)

if __name__ == '__main__':
    while True:
        job()
        # print('runs')
        time.sleep(60)