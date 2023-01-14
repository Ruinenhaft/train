from extractors.indeed import indeed_scrapper
from extractors.wwr import wwr_scrapper
from extractors.remote import remote_scrapper
keyword = input("What do you want to search for?")


indeed = indeed_scrapper(keyword)
wwr = wwr_scrapper(keyword)
remote = remote_scrapper(keyword)

jobs = indeed+wwr+remote

file = open(f"{keyword}.csv", "w", encoding='utf-8')
file.write("Position, Company, Location, URL\n")
for job in jobs:
    file.write(f"{job['company_title']},{job['company_name']},{job['company_location']},{job['company_url']}\n")

file.close()

for job in jobs:
    print(f"{job['company_title']},{job['company_name']},{job['company_location']},{job['company_url']}\n")