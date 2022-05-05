# A very simple Flask Hello World app for you to get started with...

from flask import Flask,jsonify,request
# from flask import Jsonify
import decimal
from datetime import datetime
from flask.json import JSONEncoder
# from flask_sqlalchemy import SQLAlchemy
from flaskext.mysql import MySQL
from flask_cors import CORS,cross_origin

app = Flask(__name__)
CORS(app, support_credentials=True)
app.config["DEBUG"] = True
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'dareenhussein'
app.config['MYSQL_DATABASE_PASSWORD'] = 'dareen123'
app.config['MYSQL_DATABASE_DB'] = 'dareenhussein$dareenhussein'
app.config['MYSQL_DATABASE_HOST'] = 'dareenhussein.mysql.pythonanywhere-services.com'
mysql.init_app(app)

class JsonEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            return float(obj)
        return JSONEncoder.default(self, obj)
# SQLALCHEMY_DATABASE_URI = "mysql+mysqlconnector://{username}:{password}@{hostname}/{databasename}".format(
#     username="DrStoneluffy12",
#     password="database123",
#     hostname="DrStoneluffy12.mysql.pythonanywhere-services.com",
#     databasename="DrStoneluffy12$soccer",
# )
# app.config["SQLALCHEMY_DATABASE_URI"] = SQLALCHEMY_DATABASE_URI
# app.config["SQLALCHEMY_POOL_RECYCLE"] = 299
# app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# db = SQLAlchemy(app)
conn = mysql.connect()
cursor =conn.cursor()
app.json_encoder = JsonEncoder
# class Club(db.Model):

#     __tablename__ = "club"

#     name = db.Column(db.String(255), primary_key=True)
#     content = db.Column(db.String(4096))
@app.route('/')
def hello_world():
    return 'hello'

@app.route('/club')
def club():
    cursor.execute("SELECT * from club")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/fan')
def fan():
    cursor.execute("SELECT * from fan")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/player')
def player():
    cursor.execute("SELECT * from player")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/gets')
def gets():
    cursor.execute("SELECT * from gets")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/givesreviews')
def givesreviews():
    cursor.execute("SELECT * from givesreviews")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/matchs')
def matchs():
    cursor.execute("SELECT * from matchs")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/playsin')
def playsin():
    cursor.execute("SELECT * from playsin")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/stadium')
def stadium():
    cursor.execute("SELECT * from stadium")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/homestadium/<name>',methods=['GET','POST'])
def gethomestadium(name):
    # if request.method == 'POST':
    #     data = request.args.get('name')
    #     data = {'data':data}
    #     return jsonify(data)
    # else:
    cursor.execute(f"SELECT * from club where Name like '%{name}%'")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)

@app.route('/getcoulmnname/<name>')
def getcoulmnname(name):
    cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%{name}%'")
    data = cursor.fetchall()
    data = {'data':data}
    return jsonify(data)



@app.route('/getalldata')
@cross_origin(supports_credentials=True)
def getalldata():
    cursor.execute("show tables")
    data = cursor.fetchall()
    datas = []
    for i in data:
        cursor.execute(f"SELECT * from {i[0]}")
        individualdata = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%{i[0]}%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        datas.append({i[0]:{'columns':columns,'data':individualdata}})
    datas = {'data':datas}
    return jsonify(datas)


@app.route('/insertdatareview',methods=['POST'])
@cross_origin(supports_credentials=True)
def insertdatareviews():
    username = request.args.get('username')
    rating = request.args.get('rating')
    text = request.args.get('text')
    review = request.args.get('review')
    review = datetime.strptime(review,'%Y-%m-%d').date()
    # review = f'{review.year}-{review.month}-{review.day}'
    hometeam = request.args.get('hometeam')
    awayteam = request.args.get('awayteam')
    match = request.args.get('match')
    match = datetime.strptime(match,'%Y-%m-%d').date()
    # match=f'{match.year}-{match.month}-{match.day}'
    query = f"INSERT INTO givesreviews VALUES ('{username}',{rating},'{text}','{review}','{hometeam}','{awayteam}','{match}')"
    try:
        # conn = mysql.connect()
        # cursor =conn.cursor()
        cursor.execute(query)
        conn.commit()
        # conn.close()
        datas = {'status':'OK'}
    except Exception as e:
        datas = {'status':'error','error':str(e),'match':match,'query':query}
    # data = {'username':username,'rating':rating,'text':text,'review': review,'hometeam':hometeam,'awayteam':awayteam,'mathc':match}
    return jsonify(datas)





@app.route('/insertdatafan',methods=['POST'])
@cross_origin(supports_credentials=True)
def insertdatafan():
    username = request.args.get('username')
    email = request.args.get('email')
    gender = request.args.get('gender')
    dob = request.args.get('dob')
    dob = datetime.strptime(dob,'%Y-%m-%d').date()
    # dob=f'{dob.day}-{dob.month}-{dob.year}'
    clubname = request.args.get('clubname')
    try:
        cursor.execute(f"INSERT INTO fan VALUES ('{username}','{email}','{gender}','{dob}','{clubname}')")
        conn.commit()
        # conn.close()
        # mysql.connection.commit()
        datas = {'status':'OK'}
    except Exception as e:
        datas = {'status':'error','error':str(e)}
    # data = {'username':username,'rating':rating,'text':text,'review': review,'hometeam':hometeam,'awayteam':awayteam,'mathc':match}
    return jsonify(datas)

