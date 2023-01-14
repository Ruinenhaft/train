from requests import get
from bs4 import BeautifulSoup
from selenium import webdriver

def page_count(target):
    base_url = "https://kr.indeed.com/jobs?q="
    browser = webdriver.Chrome()
    browser.get(f"{base_url}{target}")
    soup = BeautifulSoup(browser.page_source, "html.parser")
    pages = soup.find_all("div", class_="css-tvvxwd ecydgvn1")
    if pages == None:
        return 1
    if len(pages) >= 5:
        return 5
    else:
        return len(pages)
def indeed_scrapper(target):
    pages = page_count(target)
    result = []

    for page in range(pages):
        base_url = "https://kr.indeed.com/jobs?q="
        browser = webdriver.Chrome()
        final_url = f"{base_url}{target}&start={page*10}"
        browser.get(final_url)

        soup = BeautifulSoup(browser.page_source, "html.parser")
        jobs = soup.find("ul", class_="jobsearch-ResultsList css-0")
        job = jobs.find_all("li", recursive=False)
        for job_value in job:
            mosaic = job_value.find("div", class_="mosaic-zone")
            if mosaic == None:
                title_list_span = job_value.find_all("span")
                url_list_a = job_value.find_all("a")
                company_title = title_list_span[0]
                company_name = job_value.find("span", class_="companyName")
                company_location = job_value.find("div", class_="companyLocation")
                url_list = url_list_a[0]
                company_url = url_list['href']
                results = {
                    "company_title":company_title.string.replace(","," "),
                    "company_name":company_name.string.replace(","," "),
                    "company_location":company_location.string.replace(","," "),
                    "company_url":f"https://kr.indeed.com{company_url}"
                }
                result.append(results)
    return result
