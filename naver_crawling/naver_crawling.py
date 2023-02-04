import sys
import requests
from bs4 import BeautifulSoup
from newspaper import Article
from konlpy.tag import Okt
from collections import Counter
from collections import Counter, OrderedDict
import matplotlib
import matplotlib.pyplot as plt
from wordcloud import WordCloud

URL_BEFORE_KEYWORD = "https://search.naver.com/search.naver?where=news&sm=tab_pge&query="
URL_BEFORE_PAGE_NUM = "&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=29&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start="

font_name = 'Malgun Gothic' # Mac은 Apple Gothic

def get_link(key_word, page_range):# 페이지 추출함수
    link = []

    for page in range(page_range):
        current_page = 1 + page * 10
        crawling_url_list = URL_BEFORE_KEYWORD + key_word + URL_BEFORE_PAGE_NUM + str(current_page)

        response = requests.get(crawling_url_list)

        soup = BeautifulSoup(response.text, 'lxml')

        url_tag = soup.select('div.news_area > a')
        for url in url_tag:
            link.append(url['href'])

    return link

#link = get_link('rtx 4080', 3)

def get_article(file1, link, key_word, page_range):
    print('데이터를 불러오는 중...')

    with open(file1, 'w', encoding='utf8') as f:# with
        # with 자원을 획득하고 사용 후 반납해야 하는 경우 주로 사용한다.
        # 파일을 열고 사용했다면 다른 프로세ㅔ스를 위해 닫고 반납해야 한다.
        # 데이터베이스 세션을 얻어 사용했다면 다른 프로세스를 위해 반납해야 한다.
        # 자원은 한정되어 있기 때문에 적절히 획득과 반납을 해야한다.
        i = 1

        for url2 in link:
            article = Article(url2, language='ko')# Article
            # 인터넷 뉴스 기사들을 Article이라는 함수로 감싸 제목, 본문, 날짜, 태그 등 기사 속 내용
            # 들을 분류해 보여줄 수 있는 라이브러리.

            try:
                article.download()
                article.parse()
            except:
                print('-', i, '번째 URL을 크롤링할 수 없습니다.')
                continue

            news_title = article.title
            news_content = article.text

            f.write(news_title)
            f.write(news_content)

            i+=1

    print('- 네이버 뉴스 ' + key_word + ' 관련 뉴스기사' , str(page_range) +
          ' 페이지(기사' + str(i-1) + '개)가 저장되었습니다. (crawling.txt)\n')
    f.close()


#get_article('word.txt', link, 'rtx 4080', 3)


def wordcount(file1, file2):
    f = open(file1, 'r', encoding='utf-8')
    g = open(file2, 'w', encoding='utf-8')

    result = {}
    engine = Okt() # Open korea Text
    data = f.read()
    all_nouns = engine.nouns(data)
    nouns = [n for n in all_nouns if len(n) > 1]

    global count, by_num

    count = Counter(nouns)
    by_num = OrderedDict(sorted(count.items(), key=lambda t:t[1], reverse=True))
    word = [i for i in by_num.keys()]
    number = [i for i in by_num.values()]

    for w, n in zip(word, number):
        final1 = '%s %d' % (w, n)
        g.write(final1 + '\n')
        result[w] = n
    print("단어 카운팅이 완료되었습니다. (wordcount.txt)\n")
    return result
    f.close(), g.close()

#by_num = wordcount('word.txt','word_result.txt')

def full_vis_bar(by_num):
    print("그래프를 생성하는 중")

    for w, n in list(by_num.items()):
        if n <= 15:
            del by_num[w]

    fig = plt.gcf()# 현재 시각화되는 객체에 접근할 필요성이 생길때 사용
    fig.set_size_inches(20, 10)
    matplotlib.rc('font',family=font_name, size=10)
    plt.title('기사에 나온 전체 단어 빈도 수', fontsize=30)
    plt.xlabel('기사에 나온 단어', fontsize=20)
    plt.ylabel('기사에 나온 단어의 개수', fontsize=20)
    plt.bar(by_num.keys(), by_num.values(), color='#6799FF')
    plt.xticks(rotation=45)
    plt.savefig('all_words.jpg')
    plt.show()
    print('- all_word.jpg가 저장되었습니다. \n')

#full_vis_bar(by_num)

def top_n(file3):
    print('가장 많이 나온 단어 10개 추출 중...')

    f = open(file3, 'w', encoding='utf8')

    rank = count.most_common(10)
    global top

    top = dict(rank)

    word = [i for i in top.keys()]
    number = [i for i in top.values()]

    for w, n in zip(word, number):
        final2 = '%s %d' % (w, n)
        f.write(final2 + '\n')

    print('-최다 빈출 단어 10개가 저장되었습니다 (top.txt)\n')

    f.close()

#top_n('top_10.txt')

def topn_vis_bar(top):
    print("그래프를 생성하는 중...")

    fig = plt.gcf()
    fig.set_size_inches(15, 10)
    matplotlib.rc('font', family=font_name, size=20)
    plt.title('기사에 많이 나온 단어 Top 10', fontsize=35)
    plt.xlabel('기사에 나온 단어', fontsize=30)
    plt.ylabel('기사에 나온 단어의 개수', fontsize=30)
    plt.bar(top.keys(), top.values(), color='#FFA7A7')
    plt.savefig('top_words.jpg')
    plt.show()
    print('- top_words.jpg가 저장되었습니다 \n')

#topn_vis_bar(top)

def main(argv): # argument values
    # 명령 라인에 주어진 모든 값을 받아서 sys.argv 리스트에 넣음
    if len(argv) != 3: #입력한 데이터가 3개가 아닐 때
        print('사용법을 모르시는군요')
        print('사용법 : python [모듈이름][키워드][가져올 페이지 숫자]')
        return

    file1 = 'crawling.txt'
    file2 = 'wordcount.txt'
    file3 = 'top.txt'

    key_word = argv[1]
    page_range = int(argv[2])
    # argv[0] = 모듈의 파일명

    link = get_link(key_word, page_range)
    get_article(file1, link, key_word, page_range)
    wordcount(file1, file2)
    full_vis_bar(by_num)
    top_n(file3)
    topn_vis_bar(top)

if __name__ == '__main__':
    main(sys.argv)