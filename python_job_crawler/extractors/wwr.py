from requests import get
from bs4 import BeautifulSoup


def wwr_scrapper(target):
    results = []
    base_url = "https://weworkremotely.com/remote-jobs/search?utf8=%E2%9C%93&term="

    response = get(f"{base_url}{target}")#경로확정 후 응답확인
    if response.status_code != 200:
        print("Can't request website")
    else:

        soup = BeautifulSoup(response.text, "html.parser")
        jobs = soup.find_all('section', class_="jobs")#secion 태그의 jobs 클래스를 전부 호출
        for job_section in jobs:
            job_posts = job_section.find_all('li')#상단 조건 내부의 li 태그 전부 호출
            job_posts.pop(-1)# 마지막줄은 필요없는 자료
            for post in job_posts:
                anchors = post.find_all('a')#상단 조건 내부의 a태그 전부 호출
                anchor = anchors[1]# 0번째에는 링크주소가 들어있고 1번째에는 원하는 자료가 들어있다.
                company_url = anchor['href']# 링크만 따로 빼서 관리
                company, kind, region = anchor.find_all('span', class_="company")#span 태그의 company 클래스에 회사, 업무종류, 지역을 추출
                title = anchor.find('span', class_="title")#
                job_data = {#원하는 자료형으로 리스트화해서 저장
                    'company_title': title.string.replace(","," "),
                    'company_name':company.string.replace(","," "),
                    'company_location':region.string.replace(","," "),
                    "company_url": f"https://weworkremotely.com{company_url}"
                }
                results.append(job_data)

    return results
