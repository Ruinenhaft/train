import sys
import requests
from bs4 import BeautifulSoup
from konlpy.tag import Okt
from collections import Counter, OrderedDict
import matplotlib
import matplotlib.pyplot as plt

BASE_URL = "https://www.joongang.co.kr/search?keyword="
SEARCH_URL = "&page="
get_words1 = ''
font_name = 'Malgun Gothic'

def get_words(key_word, page_range):
    title = []
    result_words = ''

    for page in range(page_range):
        current_page = page
        crawling_url_list = BASE_URL + key_word + SEARCH_URL + str(page_range)

        response = requests.get(crawling_url_list)
        soup = BeautifulSoup(response.text, 'lxml')
        total_titles = soup.select('h2.headline > a')
        total_contents = soup.select('div.card_body > p')

        for total_title in total_titles:
            title.append(total_title.string.replace('\n', ''))
        for total_content in total_contents:
            title.append(total_content.string.replace('\n', '').replace('\xa0', ''))
        result_words = ' '.join(s for s in title)

    return result_words


def wordcount(words):
    print('data load...')

    result = {}
    engine = Okt()
    data = words
    all_nouns = engine.nouns(data)
    nouns = [n for n in all_nouns if len(n) > 1]

    global count, by_num

    count = Counter(nouns)
    by_num = OrderedDict(sorted(count.items(), key=lambda t: t[1], reverse=True))
    word = [i for i in by_num.keys()]
    number = [i for i in by_num.values()]

    for w, n in zip(word, number):
        result[w] = n
    print('words count finish.')
    return result


def top_n(by_num):
    print("searching top20..")

    rank = count.most_common(20)
    global top
    top = dict(rank)





def topn_vis_bar(top):
    print("creating graph")
    fig = plt.gcf()
    fig.set_size_inches(15, 10)
    matplotlib.rc('font', family=font_name, size=20)
    plt.title('기사에 많이 나온 단어 Top 20', fontsize=35)
    plt.xlabel('기사에 나온 단어', fontsize=30)
    plt.ylabel('기사에 나온 단어의 개수', fontsize=30)
    plt.bar(top.keys(), top.values(), color='#FFA7A7')
    plt.savefig('top_words.jpg')
    plt.show()
    print('- top_words.jpg가 저장되었습니다 \n')




def main(argv):  # argument values
    # 명령 라인에 주어진 모든 값을 받아서 sys.argv 리스트에 넣음
    if len(argv) != 3:  # 입력한 데이터가 3개가 아닐 때
        print('사용법을 모르시는군요')
        print('사용법 : python [모듈이름][키워드][가져올 페이지 숫자]')
        return

    key_word = argv[1]
    page_range = int(argv[2])
    # argv[0] = 모듈의 파일명

    words = get_words(key_word, page_range)
    words_count = wordcount(words)
    top_n(words_count)
    topn_vis_bar(top)


if __name__ == '__main__':
    main(sys.argv)
