import sys
from PySide6.QtWidgets import (QApplication,QWidget,QPushButton,QVBoxLayout,QLabel,QLineEdit,QListWidget,QMessageBox)
from PySide6.QtGui import QIcon

'''
QApplication — основное приложение Qt
QWidget — базовое окно
QPushButton — кнопка
QVBoxLayout — вертикальный layout (расположение элементов)
QLabel — текст
QLineEdit — поле ввода
QListWidget — список
'''
'''
color: red; — цвет текста
background-color: yellow; — цвет заливки
border: 2px solid black; — рамка
border-radius: 5px; — скругление
padding: 10px; — отступ текста от краев внутри элемента
margin: 5px; — отступ самого элемента от соседей
'''

fm_app = QApplication(sys.argv)
fm_app.setWindowIcon(QIcon('carrot.png'))
app_windows = []
fm_app.setStyleSheet("""
    QWidget {
        font-family: 'Segoe UI';
        font-size: 16px;
        background-color: #c3d6b2; 
    }
    QPushButton {
        background-color: #f5aa5f; 
        min-height: 15px;     
        min-width: 10px; 
        color: #1a3305;
        padding: 8px;
        border: 2px solid #cc9156; 
        border-radius: 10px;
        min-height: 20px;
        margin: 15px;
    }
    QPushButton:pressed {
        background-color: #41800e;
    }
    QLineEdit {
        background-color: #fcedf6;
        color: #fcedf6;        
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 8px;
        min-height: 20px;
    }
    QListWidget {
        background-color:#c3d6b2;
        border-radius: 10px;
        padding: 5px;
    }
    QListWidget::item {
        color: #1a3305;
        background-color: #f5aa5f;
        border: 2px solid #cc9156; 
        border-radius: 10px;
        padding: 5px;
    }
""")

def open_window(window,layout):
    '''
    функция для сохранения окон
    '''
    window.setLayout(layout)
    window.show()
    app_windows.append(window)

def open_register():
    window = QWidget()
    window.resize(300, 200)
    window.setWindowTitle('Registration')
    layout = QVBoxLayout()

    # ввод логина
    layout.addWidget(QLabel('login'))
    login_input = QLineEdit()
    layout.addWidget(login_input)

    # ввод пароля
    layout.addWidget(QLabel('password'))
    password_input = QLineEdit()
    layout.addWidget(password_input)

    # ввод email
    layout.addWidget(QLabel('email'))
    email_input = QLineEdit()
    layout.addWidget(email_input)
    # регистрация
    login_button = QPushButton('Sign гз')
    layout.addWidget(login_button)

    open_window(window,layout)

def open_login():
    '''окно логина'''
    window = QWidget()
    window.resize(300, 200)
    window.setWindowTitle('Sign in')
    layout = QVBoxLayout()

    # ввод логина
    layout.addWidget(QLabel('Login'))
    login_input = QLineEdit()
    layout.addWidget(login_input)

    # ввод пароля
    layout.addWidget(QLabel('Password'))
    password_input = QLineEdit()
    layout.addWidget(password_input)

    # вход
    login_button = QPushButton('Sign in')
    layout.addWidget(login_button)

    open_window(window, layout)

def open_markets_list():
    '''список рынков'''
    window = QWidget()
    window.resize(500, 400)
    window.setWindowTitle('Farmer markets')
    layout = QVBoxLayout()
    layout.addWidget(QLabel('Markets list'))

    # создание списка
    markets_list = QListWidget()

    # тестовые рынки, заменить на функцию
    markets_list.addItem('Airport Farmers and Flea Market')
    markets_list.addItem('Alexandria Farmers Market')
    markets_list.addItem('Algoma Sunday Farmers Market')
    markets_list.itemDoubleClicked.connect(lambda item: open_market_info())
    layout.addWidget(markets_list)

    open_window(window,layout)

def open_market_search():

    window = QWidget()
    window.resize(200, 100)
    window.setWindowTitle('Search Farmer Market')
    layout = QVBoxLayout()

    # ввод названия рынка
    layout.addWidget(QLabel('Enter market name'))
    search_input = QLineEdit()
    layout.addWidget(search_input)

    # кнопка поиска
    search_button = QPushButton('Search')
    layout.addWidget(search_button)

    open_window(window,layout)

def open_market_review():

    window = QWidget()
    window.resize(300, 200)
    window.setWindowTitle('Add Review')
    layout = QVBoxLayout()

    layout.addWidget(QLabel('Write your review'))
    
    # поле для оценки
    layout.addWidget(QLabel('Enter rate (from 1 to 5)'))
    rate_input = QLineEdit()
    layout.addWidget(rate_input)

    # поле для текста
    layout.addWidget(QLabel('Write a text review (optional)'))
    review_input = QLineEdit()
    layout.addWidget(review_input)

    # кнопка отправки
    submit_button = QPushButton('Submit')
    layout.addWidget(submit_button)

    open_window(window,layout)

def open_market_info():
    window = QWidget()
    window.resize(300, 300)
    window.setWindowTitle('Market Name')
    layout = QVBoxLayout()
    layout.addWidget(QLabel('Rating:'))
    layout.addWidget(QLabel('Address:'))
    layout.addWidget(QLabel('Coordinates:'))
    layout.addWidget(QLabel('Web-resources:'))
    layout.addWidget(QLabel('Working hours:'))


    # переход к функции open_market_review()

    review_button.clicked.connect(open_market_review)
    layout.addWidget(review_button)

    open_window(window, layout)


'''Сборка'''

# основное окно
main_window = QWidget()
main_window.setWindowTitle('Farmers Markets App')
main_window.resize(400, 600)
layout = QVBoxLayout()

# кнопки меню для функций
register_button = QPushButton('Registration')
login_button = QPushButton('Login')
search_button = QPushButton('Search market')
markets_list_button = QPushButton('Markets list')
review_button = QPushButton('Add review')
exit_button = QPushButton('Exit')

# добавление кнопок на окно главного меню
layout.addWidget(register_button)
layout.addWidget(login_button)
layout.addWidget(search_button)
layout.addWidget(markets_list_button)
layout.addWidget(review_button)
layout.addWidget(exit_button)

# подключение функций к кнопкам
register_button.clicked.connect(open_register)
login_button.clicked.connect(open_login)
markets_list_button.clicked.connect(open_markets_list)
search_button.clicked.connect(open_market_search)
review_button.clicked.connect(open_market_review)
# выход
exit_button.clicked.connect(fm_app.quit)

main_window.setLayout(layout)
main_window.show()
fm_app.exec()
