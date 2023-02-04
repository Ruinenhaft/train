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

def wordcloud(filename):
    print('워드 클라우드를 생성하는 중...')

    with open(filename, encoding='utf8') as f:
        data = f.read()

        engine = Okt()
        all_nouns = engine.nouns(data)

        nouns = [n for n in all_nouns if len(n) > 1]
        count = Counter(nouns)

        tags = count.most_common(100)

        wc = WordCloud(font_path='malgun', background_color=(168, 237, 244), width=2500, height=1500)
        cloud = wc.generate_from_frequencies(dict(tags))

        plt.imshow(cloud, interpolation='bilinear')
        plt.axis('off')
        plt.savefig('cloud.jpg')
        plt.show()

wordcloud('word_result.txt')