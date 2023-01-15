from flask import Flask, render_template, request, redirect, send_file
from extractors.indeed import indeed_scrapper
from extractors.wwr import wwr_scrapper
from extractors.remote import remote_scrapper
from file import save_to_file

# Flask는 자동으로 templates 폴더를 찾아서 참고한다.
# request 리퀘스트 브라우저가 웹사이트에 가서 콘텐츠를 요청하는 행위
# redirect 원하는곳으로 보내는 행위
# send_file 파일을 받아온다.

app = Flask("JobScrapper")

# fake DB(.CSS)
db = {}


# 데코레이터 하단의 함수를 실행시킨다.
@app.route("/")
def home():
    # 렌더링 작업을 통해 값을 전달할 수 있다. 인자는 {{name}} 형식으로 받을 수 있다.
    return render_template("home.html")


@app.route("/search")
def search():
    keyword = request.args.get("keyword")
    if keyword == "":
        return redirect("/")
    if keyword in db:
        jobs = db[keyword]
    else:
        indeed = indeed_scrapper(keyword)
        wwr = wwr_scrapper(keyword)
        remote = remote_scrapper(keyword)
        jobs = indeed + wwr + remote
        db[keyword] = jobs
    return render_template("search.html", keyword=keyword, jobs=jobs)


@app.route("/export")
def export():
    keyword = request.args.get("keyword")
    if keyword == "":
        return redirect("/")
    if keyword not in db:
        return redirect(f"/search?keyword={keyword}")
    save_to_file(keyword, db[keyword])
    # db검색 결과 파일로 저장하는 메서드
    return send_file(f"{keyword}.csv", as_attachment=True)
    # 파일을 실행하고 다운로드 하는 옵션


# 0.0.0.0을 입력하면 서버를 자동으로 생성해준다.
# 내부에는 응답할 페이지를 지정하기만 하면 된다.

app.run("0.0.0.0")

# <div>{{job.link}}</div><!--Flask에서 딕셔너리 key에 접근하는 방식 -->
#    {{}} = 변수를 값으로 변환
#    {% Python code를 사용 %}
