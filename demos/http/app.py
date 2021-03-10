# -*- coding: utf-8 -*-
import os
from flask import (Flask, redirect, url_for, abort,
                   make_response, jsonify, request,
                   session)


app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'secret string')


@app.route('/')
@app.route('/hello', methods=['GET', 'POST'])
def hello():
    name = request.args.get('name')
    if name is None:
        name = request.cookies.get('name', 'Human')
        response = '<h1>Hello, %s</h1>' % name
        if 'logged_in' in session:
            response += '[Authenticated]'
        else:
            response += '[Not Authenticated]'
        return response


@app.route('/go_back/<int:year>')
def go_back(year):
    return '<p>Welcome to %d!</p>' % (2018 - year)


@app.route('/colors/<any(blue, white, red):color>')
def three_colors(color):
    return '<p>Love is patient and kind. Love is not jealous or boastful or proud or rude.</p>'


@app.route('/hi')
def hi():
    return redirect(url_for('hello'))


# 手动抛出异常, 一旦abort函数被调用，abort之后的代码不会被执行
@app.route('/404')
def not_found():
    abort(404)


@app.route('/foo')
def foo():
    response = make_response('Hello World')
    response.mimetype = 'text/plain'
    return response


# return response with different formats
@app.route('/note', defaults={'content_type': 'text'})
@app.route('/note/<content_type>')
def note(content_type):
    content_type = content_type.lower()
    if content_type == 'text':
        body = '''Note
to: Peter
from: Jane
heading: Reminder
body: Don't forget the party!
'''
        response = make_response(body)
        response.mimetype = 'text/plain'
    elif content_type == 'html':
        body = '''<!DOCTYPE html>
<html>
<head></head>
<body>
  <h1>Note</h1>
  <p>to: Peter</p>
  <p>from: Jane</p>
  <p>heading: Reminder</p>
  <p>body: <strong>Don't forget the party!</strong></p>
</body>
</html>
'''
        response = make_response(body)
        response.mimetype = 'text/html'
    elif content_type == 'xml':
        body = '''<?xml version="1.0" encoding="UTF-8"?>
<note>
  <to>Peter</to>
  <from>Jane</from>
  <heading>Reminder</heading>
  <body>Don't forget the party!</body>
</note>
'''
        response = make_response(body)
        response.mimetype = 'application/xml'
    elif content_type == 'json':
        body = {"note": {
            "to": "Peter",
            "from": "Jane",
            "heading": "Remider",
            "body": "Don't forget the party!"
        }
        }
        response = jsonify(body)
    else:
        abort(400)
    return response


@app.route('/set/<name>')
def set_cookie(name):
    response = make_response(redirect(url_for('hi')))
    response.set_cookie('name', name)
    return response


@app.route('/login')
def login():
    session['logged_in'] = True
    return redirect(url_for('hello'))


@app.route('/admin')
def admin():
    if not session.get('logged_in', False):
        abort(403)
    return 'Welcome to admin page'


@app.route('/logout')
def logout():
    if 'logged_in' in session:
        session.pop('logged_in')
    return redirect(url_for('hello'))
