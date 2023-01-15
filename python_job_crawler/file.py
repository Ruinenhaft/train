
def save_to_file(file_name, jobs):
    file = open(f"{file_name}.csv", "w", encoding='utf-8')
    file.write("Position, Company, Location, URL\n")
    for job in jobs:
        file.write(f"{job['company_title']},{job['company_name']},{job['company_location']},{job['company_url']}\n")

    file.close()