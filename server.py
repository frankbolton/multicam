from flask import Flask
from subprocess import call
#import picamera

app = Flask(__name__)

@app.route('/test')
def index():
	return 'raspi and flask running;'

	#call(["raspistill","-w","640","-h","480","-q", "20", "-ss", "10000","t","1" ,"-o", "/home/pi/multicam/static/pyphoto.jpg"])


@app.route('/')
def justPhoto():
	call (["raspistill","-t","1","-o","/home/pi/multicam/static/p.jpg"])
	return '<img src="static/p.jpg">'

@app.route('/pyimage')
def pi():
	call (["raspistill","-t","1","-o","/home/pi/multicam/static/pyimage.jpg"])
	return 'success'


@app.route('/small')
def smallPhoto():
	 call (["raspistill","-t","1","-w","640","-h","480","-o","/home/pi/multicam/static/s.jpg"])
         return '<img src="static/s.jpg">'

@app.route('/s')
def si():
	call (["raspistill","-t","1","-w","640","-h","480","-o","/home/pi/multicam/static/s.jpg"])
	return 'success'

if __name__ == '__main__':
	app.run(host='0.0.0.0', debug=True)
