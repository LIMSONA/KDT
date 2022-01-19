import pymysql
conn = pymysql.connect(host="database-1.cfiuke7ewdz2.ap-northeast-2.rds.amazonaws.com", db="awsdb", port=3306, user="admin", passwd="Ys00549383!")
cur = conn.cursor()
# sql = "alter table test rename test2;"
sql = "insert into test values (1,'sona')"
cur.execute(sql)

conn.commit()

cur.close()
conn.close()
