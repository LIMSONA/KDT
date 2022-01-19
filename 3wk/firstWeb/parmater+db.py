import pymysql
import boto3

ssm = boto3.client("ssm")
parameter = ssm.get_parameter(Name="/myweb/database1_password", WithDecryption=True)
db_password = parameter['Parameter']["Value"]

# connect할 때 passwd에는 위에서 설정한 parameter변수인 db_password를 써준다.
conn = pymysql.connect(host="database-1.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com", db="awsdb", port=3306, user="admin", passwd=db_password)
cur = conn.cursor()
sql = "insert into test values (2,'kkukku')"
cur.execute(sql)
conn.commit()
cur.close()
conn.close()