@app.route('/givesreviewsdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesreviewsdata():
    hometeam = request.args.get('hometeam')
    awayteam = request.args.get('awayteam')
    try:
        cursor.execute(f"SELECT * from givesreviews where Home_team='{hometeam}' and Away_Team='{awayteam}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%givesreviews%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesplayerdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesplayerdata():
    hometeam = request.args.get('hometeam')
    nationality = request.args.get('nationality')
    try:
        cursor.execute(f"SELECT * from player where HomeTeam='{hometeam}' and Nationality='{nationality}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%Player%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesclubdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesclubdata():
    clubname = request.args.get('clubname')

    try:
        cursor.execute(f"Select * from club where Name='{clubname}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%club%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesplayersdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesplayersdata():
    fname = request.args.get('fname')
    lname = request.args.get('lname')
    try:
        cursor.execute(f"SELECT * from player where FName='{fname}' and LName='{lname}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%Player%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesstadiumdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesstadiumdata():
    name = request.args.get('name')

    try:
        cursor.execute(f"SELECT * from stadium where Name='{name}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%stadium%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givespositiondata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givespositiondata():
    position = request.args.get('position')

    try:
        cursor.execute(f"SELECT * from player where Position='{position}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%Player%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesstadiumcitydata',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesstadiumcitydata():
    city = request.args.get('city')

    try:
        cursor.execute(f"SELECT * from stadium where city='{city}'")
        data = cursor.fetchall()
        cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%stadium%'")
        columnname = cursor.fetchall()
        columns = []
        for j in columnname:
            columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/givesdataby',methods=['POST'])
@cross_origin(supports_credentials=True)
def givesdataby():
    state = request.args.get('state')
    if state == '10':

        try:
            cursor.execute(f"select HomeTeam, count(*) as wins from (Select HomeTeam from matchs where HomeTeamScore > AwayTeamScore) as s group by HomeTeam order by wins DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Home Matches Won']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    elif state == '20':
        try:
            cursor.execute(f"select AwayTeam, count(*) as wins from (Select AwayTeam from matchs where AwayTeamScore > HomeTeamScore) as s group by AwayTeam order by wins DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Away Matches Won']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    elif state == '30':
        try:
            cursor.execute(f"SELECT HomeTeam as Team,(H.homewins+A.awaywins) as Total_wins FROM (select HomeTeam, count(*) as homewins from (Select HomeTeam from matchs where HomeTeamScore > AwayTeamScore) as s group by HomeTeam order by homewins DESC) as H INNER JOIN (select AwayTeam, count(*) as awaywins from (Select AwayTeam from matchs where AwayTeamScore > HomeTeamScore) as d group by AwayTeam order by awaywins DESC) as A ON A.AwayTeam = H.HomeTeam group by Team order by Total_wins DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Matches Won']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    elif state == '40':
        try:
            cursor.execute(f"Select ClubName,Ycards from (SELECT  ClubName, SUM(Ycards) as Ycards, SUM(Shots), SUM(Fouls) FROM gets GROUP BY ClubName) as d group by ClubName order by Ycards DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Yellow Cards']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    elif state == '50':
        try:
            cursor.execute(f"Select ClubName,Shots from (SELECT  ClubName, SUM(Ycards), SUM(Shots) as Shots, SUM(Fouls) FROM gets GROUP   BY ClubName) as d group by ClubName order by Shots DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Shots']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    elif state == '60':
        try:
            cursor.execute(f"Select ClubName,Fouls from (SELECT  ClubName, SUM(Ycards), SUM(Shots) , SUM(Fouls) as Fouls FROM    gets GROUP   BY ClubName) as d group by ClubName order by Fouls DESC limit 10")
            data = cursor.fetchall()
            # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
            # columnname = cursor.fetchall()
            columns = ['TeamName','Fouls']
            # for j in columnname:
            #     columns.append(j[3])
            data = {'columns':columns,'data':data}
        except Exception as e:
            data = {'error':str(e)}
    else:
        data = {'error':'notmatched'}
    data = {'data':data}
    return jsonify(data)

@app.route('/getuniqueseasonsdata',methods=['POST'])
@cross_origin(supports_credentials=True)
def getuniqueseasonsdata():
    state = request.args.get('state')

    try:
        cursor.execute(f"SELECT HomeTeam as Team,(H.homewins+A.awaywins) as Total_wins FROM (select HomeTeam, count(*) as homewins from (Select HomeTeam from matchs where HomeTeamScore > AwayTeamScore and Season={state}) as s group by HomeTeam order by homewins DESC) as H INNER JOIN     (select AwayTeam, count(*) as awaywins from (Select AwayTeam from matchs where AwayTeamScore > HomeTeamScore and Season={state}) as d group by AwayTeam order by awaywins DESC) as A ON  A.AwayTeam = H.HomeTeam group by Team order by Total_wins DESC limit 10")
        data = cursor.fetchall()
        # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
        # columnname = cursor.fetchall()
        columns = ['TeamName','Matches Won']
        # for j in columnname:
        #     columns.append(j[3])
        data = {'columns':columns,'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)


@app.route('/getuniqueseasons',methods=['GET'])
@cross_origin(supports_credentials=True)
def getuniqueseasons():
    # city = request.args.get('city')

    try:
        cursor.execute(f"select distinct(season) from matchs")
        data = cursor.fetchall()
        # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
        # columnname = cursor.fetchall()
        # columns = []
        # for j in columnname:
        #     columns.append(j[3])
        data = {'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)

@app.route('/getuniquecity',methods=['GET'])
@cross_origin(supports_credentials=True)
def getuniquecity():
    # city = request.args.get('city')

    try:
        cursor.execute(f"select distinct(city) from stadium")
        data = cursor.fetchall()
        # cursor.execute(f"SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like '%matchs%'")
        # columnname = cursor.fetchall()
        # columns = []
        # for j in columnname:
        #     columns.append(j[3])
        data = {'data':data}
    except Exception as e:
        data = {'error':str(e)}
    data = {'data':data}
    return jsonify(data)