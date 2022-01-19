# AWS에서 제공하는 파이썬 용 SDK(software development kit)
import boto3

ssm = boto3.client("ssm")

#파라미터 받아오기
#Name은 aws에서 설정한 파라미터 이름을 써준다.
parameter = ssm.get_parameter(Name="/myweb/database1_password", WithDecryption=True)
#값 꺼내오기
print(parameter['Parameter']["Value"])


