
import fm_view_console as view
import fm_util as util

user_id = None
command = ''
while command != 'exit':
    view.print_prompt()
    command = input()
    command = command.strip().lower()
    if command == 'register':
        util.market_register()
    elif command == 'login':
        user_id = util.market_login()
    elif command == 'list':
        util.markets_list()
    elif command == 'info':
        util.market_info()
    elif command == 'find':
        util.market_search()
    elif command == 'logout':
        user_id = None
    elif command == 'review':
        if user_id:
            util.market_review(user_id)
        else:
            view.print_auth()
    elif command == 'delete':
        if user_id:
            util.market_delete(user_id)
        else:
            view.print_no_perm()
    elif command != 'exit':
        view.print_invalid_command()
    view.print_newline()
view.print_exit()
