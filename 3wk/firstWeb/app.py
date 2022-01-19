# flask 모듈 중 Flask 클래스 불러오기
from flask import Flask, render_template

# flask 모듈 중 render_template를 임포트하면 return할 때, hello.html을 반환
# Flask 개체
app = Flask(__name__)


# 그냥 슬러시'/'만 되어 있으면 기본페이지
# flask는 기본 포트 8080
# http는 기본 포트 80

# 웹url 표현을 위해 route() 함수 사용
# 장식자인 @를 맨 앞에 작성하고
# flask에서는 이러한 장식자가 url 연결에 활용된다.
# 장식자를 사용하면 다음 행의 함수부터 장식자가 적용된다.

@app.route('/')
def hell():
    return "<h1> hello!! hi!!  Flask <h1>"


# '/test'라는 key를 가지고 value값으로 들어가있는 'test()'가 찾아짐
@app.route('/test')
def test():
    # 수행 해야할 로직이 이 자리에 들어온다.
    return "test 페이지 입니다."


@app.route('/exam')
def tomarrow():
    # 수행 해야할 로직이 이 자리에 들어온다.
    return "오늘은 AWS 시험입니다........ㅠㅠㅠㅠ"


# 작성한 html 실행해보기
@app.route('/hello')
def hello_html():
    return render_template('hello.html')


@app.route('/hello2')
def hello_html2():
    n = "sona"
    return render_template('hello2.html', name=n)


if __name__ == '__main__':
    # app.run() 함수로 웹 앱 실행요청
    app.run("0.0.0.0", port=8088)
