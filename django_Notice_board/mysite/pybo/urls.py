from django.urls import path
from . import views

app_name = 'pybo'
# 네임스페이스 중복을 막기위해 네임스페이스 추가

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:question_id>/', views.detail, name='detail'),
    #<int:question_id>위치에 Question 리스트 인덱스 매핑
    # path 함수에 있는 URL 매핑에 name 속성을 부여하여 하드코딩 문제 해결
    path('answer/create/<int:question_id>/', views.answer_create, name='answer_create'),
    path('question/create/', views.question_create, name='question_create'),
]