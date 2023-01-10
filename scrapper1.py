from requests import get
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

#options = Options()
#options.add_argument("--no-sandbox")
#options.add_argument("--disable-dev-shm-usage")
#browser = webdriver.Chrome(options=options)

term = "react";

browser = webdriver.Chrome()
browser.get(f"https://remoteok.com/remote-{term}-jobs")
soup = BeautifulSoup(browser.page_source, "html.parser")
results = []
job_data = {}
jobs = soup.select("table#jobsboard > tbody")
for job in jobs:
    trs = job.find_all("td", class_="company position company_and_position")
    trs.pop(0)
    if len(trs) != 0:
        for tr in trs:
            title = tr.select_one("a.preventLink > h2")
            company = tr.select_one("span.companyLink > h3")
            if term == 'python' or term == 'golang':
                location = tr.find("div", class_="location tooltip")
                pay = tr.find("div", class_="location tooltip-set")
            elif term == 'rust' or term == 'react':
                locations = tr.find_all("div", class_="location")
                location = locations[0]
                pay = locations[1]

            if title!=None and company != None and location != None and pay != None:
                job_data = {
                    "title": title.string.replace('\n', ''),
                    "company": company.string.replace('\n', ''),
                    "location": location.string.replace('\n', ''),
                    "pay": pay.string
                }
            results.append(job_data)

for result in results:
    print(result)

"""
term = "rust";

browser = webdriver.Chrome()
browser.get(f"https://remoteok.com/remote-{term}-jobs")
soup = BeautifulSoup(browser.page_source, "html.parser")
results = []
job_data = {}
jobs = soup.select("table>tbody>tr")
for job in jobs:
    trs = job.find_all("td", class_="company position company_and_position")
    if len(trs) != 0:
        for tr in trs:
            title = tr.select_one("a.preventLink > h2")
            company = tr.select_one("span.companyLink > h3")
            location = tr.find("div", class_="location tooltip")
            pay = tr.find("div", class_="location tooltip-set")
            if title!=None and company != None and location != None and pay != None:
                job_data = {
                    "title": title.string.replace('\n', ''),
                    "company": company.string.replace('\n', ''),
                    "location": location.string.replace('\n', ''),
                    "pay": pay.string
                }
            results.append(job_data)
results.pop(0)
for result in results:
    print(results)"""