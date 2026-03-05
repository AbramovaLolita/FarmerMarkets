import bcrypt
import psycopg2
import os
from dotenv import load_dotenv


load_dotenv()

def get_connection():

    return psycopg2.connect(
        dbname=os.getenv("DB_NAME"),
        host=os.getenv("DB_HOST"),
        user=db_user,
        password=os.getenv("DB_PASS"),
        port=os.getenv("DB_PORT")
    )


def get_connection():
    return psycopg2.connect(
        dbname=os.getenv("DB_NAME"),
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS"),
        port=os.getenv("DB_PORT")
    )

def register_user_db(username, password, email=None):
    conn = get_connection()
    cur = conn.cursor()
    salt = bcrypt.gensalt()
    pw = bcrypt.hashpw(password.encode('utf-8'), salt)
    try:
        query = "INSERT INTO users (username, password, email) VALUES (%s, %s, %s)"
        cur.execute(query, (username, pw.decode('utf-8'), email))
        conn.commit()
        return True
    except psycopg2.errors.UniqueViolation:
        return False
    finally:
        cur.close()
        conn.close()

def login_user_db(username, password):
    conn = get_connection()
    cur = conn.cursor()

    query = "SELECT id, password FROM users WHERE username = %s"
    cur.execute(query, (username,))
    user_data = cur.fetchone()
    cur.close()
    conn.close()
    if user_data:
        user_id, hashed_pw = user_data
        if bcrypt.checkpw(password.encode('utf-8'), hashed_pw.encode('utf-8')):
            return user_id
    return None


def get_total_count_db():
    conn = get_connection()
    cur = conn.cursor()
    query = 'SELECT count(*) FROM markets'
    cur.execute(query)
    total_rows = cur.fetchone()[0]
    cur.close()
    conn.close()
    return total_rows

def get_fmid_db(market_name):
    conn = get_connection()
    cur = conn.cursor()
    query = 'SELECT fmid FROM markets WHERE name ILIKE %s'
    cur.execute(query, (f'%{market_name}%',))
    fmid = cur.fetchone()
    cur.close()
    conn.close()
    return fmid[0] if fmid else None

def markets_list_db(limit,offset,sort_by='name',order='None'):
    conn = get_connection()
    cur = conn.cursor()
    query = '''select m.name, 
    COALESCE(AVG(r.rating),0) as avg_rating, 
    COUNT(r.review_id) as review_count  
    FROM markets m 
    LEFT JOIN reviews r on m.fmid=r.fmid 
    LEFT JOIN locations l ON m.zip=l.zip
    GROUP BY m.name,  l.city, l.state
    '''

    query += market_filter(sort_by, order)
    query += ' LIMIT %s OFFSET %s'
    cur.execute(query, (limit, offset))
    data = cur.fetchall()
    cur.close()
    conn.close()
    return data

def market_info_db(market_name):
    conn = get_connection()
    cur = conn.cursor()

    query = '''SELECT m.fmid, m.name, m.street, m.lat, m.long,
                           l.city, l.county, l.state, 
                           med.website, med.facebook, med.twitter, med.other_media,
                           s.season_number, s.season_date, s.season_time
                    FROM markets m 
                    LEFT JOIN locations l on m.zip = l.zip
                    LEFT JOIN market_media med on m.fmid = med.fmid
                    LEFT JOIN market_schedules s on m.fmid = s.fmid
                    WHERE m.name ILIKE %s'''

    cur.execute(query, (f'%{market_name}%',))
    info_data = cur.fetchone()
    if not info_data:
        return None

    fmid = info_data[0]
    group_query = '''
        SELECT COALESCE(AVG(rating), 0), COUNT(review_id)
        FROM reviews
        WHERE fmid = %s
    '''
    cur.execute(group_query, (fmid,))
    info_group = cur.fetchone()
    cur.close()
    conn.close()
    return info_data[1:] + info_group

def market_find_db(city=None,state=None,zip_code=None,sort_by='name',order='None'):
    conn = get_connection()
    cur = conn.cursor()

    query = ('''SELECT  m.name, m.street, l.city, l.state, l.zip, COALESCE(AVG(r.rating),0) as avg_rating FROM markets m 
             JOIN locations l ON m.zip = l.zip 
             LEFT JOIN reviews r ON m.fmid = r.fmid
             WHERE 1=1 ''')
    geo_parts = []
    if city:
        query += " AND l.city ILIKE %s"
        geo_parts.append(f"%{city}%")
    if state:
        query += " AND l.state ILIKE %s"
        geo_parts.append(f"%{state}%")
    if zip_code:
        query += " AND l.zip = %s"
        geo_parts.append(zip_code)
    query += " GROUP BY m.name, m.street, l.city, l.state, l.zip"
    query += market_filter(sort_by, order)

    cur.execute(query, tuple(geo_parts))
    data = cur.fetchall()
    cur.close()
    conn.close()
    return data

def market_review_db(fmid, rating, comment,user_id):
    conn = get_connection()
    cur = conn.cursor()
    query = ('''INSERT  INTO  reviews (fmid, rating, comment,user_id) 
                VALUES (%s, %s, %s,%s)''')
    cur.execute(query, (fmid, rating, comment,user_id))
    conn.commit()
    cur.close()
    conn.close()

def market_filter(sort_by, order):
    sort_columns = {
        'name': 'm.name',
        'city': 'l.city',
        'state': 'l.state',
        'rating': 'avg_rating',
        }
    column = sort_columns.get(sort_by, 'm.name')
    direction = 'DESC' if order.upper() == 'DESC' else 'ASC'
    return f' ORDER BY {column} {direction}'

def get_user_role_db(user_id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT rol FROM users WHERE id = %s", (user_id,))
    role = cur.fetchone()
    return role[0] if role else None

def delete_review_db(user_id,fmid):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM reviews WHERE user_id = %s and fmid = %s", (user_id,fmid))
    conn.commit()
    cur.close()
    conn.close()

def delete_market_db(fmid):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM markets WHERE fmid = %s", (fmid,))
    conn.commit()
    cur.close()
    conn.close()


def unit_tests():
    # тест register_user_db()
    if register_user_db('test_user', 'pw123'):
        print("register_user_db() is successful")
    else:
        print("register_user_db() is failed")
    # тест login_user_db() с правильным паролем
    sign_in = login_user_db('test_user', 'pw123')
    if sign_in is not None:
        print("login_user_db() (correct pw) is done")
    else:
        print("login_user_db() (correct pw) is failed")
    # тест login_user_db() с неправильным паролем
    wrong_pw = login_user_db('tester', 'wrong_pass')
    if wrong_pw is None:
        print("login_user_db() (incorrect pw) is done")
    else:
        print("login_user_db() (incorrect pw) is failed!)")
    # тест get_fmid_db()
    fmid = get_fmid_db('Edenton Farmers Market')
    if fmid is not None:
        print(f"get_fmid_db() is done. FMID: {fmid}")
    else:
        print("get_fmid_db() is failed")
    # удаляем test_user
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM users WHERE username = %s", ('test_user',))
    conn.commit()
    cur.close()
    conn.close()

if __name__ == "__main__":
    unit_tests()