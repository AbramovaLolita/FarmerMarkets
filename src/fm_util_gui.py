import fm_model
import math


def sort_list(sort_choice, order_choice):
    sort_mapping = {
        "1": "name",
        "2": "city",
        "3": "state",
        "4": "rating",
        "5": "distance"

    }
    sort = sort_mapping.get(sort_choice, sort_mapping['1'])
    direction = int(order_choice) if order_choice.isdigit() else 1
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

def market_register(login, password, email):
    '''@requires: username, password, email
    @modifies: таблица users в базе данных (добавляет новую строку).
    @effects: None
    @raises: None
    @returns: результат регистрации
    '''
    if not login or not password:
        view.print_empty()
        return None
    sign_up = fm_model.register_user_db(login, password, email)
    return bool(sign_up)

def market_login(login, password):
    '''@requires: username, password
    @modifies: None
    @effects: None
    @raises: psycopg2.Error.
    @returns: результат аутентификации (True/False)'''
    user_id = fm_model.login_user_db(login, password)
    return user_id

def markets_list(page,sort_choice, order_choice):
    page_size = 10
    current_page = page
    total_rows = fm_model.get_total_count_db()
    total_pages = math.ceil(total_rows / page_size)
    offset = current_page * page_size

    market_list = fm_model.markets_list_db(page_size, offset, sort_by=sort_choice, order=order_choice)
    return market_list, total_pages

def market_info(market_name):
    '''
    @requires: market_name
    @modifies: None
    @effects: карточка выбранного рынка или сообщение, что рынок не найден
    @raises: Exception - psycopg2.Error.
    @returns: None
    '''
    info = fm_model.market_info_db(market_name)
    return info

def market_search(city=None,state=None,zip_code=None,lat=None,long=None,dist=None,sort=None,order=None):
    '''
    @requires: параметры сортировки (sort_mapping, asc/desc). Если сортировка distance, то lat,long,max_dist,
    иначе city И/ИЛИ state И/ИЛИ zip_code
    @modifies: None
    @effects: вывод списка найденных рынков, соответствующих фильтрам.
    @raises: None
    @returns: None
    '''
    def safe_float(value, default=0.0):
        try:
            return float(value)
        except (ValueError, TypeError):
            return default
    user_lat = safe_float(lat)
    user_long = safe_float(long)
    max_dist = safe_float(dist)
    results = fm_model.market_search_db(city=city, state=state, zip_code=zip_code,
                                        sort_by=sort,order=order,user_long=user_long,
                                        user_lat=user_lat,
                                        max_dist=max_dist)
    return results

def market_review(market_name, rate_input, review, user_id):
    '''
    @requires: market_name, rate (int), review
    @modifies: таблица reviews в БД (добавление новой записи)
    @effects: None
    @raises: None
    @returns: результат записи отзыва (True/False)
    '''
    rate = int(rate_input) if rate_input.isdigit() else 5
    market_fmid = fm_model.get_fmid_db(market_name)
    return True if fm_model.market_review_db(market_fmid,rate,review,user_id) else False

def market_delete(user_id,market_name):
    '''
    @requires: ID авторизованного пользователя и ID записи для удаления
    @modifies: Таблицы reviews или markets (удаляет строки)
    @effects: Проверяет роль и удаляет данные, если прав достаточно
    @raises: ValueError при неверном вводе ID
    @returns: None
    '''
    role = fm_model.get_user_role_db(user_id)
    market_fmid = fm_model.get_fmid_db(market_name)
    if role == 'admin':
        fm_model.delete_market_db(market_fmid)
        return True
    return False



