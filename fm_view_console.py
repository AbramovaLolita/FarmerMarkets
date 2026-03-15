'''Команды register,login'''

def print_auth():
    print('Sign up or sign in to write a review')

def print_auth_error():
    print("Authentication error. Login or password are incorrect. Enter 'continue' or 'exit' => ", end='')

def print_auth_success():
    print('Authentication is successful.')

def print_request_login():
    print('Enter your username => ', end='')

def print_request_password():
    print('Enter your password => ', end='')

def print_request_email():
    print('Enter your email (optional) => ', end='')

def print_empty():
    print('Username and password can not be empty')

'''Команда list'''
def print_page():
    print("Command ('prev','next','exit') => ", end='')

def print_cur_page(cur_page,total_pages):
    print(f"Page {cur_page} of {total_pages}")

def print_market_list(market_row):
    print(f'{market_row[0]}. Rating: {market_row[1]:.2f}, Reviews: {market_row[2]}.')

def print_ask_location():
    print("Enter your latitude and longitude (format: 44.411036 -72.140337)  => ", end='')

def print_ask_distance():
    print("Enter radius (km) => ", end='')



'''Команда info'''
def print_market_name():
    print("Enter market name => ", end='')

def print_market_info(info):
    # кортеж с атрибутами из БД
    (name, street, lat, long, city, county, state,
    web, fb, tw, other_med, num, date, time, rating, review_count) = info["main_info"]
    products = ', '.join(info['products'])
    payment = ', '.join(info['payments'])
    print(f"      {name}     ")
    # сборка адреса
    loc_parts = [street, city, state]
    address = ", ".join([p for p in loc_parts if p])
    print(f'Address: {address or "N/A"}')
    print(f'Coordinates: {lat or "—"}, {long or "—"}')
    print(f'Payment methods: {payment or "—"}')
    print(f'Products: {products}')

    # сборка веб-ресурсов
    media_parts = [web, fb, tw, other_med]
    web = ", ".join([p for p in media_parts if p])
    print(f'Web-resources:  {web or  "N/A"}')

    print(f'Dates: {date or "N/A"}. Times: {time or "N/A"}')
    rating_txt = f"{rating:.1f}" if rating else "0.0"
    print(f"Rating: {rating_txt} (Reviews: {review_count})")

def print_market_incorrect():
    print('Market name is incorrect or market does not exists')

'''Команда find'''
def print_market_loc():
    print('Enter city, state or zip. Press "Enter" to skip.')

def print_not_found():
    print('No results found')

def print_find_results_count(result):
    print(f'{len(result)} markets found')

def print_market_find(row):
    (name, street, city, state, zip_code,rating) = row
    rating_txt = f"{rating:.1f}" if rating else "0.0"
    loc_parts = [street, city, state, zip_code]
    address =  ", ".join([p for p in loc_parts if p])
    print(f'{name} on {address}. Rating {rating_txt}')

'''Команда review'''
def print_market_review():
    print('Enter the market for rating and feedback => ', end='')

def print_market_rate():
    print('Rate the market from 1 to 5 => ', end='' )

def print_market_comment():
    print('Leave a review (optional) => ', end='' )

'''Команда delete'''
def print_del_review():
    print('Enter farmer market ID to delete your review => ' , end='')

def print_del_fm():
    print('Enter farmer market ID to delete => ', end='')

def print_no_perm():
    print('You do not have permission for this operation')

'''Универсальные'''
def print_successful():
    print('Successful!')

def print_failed():
    print('Failed!')

def print_prompt():
    print("Command ('register','login,'list','info','find','review','delete','logout','exit') => ", end='')

def print_command(command):
    print(command)

def print_invalid_command():
    print('Invalid command, ignoring')

def print_newline():
    print()

def print_exit():
    print("Done")

def print_continue():
    print("Command ('exit','continue') => ", end='')

def print_order_by():
    print('Sort by: 1 - market, 2 - city, 3 - state, 4 - rating, 5 - dist => ', end='')

def print_asc_desc():
    print('Sort by: 1 - Ascending, 2 - Descending => ', end='')
