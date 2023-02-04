from django.core.paginator import Paginator
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseNotAllowed
from .models import Question
from django.utils import timezone
from .forms import QuestionForm, AnswerForm

def index(request):
    """
    pybo 목록 출력
    """
    question_list = Question.objects.order_by('-create_date')
    #order_by함수는 조회한 데이터를 특정 속성으로 정렬하며, -create_date는 작성일시의 역순을 의미한다.
    context = {'question_list': question_list}
    return render(request, 'pybo/question_list.html', context)
    # render함수는 context에 있는 Question 모델 데이터 question_list를

def detail(request, question_id):
    """
    pybo 내용 출력
    """
    question = get_object_or_404(Question, pk=question_id)
    context = {'question':question}
    return render(request, 'pybo/question_detail.html',context)

def answer_create(request, question_id):
    """
    pybo 답변 등록
    """
    question = get_object_or_404(Question, pk=question_id)
    if request.method == "POST":
        form = AnswerForm(request.POST)
        if form.is_valid():
            answer = form.save(commit=False)
            answer.create_date = timezone.now()
            answer.question = question
            answer.save()
            return redirect('pybo:detail', question_id = question.id)
    else:
        return HttpResponseNotAllowed('Only POST is possible')
    context = {'question': question, 'form':form}
    return render(request, 'pybo/question_detail.html', context)
    # redirect 함수는 함수에 전달된 값을 참고하여 페이지 이동을 수행한다.


def question_create(request):
    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid(): # 유효성 검사
            question = form.save(commit=False)
            question.create_date = timezone.now()
            question.save()
            return redirect('pybo:index')
    else:
        form = QuestionForm()
    context = {'form': form}
    return render(request, 'pybo/question_form.html', context)

def index(request):
    page = request.GET.get('page', '1') # 페이지
    question_list = Question.objects.order_by('-create_date')
    paginator = Paginator(question_list, 10) # 페이지당 10개씩
    page_obj = paginator.get_page(page)
    context = {'question_list': page_obj}
    return render(request, 'pybo/question_list.html', context)
