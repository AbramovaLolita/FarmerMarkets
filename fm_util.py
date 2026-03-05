import fm_model
import math
import fm_view_console as view


SORT_MAPPING = {
    "1": "name",
    "2": "city",
    "3": "state",
    "4": "rating"
}
ORDER = 'ASC'
SORT = '1'
def sort_list():
    view.print_order_by()
    choice = input()
    SORT = SORT_MAPPING.get(choice, SORT_MAPPING['1'])
    view.print_asc_desc()
    direction_choice = input()
    direction = int(direction_choice) if direction_choice.isdigit() else 1
    ORDER = "ASC" if direction == 1 else "DESC"


def market_register():
    '''@requires: username, password, email
@modifies: таблица users в базе данных (добавляет новую строку).
@effects: сообщения об успехе, ошибке или пустых полях
@raises: None
@returns: None
'''
    command = ''
    sign_up = False
    while not sign_up or command != 'exit':
        view.print_request_login()
        username = input()
        view.print_request_password()
        password = input()
        if not username or not password:
            view.print_empty()
            continue
        else:
            view.print_request_email()
            email = input()
            sign_up = fm_model.register_user_db(username, password, email)
            if sign_up:
                view.print_successful()
                break
            else:
                view.print_failed()


def market_login():
    '''@requires: username, password
@modifies: Ничего не меняет.
@effects: Выводит сообщения об успешной авторизации или ошибке.
@raises: psycopg2.Error.
@returns: int (ID пользователя) при успехе или None, если пользователь прервал ввод командой 'exit'.'''
    user_id = None
    command = ''
    while user_id is None or command != 'exit':
        view.print_request_login()
        username = input()
        view.print_request_password()
        password = input()
        user_id = fm_model.login_user_db(username, password)
        if user_id:
            view.print_auth_success()
            return user_id
        else:
            view.print_auth_error()
            command = input().lower()

def markets_list():
    '''@requires: Доступ к таблице markets и reviews. Ввод команд 'next', 'prev', 'exit' и выбор сортировки.
    @modifies: None
    @effects: Читает данные из БД и постранично выводит список рынков в консоль.
    @raises: KeyError (если введен номер сортировки, которого нет в SORT_MAPPING), ValueError (при вводе не-цифр в выбор направления).
    @returns: None.'''
    page_size = 10
    current_page = 0
    total_rows = fm_model.get_total_count_db()
    # вычисляем количество страниц (общее количество строк в БД делим на размер страницы)
    total_pages = math.ceil(fm_model.get_total_count_db() / page_size)
    command = ''
    sort_list()
    while command != 'exit':
        offset = current_page * page_size
        rows = fm_model.markets_list_db(page_size, offset,sort_by=SORT,order=ORDER)
        for row in rows:
            view.print_market_list(row)
        view.print_cur_page(current_page + 1,total_rows)
        view.print_page()
        command = input().lower()
        if command == 'next' and current_page < total_pages - 1:
            current_page += 1
        elif command == 'prev' and current_page > 0:
            current_page -= 1
        elif command == 'exit':
            break
        else:
            view.print_invalid_command()

def market_info():
    '''@requires: market_name
    @modifies: None
    @effects: карточка выбранного рынка или сообщение, что рынок не найден
    @raises: psycopg2.Error.
    @returns: None
    '''
    command = ''
    while command != 'exit':
        try:
            view.print_market_name()
            market_name = input().lower()
            info = fm_model.market_info_db(market_name)
            if info:
                view.print_market_info(info)
            else:
                view.print_market_incorrect()
                view.print_market_name()
        except Exception as e:
            view.print_not_found()
            break
        view.print_continue()
        command = input().lower()

def market_find():
    '''@requires: city И/ИЛИ state И/ИЛИ zip_code, параметры сортировки (SORT_MAPPING, ASC/DESC)
    @modifies: None
    @effects: вывод списка найденных рынков, соответствующих фильтрам.
    @raises: None
    @returns: None
    '''
    sort_list()
    view.print_market_loc()
    command = ''
    while command != 'exit':
        city = input("City: ").strip() or None
        state = input("State: ").strip() or None
        zip_code = input("Zip_code: ").strip() or None
        results = fm_model.market_find_db(city=city, state=state, zip_code=zip_code,sort_by=SORT,order=ORDER)
        if not results:
            view.print_not_found()
        else:
            view.print_find_results_count(results)
            for row in results:
                view.print_market_find(row)
        view.print_continue()
        command = input().lower()

def market_review(user_id):
    '''@requires: market_name, rate (int), review
    @modifies: таблица reviews в БД (добавление новой записи)
    @effects: None
    @raises: TypeError
    @returns: None.'''
    command = ''
    while command != 'exit':
        view.print_market_review()
        market_name = input()
        if fm_model.get_fmid_db(market_name):
            view.print_market_rate()
            rate_input = input()
            rate = int(rate_input) if rate_input.isdigit() else 5
            view.print_market_review()
            review = input()
            market_fmid = fm_model.get_fmid_db(market_name)
            fm_model.market_review_db(market_fmid,rate,review,user_id)
        else:
            view.print_not_found()
        view.print_continue()
        command = input().lower()

def market_delete(user_id):
    '''
    @requires: ID авторизованного пользователя и ID записи для удаления
    @modifies: Таблицы reviews или markets (удаляет строки)
    @effects: Проверяет роль и удаляет данные, если прав достаточно
    @raises: ValueError при неверном вводе ID
    @returns: None
    '''
    role = fm_model.get_user_role_db(user_id)
    if role == 'app_user':
        view.print_del_review()
        fmid = input()
        try:
            fm_model.delete_review_db(user_id,fmid)
            view.print_successful()
        except ValueError:
            view.print_failed()
    elif role == 'admin':
        view.print_del_fm()
        try:
            fmid = int(input())
            fm_model.delete_market_db(fmid)
            view.print_successful()
        except ValueError:
            view.print_failed()
    else:
        view.print_no_perm()

