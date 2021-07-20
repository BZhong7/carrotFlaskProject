import datetime
import sqlite3

from flask import Flask, render_template

app = Flask(__name__)


def cents_to_dollars(cents):
    return cents / 100


def iso_str_to_date_str(iso_string):
    datetime_ = datetime.datetime.strptime(iso_string, "%Y-%m-%dT%H:%M:%S.%f")
    return str(datetime_.date())


@app.route('/expenses')
def expenses(employee_id):
    conn = sqlite3.connect('./interview-app.db')
    expenses_list = conn.execute(
        'SELECT created_datetime, serviced_datetime, amount, status FROM expenses').fetchall()

    expenses_list_formatted = []
    for expense in expenses_list:
        expenses_list_formatted.append([
            iso_str_to_date_str(expense[0]),
            expense[1],
            '${0:.2f}'.format(cents_to_dollars(expense[2])),
            expense[3]
        ])

    return render_template('expenses.html', expenses=expenses_list_formatted)

@app.route('/')
def members():
    conn = sqlite3.connect('./interview-app.db')
    members_list = conn.execute(
        'SELECT first_name, last_name FROM members').fetchall()

    return render_template('members.html', members=members_list)

if __name__ == '__main__':
    app.run(debug=True)
