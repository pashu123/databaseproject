import psycopg2
import psycopg2.extras

from flask import Flask,render_template,request
app = Flask(__name__)


def connectToDB():
    connectionstring = 'dbname = dbproject user = postgres password = pashu123 host = localhost'
    print(connectionstring)
    try:
        return(psycopg2.connect(connectionstring))
    except:
        print('Cannot connect to database')


@app.route('/')
def index():
    return render_template('index.html')


################################################### Demographics ##########################################################

@app.route('/demo/')
def demographics():
    return render_template('demo.html')

@app.route('/demo/1/')
def show_country():
    conn = connectToDB()
    cur = conn.cursor()

    try:
        cur.execute('''with t as (select respondentid , countrynumeric2 from datavalues) 
                select countrynumeric2,count(respondentid) from t where countrynumeric2 != ''
                group by countrynumeric2 order by count desc''')
    except:
        print('Executing error')
    results = cur.fetchall()
    return render_template('demo1.html',country = results)


@app.route('/demo/2/')
def show_age():
    conn = connectToDB()
    cur1 = conn.cursor()
    cur2 = conn.cursor()
    cur3 = conn.cursor()
    cur4 = conn.cursor()

    try:
        cur1.execute('''select q2age, count(respondentid)
                    from datavalues
                    group by q2age order by count desc''')
        cur2.execute('''select q2age, count(respondentid) from datavalues
                        where q3gender = 'Male'
                            group by q2age;''')
        cur3.execute('''select q2age, count(respondentid) from datavalues
                        where q3gender = 'Female'
                        group by q2age''')
        cur4.execute('''select q2age, count(respondentid) from datavalues
                        where q3gender = 'Non-Binary'
                            group by q2age''')

    except:
        print('Executing error')
    result1 = cur1.fetchall()
    result2 = cur2.fetchall()
    result3 = cur3.fetchall()
    result4 = cur4.fetchall()
    return render_template('demo2.html',ageall = result1,agem =result2,agef = result3,ageb =result4)


@app.route('/demo/3/')
def show_codage():
    conn = connectToDB()
    cur1 = conn.cursor()
    cur2 = conn.cursor()
    cur3 = conn.cursor()
    cur4 = conn.cursor()

    try:
        cur1.execute('''select q1agebegincoding, count(respondentid)from datavalues 
                        group by q1agebegincoding
                        order by q1agebegincoding;''')
        cur2.execute('''select q1agebegincoding, count(respondentid)
                        from datavalues where q3gender = 'Male'
                        group by q1agebegincoding order by q1agebegincoding;''')
        cur3.execute('''select q1agebegincoding, count(respondentid)
                        from datavalues where q3gender = 'Female'
                        group by q1agebegincoding order by q1agebegincoding;''')
        cur4.execute('''select q1agebegincoding, count(respondentid)
                        from datavalues where q3gender = 'Non-Binary'
                        group by q1agebegincoding order by q1agebegincoding;''')

    except:
        print('Executing error')
    result1 = cur1.fetchall()
    result2 = cur2.fetchall()
    result3 = cur3.fetchall()
    result4 = cur4.fetchall()
    return render_template('demo3.html',codall = result1,codm =result2,codf = result3,codb =result4)


@app.route('/demo/4/')
def show_univ():
    conn = connectToDB()
    cur1 = conn.cursor()
    cur2 = conn.cursor()
    cur3 = conn.cursor()
    cur4 = conn.cursor()

    try:
        cur1.execute('''select q6learncodeuni, (count(respondentid)*100/cast((select count(*) from datavalues)
                        as numeric(10,4))) as percentage from datavalues group by q6learncodeuni
                        order by percentage desc;''')
        cur2.execute('''select q6learncodeselftaught, (count(respondentid)*100/cast((select count(*) from datavalues) as numeric(10,4)))
                        as percentage from datavalues group by q6learncodeselftaught
                        order by percentage desc;''')
        cur3.execute('''select q6learncodeacceltrain, (count(respondentid)*100/cast((select count(*) from datavalues) as numeric(10,4)))
                        as percentage from datavalues group by q6learncodeacceltrain
                        order by percentage desc;''')
        cur4.execute('''select q6learncodedontknowhowtoyet, (count(respondentid)*100/cast((select count(*) from datavalues) as numeric(10,4)))
                        as percentage from datavalues group by q6learncodedontknowhowtoyet
                        order by percentage desc;''')

    except:
        print('Executing error')
    result1 = cur1.fetchall()
    result2 = cur2.fetchall()
    result3 = cur3.fetchall()
    result4 = cur4.fetchall()
    return render_template('demo4.html',univ = result1,selft =result2,accel = result3,dont =result4)


