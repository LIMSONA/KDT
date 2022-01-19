import pymysql
import boto3
import os
from flask import Flask, request, jsonify, session, Response, render_template, redirect, send_file
from flask_restful import reqparse, abort, Api, Resource
from werkzeug.security import check_password_hash,generate_password_hash


app = Flask(__name__)
api= Api(app)
#페이지 형태가 아닌 json형태로 도출해준다.

ssm = boto3.client("ssm")
parameter = ssm.get_parameter(Name="/myweb/database1_password", WithDecryption=True)
db_password = parameter['Parameter']["Value"]

parser = reqparse.RequestParser()

@app.route('/')
def index():
    return "url에 /board를 입력하세요."


# file : request에서 받은 multipart file
def upload_file_to_bucket(file):
    BUCKET_NAME = 's3-myboard-files-sona'
    S3_KEY = 'images/' + file.filename
    s3 = boto3.client('s3')
    s3.put_object(Bucket = BUCKET_NAME,Body = file,Key = S3_KEY,ContentType = file.content_type)

@app.route('/board')
def board_list():
    conn = pymysql.connect(host="database-2.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com", db="awsdb", port=3306,
                           user="admin", passwd=db_password)
    curs = conn.cursor(pymysql.cursors.DictCursor)
    sql = "select*from board order by id desc"
    curs.execute(sql)
    result = curs.fetchall()
    curs.close()
    conn.close()
    print(result)
    return render_template("board_list.html", results=result)

@app.route("/board/writeform")
def board_writeform():
    return render_template('board_writeform.html')
# board_writeform.html에서  action에 써준 것을 찾아간다.



@app.route("/board/write", methods=['POST'])
def write():
    #flask 모듈 내 request
    if request.method == 'POST':
        name = request.form.get('name', False)
        passwd = request.form.get('passwd', False)
        title = request.form.get('title', False)
        content = request.form.get('content', False)
        file = request.files['file'] #5번 파일 업로드
        error = None

        # 아이디가 없다면?
        if not name:
            error = 'name이 유효하지 않습니다.'
        # 비밀번호가 없다면?
        elif not passwd:
            error = 'Password가 유효하지 않습니다.'
        # 제목이 없다면?
        elif not title:
            error = 'title이 유효하지 않습니다.'
        # 내용이 없다면?
        elif not content:
            error = 'content가 유효하지 않습니다.'

        # 5번. 파일 업로드
        print(file)
        print(file.content_length)
        if file:
            print("------------------------------------------------------------")
            print(file)
            print("------------------------------------------------------------")
            image_url = upload_file_to_bucket(file)
            print(image_url)


        # 에러가 발생하지 않았다면 회원가입 실행
        if error is None:
            db = pymysql.connect(host='database-2.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com', port=3306, db='awsdb',
                                 passwd=db_password, user='admin')
            cursor = db.cursor()
            cursor.execute(
                'INSERT INTO board (name, passwd, title, content ) VALUES (%s, %s, %s, %s)',
                (name, generate_password_hash(passwd), title, content)
            )
            # 5번. 파일 업로드
            if file:
                cursor.execute('SELECT LAST_INSERT_ID()')
                result = cursor.fetchall()
                board_id = result[0][0]
                # s3_path는 s3_key를 의미한다.
                cursor.execute(
                    'INSERT INTO board_file (board_id, file_name, s3_bucket, s3_path, mime_type) VALUES (%s, %s, %s, %s, %s)',
                    (board_id, file.filename, 's3-myboard-files-sona', 'images/' + file.filename, file.content_type)
                )
            db.commit()
            cursor.close()
            db.close()

        return redirect('/board') #글 다 작성한 이후 /board로 넘어가기

@app.route('/board/down', methods=['GET'])
def download():
    board_id = request.args['id']

    db = pymysql.connect(host='database-2.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com',port=3306,db='awsdb',passwd=db_password,user='admin')
    curs = db.cursor(pymysql.cursors.DictCursor)
    sql = 'SELECT * FROM board_file WHERE board_id = %s'
    curs.execute(sql, (board_id))
    result = curs.fetchone()
    curs.close()
    db.close()

    print("result : " , result)
    if result :
        BUCKET_NAME = 's3-myboard-files-sona'
        key = result['s3_path']
        file_name = result['file_name']
        file_content_type = result['mime_type']

        s3 = boto3.client('s3')
        # https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html#S3.Client.get_object
        file = s3.get_object(Bucket=BUCKET_NAME, Key=key)

        print(file)
        # S3의 파일정보의 Body(byte[])을 읽어들여 응답으로 출력한다.
        return Response(file['Body'].read(),mimetype=file_content_type)
        #headers={"Content-Disposition": "attachment;filename=" + file_name} )
    else :
        print("-------------------------------------------------------------------")
        return send_file(f'static/inf.png', mimetype='image/png')

# 4번. 글 상세보기
@app.route('/board/view')
def board_view():
    board_id = request.args['id']
    print('board_id : ' + board_id)
    db = pymysql.connect(host='database-2.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com',port=3306,db='awsdb',passwd=db_password,user='admin')
    curs = db.cursor(pymysql.cursors.DictCursor)
    sql = 'SELECT * FROM board WHERE id = %s'
    curs.execute(sql, (board_id))
    result = curs.fetchone()
    curs.close()
    db.close()
    print(result)

    return render_template('board_view.html', result=result)



if __name__ == '__main__':
    # app.run() 함수로 웹 앱 실행요청
    app.debug = True
    app.run("0.0.0.0", port=8081)
