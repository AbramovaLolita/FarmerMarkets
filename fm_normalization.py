import csv

'''формирование списка словарей для файла Export.csv'''
with open('Export.csv', newline='', ) as infile:
    reader_csv = list(csv.DictReader(infile, delimiter=','))

'''нормализация данных для таблицы market_media'''
media_list = []
for row in reader_csv:
    no_empty_line = any([row['Website'], row['Facebook'], row['Twitter'], row['Youtube'], row['OtherMedia']])
    if no_empty_line:
        media_list.append([row['FMID'], row['Website'].strip(), row['Facebook'].strip(),
                            row['Twitter'].strip(), row['Youtube'].strip(), row['OtherMedia'].strip()])

with open('market_media.csv', 'w', newline='', encoding='utf-8') as media:
    writer = csv.writer(media,delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(('market_fmid', 'website', 'facebook', 'twitter', 'youtube', 'other_media'))
    for record in media_list:
        writer.writerow(record)
print(f'{len(media_list)} media found')

'''нормализация данных для таблицы locations'''

locations_dict = {}
for row in reader_csv:
    csv_zip = row['zip'].strip()
    if not csv_zip or csv_zip == '0' or csv_zip.lower() == 'nan':
        continue

    clean_zip = csv_zip.split('.')[0].zfill(5)
    locations_dict[clean_zip] = (
        row['city'].strip(),
        row['County'].strip(),
        row['State'].strip()
    )

print(f'{len(locations_dict)} unique ZIP codes found')

with open('locations.csv', mode='w', newline='', encoding='utf-8') as f_out:
    writer = csv.writer(f_out, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(('zip', 'city', 'county', 'state'))

    for zip_code, location in locations_dict.items():
        writer.writerow((zip_code, *location))

'''нормализация данных для таблицы market'''
markets_list = []
for row in reader_csv:
    csv_zip = row['zip'].strip()
    if csv_zip and csv_zip.lower() != 'nan' and csv_zip != '0':
        clean_zip = csv_zip.split('.')[0].zfill(5)
    else:
        clean_zip = None

    markets_list.append((
        row['FMID'].strip(),
        row['MarketName'].strip(),
        row['street'].strip(),
        row['y'].strip(),  # lat (Широта) — это y
        row['x'].strip(),  # long (Долгота) — это x
        clean_zip,
        row['updateTime'].strip()
    ))

with open('markets.csv', mode='w', newline='', encoding='utf-8') as f_out:
    writer = csv.writer(f_out, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(('fmid', 'name', 'street', 'lat', 'long', 'zip','updatetime'))
    for record in markets_list:
        writer.writerow(record)

print(f'{len(markets_list)} markets found')

'''нормализация данных для таблицы products'''
product_names = [
    'Organic', 'Bakedgoods', 'Cheese', 'Crafts', 'Flowers', 'Eggs', 'Seafood',
    'Herbs', 'Vegetables', 'Honey', 'Jams', 'Maple', 'Meat', 'Nursery', 'Nuts',
    'Plants', 'Poultry', 'Prepared', 'Soap', 'Trees', 'Wine', 'Coffee', 'Beans',
    'Fruits', 'Grains', 'Juices', 'Mushrooms', 'PetFood', 'Tofu', 'WildHarvested'
]

with open('products.csv',  mode='w', newline='', encoding='utf-8') as products:
    writer = csv.writer(products)
    writer.writerow(['product_id', 'product_name'])
    for i, name in enumerate(product_names, 1):
        writer.writerow([i, name])
print(f'{len(product_names)} products')

'''связка таблиц products и markets'''
with open('products.csv', newline='') as products:
    reader = csv.DictReader(products, delimiter=',')
    products_dict = {row['product_name']: row['product_id'] for row in reader}

with open('market_products.csv',  mode='w', newline='') as market_products:
    writer = csv.writer(market_products)
    writer.writerow(['market_id', 'product_id'])
    for row in reader_csv:
        for key, item in products_dict.items():
            if row[key] == 'Y':
                writer.writerow([row['FMID'], products_dict[key]])

'''нормализация данных для таблицы payment methods'''
pay_methods_columns = ['Credit', 'WIC', 'WICcash', 'SFMNP', 'SNAP']

with open('pay_methods.csv', mode='w', newline='') as pay_methods:
    writer = csv.writer(pay_methods)
    writer.writerow(['payment_method_id', 'payment_method'])

    for i, name in enumerate(pay_methods_columns, 1):
        writer.writerow([i, name])
print(f'{len(pay_methods_columns)} payment methods')

'''связка таблиц markets и markets и payment_methods'''
with open('pay_methods.csv', newline='') as pay_methods:
    reader = csv.DictReader(pay_methods, delimiter=',')
    payment_method_dict = {row['payment_method']: row['payment_method_id'] for row in reader}


with open('market_pay.csv',  mode='w', newline='') as market_pay:
    writer = csv.writer(market_pay)
    writer.writerow(['market_id', 'payment_method_id'])
    for row in reader_csv:
        for key, item in payment_method_dict.items():
            if row[key] == 'Y':
                writer.writerow([row['FMID'], payment_method_dict[key]])

'''нормализация данных для таблицы market_schedules'''
schedules_list = []

for row in reader_csv:
        fmid = row['FMID']
        if row['Season1Date'].strip():
            schedules_list.append((1, row['Season1Date'], row['Season1Time'],fmid))
        if row['Season2Date'].strip():
            schedules_list.append((2, row['Season2Date'], row['Season2Time'],fmid))
        if row['Season3Date'].strip():
            schedules_list.append((3, row['Season3Date'], row['Season3Time'],fmid))
        if row['Season4Date'].strip():
            schedules_list.append((4, row['Season4Date'], row['Season4Time'],fmid))

with open('market_schedules.csv', 'w', newline='', encoding='utf-8') as schedules:
    writer = csv.writer(schedules)
    writer.writerow(['season_number', 'season_date', 'season_time','market_fmid'])
    for i,record in enumerate(schedules_list,1):
        writer.writerow((i,*record))
print(f'{len(schedules_list)} schedules found')