import fm_model
import math
import fm_view_console as view


def sort_list():
    sort_mapping = {
        "1": "name",
        "2": "city",
        "3": "state",
        "4": "rating",
        "5": "distance"

    }
    view.print_order_by()
    choice = input()
    sort = sort_mapping.get(choice, sort_mapping['1'])
    view.print_asc_desc()
    direction_choice = input()
    direction = int(direction_choice) if direction_choice.isdigit() else 1
    order = "ASC" if direction == 1 else "DESC"
    return sort, order

def market_nearby():
    view.print_ask_location()
    # координаты пользователя
    coordinates = input().split()
    view.print_ask_distance()
    # максимальная удаленность рынка в км
    coordinates.append(input())
    return coordinates

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
    page_size = 10
    current_page = 0
    total_rows = fm_model.get_total_count_db()
    total_pages = math.ceil(total_rows / page_size)
    sort, order = sort_list()

    command = ''
    while command != 'exit':
        offset = current_page * page_size
        rows = fm_model.markets_list_db(page_size, offset, sort_by=sort, order=order)
        for row in rows:
            view.print_market_list(row)

        view.print_cur_page(current_page + 1, total_pages)
        view.print_page()
        command = input().lower()
        if command == 'next' and current_page < total_pages - 1:
            current_page += 1
        elif command == 'prev' and current_page > 0:
            current_page -= 1
        elif command == 'exit':
            break
        elif command not in ['next', 'prev']:
            view.print_invalid_command()

def market_info():
    '''@requires: market_name
    @modifies: None
    @effects: карточка выбранного рынка или сообщение, что рынок не найден
    @raises: Exception - psycopg2.Error.
    @returns: None
    '''
    command = ''
    while command != 'exit':
        try:
            view.print_market_name()
            market_name = input().lower()
            if market_name:
                info = fm_model.market_info_db(market_name)
                if info:
                    view.print_market_info(info)
            else:
                view.print_market_incorrect()
            view.print_continue()
            command = input().lower()
        except Exception as e:
            view.print_not_found()

def market_search():
    '''@requires: параметры сортировки (sort_mapping, asc/desc). Если сортировка distance, то lat,long,max_dist,
    иначе city И/ИЛИ state И/ИЛИ zip_code
    @modifies: None
    @effects: вывод списка найденных рынков, соответствующих фильтрам.
    @raises: None
    @returns: None
    '''
    sort, order = sort_list()
    user_lat = user_long = max_dist = city = state = zip_code = None
    command = ''
    while command != 'exit':
        if sort == 'distance':
            nearby = market_nearby()
            if len(nearby) == 3:
                try:
                    user_lat = float(nearby[0])
                    user_long = float(nearby[1])
                    max_dist = float(nearby[2])
                except ValueError:
                    view.print_invalid_command()
        else:
            view.print_market_loc()
            city = input("City: ").strip()
            state = input("State: ").strip()
            zip_code = input("Zip_code: ").strip()
        results = fm_model.market_search_db(city=city, state=state, zip_code=zip_code,sort_by=sort,order=order,user_lat=user_lat,user_long=user_long,max_dist=max_dist)
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