@app.route('/demo/5/',methods = ['POST','GET'])
def age_mooc():
    conn = connectToDB()
    cur1 = conn.cursor()
    cur2 = conn.cursor()
    cur3 = conn.cursor()
    cur4 = conn.cursor()

    if request.method == 'POST':
        age = request.form["age"]
        result1,result2,result3,result4 = [],[],[],[]
        value = ['q30learncodestackoverflow', 'q30learncodeyoutube','q30learncodemooc','q30LearnCodeCompCodingSites',
                    'q30LearnCodeOnlineTutorial', 'q30LearnCodeBooks', 'q30LearnCodeAcademicPaper']
        for group in value:
            try:
                if age == 'All':
                    script = f'''select {group}, (count(respondentid)*100/cast((select count(*) 
                        from datavalues) as numeric(10,4))) as percentage 
                        from datavalues where {group} <> ''
                        group by  {group};'''
                else:
                    script = f'''select q2age, {group}, (count(respondentid)*100/cast((select count(*) 
                            from datavalues where q2age = '{age}') as numeric(10,4))) as percentage 
                            from datavalues where q2age = '{age}' and {group} <> ''
                            group by q2age, {group};'''
                script2 = f'''select  {group}, (count(respondentid)*100/cast((select count(*)
                            from datavalues where q3gender = 'Female') as numeric(10,4))) as percentage
                            from datavalues where q3gender = 'Female' and {group} <> ''
                            group by {group};'''
                script3 = f'''select  {group}, (count(respondentid)*100/cast((select count(*)
                            from datavalues where q3gender = 'Male') as numeric(10,4))) as percentage
                            from datavalues where q3gender = 'Male' and {group} <> ''
                            group by {group};'''
                script4 = f'''select  {group}, (count(respondentid)*100/cast((select count(*)
                            from datavalues where q3gender = 'Non-Binary') as numeric(10,4))) as percentage
                            from datavalues where q3gender = 'Non-Binary' and {group} <> ''
                            group by {group};'''

                cur1.execute(script)
                result1.append(cur1.fetchall())
                cur2.execute(script2)
                result2.append(cur2.fetchall())
                cur3.execute(script3)
                result3.append(cur3.fetchall())
                cur4.execute(script4)
                result4.append(cur4.fetchall())

            except:
                print('Executing error')
        return render_template('demo5.html',totval = result1, agegp = age,totm = result2,totf = result3,totb = result4)

    return render_template('demo5.html')





################################################### Technology ###############################################################

@app.route('/tech/')
def technology():
    return render_template('tech.html')

@app.route('/tech/1/',methods = ['POST','GET'])
def tech1():
    conn = connectToDB()
    cur = conn.cursor()

    if request.method == 'POST':
        age = request.form["age"]
        langdict = {"q25LangOcaml":'Ocaml',"q25LangCSharp":'CSharp',"q25LangC":'C',"q25LangKotlin":'Kotlin',"q25LangHaskell":'Haskell',
                "q25LangTypescript":'Typescript',"q25LangR":'R',"q25LangRust":'Rust',"q25LangErlang":'Erlang',"q25LangCPlusPlus":'C++',
                "q25LangJava":'Java',"q25LangGo":'Go',"q25LangJavascript":'Javascript',"q25LangRuby":'Ruby',
                "q25LangSwift":'Swift',"q25LangPHP":'PHP',"q25LangPerl":'Perl',"q25LangPascal":'Pascal',
                "q25LangJulia":'Julia',"q25LangClojure":'Clojure',"q25Scala":'Scala',"q25LangLua":'Lua',"q25LangPython":'Python'}

        result = []
        lang = ["q25LangOcaml","q25LangCSharp","q25LangC","q25LangKotlin","q25LangHaskell","q25LangTypescript","q25LangR",
                "q25LangRust","q25LangErlang","q25LangCPlusPlus","q25LangJava","q25LangGo","q25LangJavascript","q25LangRuby",
                "q25LangSwift","q25LangPHP","q25LangPerl","q25LangPascal","q25LangJulia","q25LangClojure","q25Scala","q25LangLua","q25LangPython"]

        for group in lang:
            try:
                if age == 'All':
                    script = f'''select  (count(respondentid)*100/cast((select count(*) 
                                    from datavalues) as numeric(10,4))) as percentage 
                                    from datavalues  where {group} = 'Know'
                                    group by  {group} order by {group};'''
                else:
                    script = f'''select  (count(respondentid)*100/cast((select count(*) 
                            from datavalues where q2age = '{age}') as numeric(10,4))) as percentage 
                            from datavalues where q2age = '{age}' and {group} = 'Know'
                            group by q2age, {group} order by {group}, q2age;'''

                cur.execute(script)
                result.append((cur.fetchall(),langdict[group]))

            except:
                print('Executing error')
        return render_template('tech1.html',totval = result,agegp = age)

    return render_template('tech1.html')







################################################### Work ######################################################################
@app.route('/work/')
def work():
    return render_template('work.html')




################################################### Predictions #################################################################
@app.route('/pred/')
def pred():
    return render_template('pred.html')








################################################### Pop Quiz #################################################################
@app.route('/pop/',methods = ['POST','GET'])
def pop():
    if request.method == 'POST':
        result = request.form
        print(result)
        return render_template('pop1.html',result = result)
    return render_template('pop.html')







if __name__ == '__main__':
    app.run(debug = True)



