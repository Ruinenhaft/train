from requests import get
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

#options = Options()
#options.add_argument("--no-sandbox")
#options.add_argument("--disable-dev-shm-usage")
#browser = webdriver.Chrome(options=options)
"""
browser = webdriver.Chrome()
browser.get(f"https://remoteok.com/remote-python-jobs")
soup = BeautifulSoup(browser.page_source, "html.parser")
results = []
job_data = {}
jobs = soup.select_one("table#jobsboard > tbody")
trs = jobs.find_all("td", class_="company position company_and_position")
trs.pop(0)
for tr in trs:
    title = tr.select_one("a.preventLink > h2")
    company = tr.select_one("span.companyLink > h3")
    location = tr.find("div", class_="location tooltip")
    if location==None:
        location = tr.find("div", class_="location")
    print(title.string.replace('\n',''), company.string.replace('\n',''), location.string)
"""

def remote_scrapper(target):
    browser = webdriver.Chrome()
    browser.get(f"https://remoteok.com/remote-{target}-jobs")
    soup = BeautifulSoup(browser.page_source, "html.parser")
    results = []
    jobs = soup.select_one("table#jobsboard > tbody")
    trs = jobs.find_all("td", class_="company position company_and_position")
    trs.pop(0)
    for tr in trs:
        title = tr.select_one("a.preventLink > h2")
        company = tr.select_one("span.companyLink > h3")
        location = tr.find("div", class_="location tooltip")
        url = tr.select_one("a.preventLink")['href']
        if location == None:
            location = tr.find("div", class_="location")

        job_data = {
                "company_title": title.string.replace('\n', '').replace(",",""),
                "company_name": company.string.replace('\n', '').replace(",",""),
                "company_location": location.string.replace(",",""),
                "company_url": f"https://remoteok.com{url}"
        }
        results.append(job_data)

    return results
