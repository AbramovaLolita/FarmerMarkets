import sys
import os
import fm_util_gui
from PySide6.QtWidgets import (QApplication,QWidget,QListWidgetItem,QHBoxLayout,QGroupBox,QRadioButton,QPushButton,QVBoxLayout,QLabel,QLineEdit,QListWidget,QMessageBox,QFormLayout)
from PySide6.QtGui import QIcon
from PySide6.QtCore import Qt

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
basedir = os.path.dirname(__file__)
icon_path = os.path.join(basedir, 'carrot.png')
fm_app.setWindowIcon(QIcon(icon_path))
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
        color: #1a3305; 
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
    QFrame { 
    background-color:#c3d6b2;
    border-radius: 10px;
    padding: 5px
    }
""")

USER_ID = None

def create_sort(parent_layout):
    '''
    @requires: layout поиска
    @modifies: None
    @effects: None
    @raises: None
    @returns: радиокнопки полей сортировки и порядка сортировки
    '''
    # поле сортировки
    sort_group = QGroupBox("Sort by:")
    sort_layout = QHBoxLayout(sort_group)

    rb_name = QRadioButton("Name")
    rb_city = QRadioButton("City")
    rb_state = QRadioButton("State")
    rb_rating = QRadioButton("Rating")
    rb_name.setChecked(True)

    for rb in [rb_name, rb_city, rb_state, rb_rating]:
        sort_layout.addWidget(rb)

    # направление
    order_group = QGroupBox("Order by:")
    order_layout = QHBoxLayout(order_group)

    rb_asc = QRadioButton("Ascending")
    rb_desc = QRadioButton("Descending")
    rb_asc.setChecked(True)

    order_layout.addWidget(rb_asc)
    order_layout.addWidget(rb_desc)

    parent_layout.addWidget(sort_group)
    parent_layout.addWidget(order_group)

    return rb_name, rb_city, rb_state, rb_rating, rb_asc, rb_desc

def order_sort(rb_name,rb_city,rb_state,rb_rating,rb_asc,rb_desc):
    '''
    @requires: пользовательский выбор сортировки по радиокнопке
    @modifies: None
    @effects: None
    @raises: None
    @returns: атрибут сортировки, порядок сортировки
    '''
    sort_map = {rb_name: 'name', rb_city: 'city', rb_state: 'state', rb_rating: 'rating'}
    current_sort = 'name'
    for rb, field in sort_map.items():
        if rb.isChecked():
            current_sort = field
            break
    current_order = 'ASC' if rb_asc.isChecked() else 'DESC'
    return current_sort, current_order

def on_click(item):
    name = item.data(Qt.ItemDataRole.UserRole)
    if name:
        open_market_info(name)

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
    # строка логина
    layout.addWidget(QLabel('login'))
    login_input = QLineEdit()
    layout.addWidget(login_input)
    # строка пароля
    layout.addWidget(QLabel('password'))
    password_input = QLineEdit()
    layout.addWidget(password_input)
    # ввод email
    layout.addWidget(QLabel('email'))
    email_input = QLineEdit()
    layout.addWidget(email_input)
    # регистрация
    login_button = QPushButton('Sign up')
    layout.addWidget(login_button)
    open_window(window, layout)

    # передача данных в обработчик
    def registration_feedback():
        reg_result = fm_util_gui.market_register (
            login_input.text(),
            password_input.text(),
            email_input.text(),
        )
        if reg_result is None:
            QMessageBox.warning(window, 'Warning', 'Username and password can not be empty')
        elif reg_result is False:
            QMessageBox.critical(window, 'Error', 'Authorization failed. Please try again later')
        else:
            QMessageBox.information(window, 'Info', 'Registration is successful.')
            window.close()
    login_button.clicked.connect(registration_feedback)

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
    password_input.setEchoMode(QLineEdit.Password)

    def login_feedback():
        global USER_ID
        USER_ID = fm_util_gui.market_login (
            login_input.text(),
            password_input.text()
        )
        if not USER_ID:
            QMessageBox.warning(window, 'Warning', 'Username or password are incorrect. Try again.')
        else:
            QMessageBox.information(window, 'Info', 'Authentication is successful.')
            window.close()

    login_button = QPushButton('Sign in')
    layout.addWidget(login_button)
    login_button.clicked.connect(login_feedback)
    open_window(window, layout)

def open_markets_list():
    current_page = 0
    window = QWidget()
    window.resize(800, 600)
    window.setWindowTitle('Farmer markets')
    layout = QVBoxLayout()

    # кнопки сортировки
    rb_name, rb_city, rb_state, rb_rating, rb_asc, rb_desc = create_sort(layout)
    # кнопка применения сортировок
    apply_button = QPushButton('Apply')
    layout.addWidget(apply_button)
    layout.addStretch()

    markets_list = QListWidget()
    layout.addWidget(markets_list, stretch=1)

    # навигация
    page_container = QWidget()
    page_layout = QHBoxLayout(page_container)
    page_label = QLabel()

    # предыдущая
    btn_prev = QPushButton("← Prev")
    btn_prev.setFixedSize(100, 30)
    page_layout.addWidget(btn_prev)
    page_layout.addStretch()
    # нумерация страниц
    page_layout.addWidget(page_label)

    # следующая
    btn_next = QPushButton("Next →")
    btn_next.setFixedSize(100, 30)
    page_layout.addStretch()
    page_layout.addWidget(btn_next)
    page_container.hide()
    layout.addWidget(page_container)

    # создание списка
    def market_page():
        nonlocal current_page
        markets_list.clear()
        sort, order = order_sort(rb_name,rb_city,rb_state,rb_rating,rb_asc,rb_desc)
        market_list, total_pages = fm_util_gui.markets_list(current_page,sort,order)
        if market_list:
            page_container.show()
            for row in market_list:
                item = QListWidgetItem(f'{row[0]}. Rating: {row[1]:.2f}, Reviews: {row[2]}.')
                item.setData(Qt.ItemDataRole.UserRole, row[0])
                markets_list.addItem(item)

            page_label.setText(f"Page {current_page + 1} of {total_pages}")
            btn_prev.setEnabled(current_page > 0)
            btn_next.setEnabled(current_page < total_pages - 1)
        else:
            page_container.hide()
            markets_list.addItem("No markets found.")

    def go_next():
        nonlocal current_page
        current_page += 1
        market_page()

    def go_prev():
        nonlocal current_page
        current_page -= 1
        market_page()

    apply_button.clicked.connect(market_page)
    btn_next.clicked.connect(go_next)
    btn_prev.clicked.connect(go_prev)
    layout.addLayout(page_layout)
    markets_list.itemDoubleClicked.connect(on_click)

    # сборка
    open_window(window,layout)

def open_market_search():
    window = QWidget()
    window.resize(800, 800)
    window.setWindowTitle('Search Farmer Market')
    layout = QVBoxLayout(window)

    rb_name, rb_city, rb_state, rb_rating, rb_asc, rb_desc = create_sort(layout)

    # форма поиска
    loc_group = QGroupBox()
    loc_layout = QHBoxLayout(loc_group)

    # ввод данных для поиска
    city_box = QVBoxLayout()
    city_box.addWidget(QLabel('City:'))
    city_input = QLineEdit()
    city_box.addWidget(city_input)

    state_box = QVBoxLayout()
    state_box.addWidget(QLabel('State:'))
    state_input = QLineEdit()
    state_box.addWidget(state_input)

    zip_box = QVBoxLayout()
    zip_box.addWidget(QLabel('Zip:'))
    zip_input = QLineEdit()
    zip_box.addWidget(zip_input)

    loc_layout.addLayout(city_box)
    loc_layout.addLayout(state_box)
    loc_layout.addLayout(zip_box)
    layout.addWidget(loc_group)

    dist_group = QGroupBox("Distance Search:")
    dist_layout = QHBoxLayout(dist_group)

    # блок Latitude
    lat_box = QVBoxLayout()
    lat_box.addWidget(QLabel('Your latitude'))
    lat = QLineEdit()
    lat_box.addWidget(lat)

    # блок Longitude
    long_box = QVBoxLayout()
    long_box.addWidget(QLabel('Your longitude'))
    long = QLineEdit()
    long_box.addWidget(long)

    # блок Radius
    radius_box = QVBoxLayout()
    radius_box.addWidget(QLabel('Radius (km)'))
    dist = QLineEdit()
    radius_box.addWidget(dist)

    # сборка полей для дистанции
    dist_layout.addLayout(lat_box)
    dist_layout.addLayout(long_box)
    dist_layout.addLayout(radius_box)

    layout.addWidget(dist_group)

    # кнопка поиска
    search_button = QPushButton('Search')
    layout.addWidget(search_button)

    # результаты поиска
    search_list = QListWidget()
    layout.addWidget(search_list)
    def market_search():
        search_list.clear()
        sort, order = order_sort(rb_name, rb_city, rb_state, rb_rating, rb_asc, rb_desc)
        search_result = fm_util_gui.market_search(city_input.text(), state_input.text(),
                                                  zip_input.text(),lat.text(),
                                                  long.text(),dist.text(),sort,order)
        if not search_result:
            QMessageBox.warning(window, 'Warning', 'No markets found or filters are incorrect. Try again.')
        else:
            for row in search_result:
                name, street, city, state, zip_code, rating = row
                rating_txt = f"{rating:.1f}" if rating else "0.0"
                loc_parts = [street, city, state, zip_code]
                address = ", ".join([p for p in loc_parts if p])
                item = QListWidgetItem(f'{name} on {address}. Rating {rating_txt}')
                item.setData(Qt.ItemDataRole.UserRole, row[0])
                search_list.addItem(item)

    search_list.itemDoubleClicked.connect(on_click)
    search_button.clicked.connect(market_search)
    open_window(window,layout)

def open_market_review(market_name):

    window = QWidget()
    window.resize(300, 200)
    window.setWindowTitle(f'Review for {market_name}')
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
    def add_review():
        global USER_ID
        result = fm_util_gui.market_review(market_name,rate_input.text(),review_input.text(),USER_ID)
        if result:
            QMessageBox.information(window, 'Success', 'Review added!')
            window.close()
        else:
            QMessageBox.critical(window, 'Error', 'Something went wrong.')
    # кнопка отправки
    submit_button = QPushButton('Submit')
    layout.addWidget(submit_button)
    submit_button.clicked.connect(add_review)

    open_window(window,layout)

def open_market_info(market_name):
    window = QWidget()
    window.resize(300, 300)
    window.setWindowTitle(f'{market_name}')
    info = fm_util_gui.market_info(f'{market_name}')
    if not info:
        QMessageBox.warning(window, 'Warning', 'Market name is incorrect or market does not exist')
        return
    main = info.get("main_info", [])
    market_name, street, lat, long, city, county, state, web, fb, tw, other_med, num, date, time, rating, review_count = main
    products = ", ".join(info.get('products', []))
    payment = ", ".join(info.get('payments', []))
    address = ", ".join(filter(None, [street, city, state]))
    rating_txt = f"{rating:.1f}" if rating else "0.0"

    window.setWindowTitle(f'{market_name}')
    layout = QVBoxLayout()

    form = QFormLayout()
    form.addRow('Rating:', QLabel(f' {rating_txt} (Reviews: {review_count})'))
    form.addRow('Address:', QLabel(f'{address or "N/A"}'))
    form.addRow('Coordinates:', QLabel(f'Coordinates: {lat or "—"}, {long or "—"}'))
    form.addRow('Web-resources:', QLabel(f'{web or "N/A"}'))
    form.addRow('Payment methods:', QLabel(f'{payment or "—"}'))
    form.addRow('Dates:', QLabel(f'{date or "N/A"}.'))
    form.addRow('Times:', QLabel(f'Times: {time or "N/A"}'))
    products = QLabel(f'{products}')
    products.setWordWrap(True)
    products.setMaximumWidth(400)
    form.addRow('Products:', products)
    layout.addLayout(form)

    # переход к функции open_market_review()
    review_button = QPushButton('Write a review')
    def review_permission():
        global USER_ID
        if not USER_ID:
            QMessageBox.warning(window, "Error", "You must sign in to add a review")
        else:
           open_market_review(market_name)
    review_button.clicked.connect(review_permission)
    layout.addWidget(review_button)


    # удаление записи о рынке (только для пользователей с ролью admin)
    delete_button = QPushButton('Delete record')

    def delete_market():
            result = fm_util_gui.market_delete(USER_ID, market_name)
            if result:
                QMessageBox.information(window, 'Success', f'Market {market_name} deleted.')
                window.close()
            else:
                QMessageBox.critical(window, 'Error', 'You do not have permission for this operation')

    delete_button.clicked.connect(delete_market)
    layout.addWidget(delete_button)
    open_window(window, layout)

def close_app():
    QApplication.instance().quit()


'''Сборка'''

# основное окно
main_window = QWidget()
main_window.setWindowTitle('Farmers Markets App')
main_window.resize(400, 600)
layout = QVBoxLayout()
layout.setSpacing(10)

# кнопки меню для функций
title_layout = QHBoxLayout()
title_layout.setContentsMargins(0, 0, 0, 0)
w, h = 150, 50
exit_button = QPushButton('Exit')
exit_button.setFixedSize(w, h)
title_layout.addWidget(exit_button)

register_button = QPushButton('Registration')
register_button.setFixedSize(w, h)
title_layout.addWidget(register_button)

login_button = QPushButton('Login')
login_button.setFixedSize(w, h)
title_layout.addWidget(login_button)

layout.addLayout(title_layout)
layout.addSpacing(150)

search_button = QPushButton('Search market')
markets_list_button = QPushButton('Markets list')

layout.addWidget(search_button)
layout.addWidget(markets_list_button)
layout.addStretch()
main_window.setLayout(layout)

# подключение функций к кнопкам
register_button.clicked.connect(open_register)
login_button.clicked.connect(open_login)
markets_list_button.clicked.connect(open_markets_list)
search_button.clicked.connect(open_market_search)
exit_button.clicked.connect(close_app)

main_window.show()
fm_app.exec()
