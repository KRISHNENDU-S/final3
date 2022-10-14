from flask import Flask, request, jsonify
import mysql.connector
def fn():
    fn.counter=vars(fn).setdefault('counter',0)
    fn.counter+=1
    return (fn.counter)
app = Flask(__name__)
@app.route('/api', methods = ['GET'])
def returnascii():
    d = {}
    inputchr = str(request.args['query'])
    answer = inputchr
   #d['output'] = answer
    #MySQL
    mydb = mysql.connector.connect(
    host ="localhost",
    #port=3306,
    user ="root",
    passwd ="kl32K4893*",
    database="flutter",
    )
    mycursor = mydb.cursor()
    sql = "INSERT INTO absent (slno, roll) VALUES (%s, %s)"
    val = (fn(), int(answer))
    mycursor.execute(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "record inserted.")



    return d



if __name__ =="__main__":
    app.run()