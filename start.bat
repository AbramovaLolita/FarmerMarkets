@echo off
echo 1. Собираем и запускаем контейнеры...
docker-compose up -d --build

echo 2. Ждем запуска системы (около 15 секунд)...
timeout /t 15

echo 3. Запускаем приложение внутри контейнера...
docker-compose exec -d app python3 /app/src/main.py

echo 4. Открываем рабочий стол в браузере...
start https://localhost:6901

echo ======================================================
echo ГОТОВО! 
echo Логин: kasm_user
echo Пароль: (Ваш пароль из .env)
echo ======================================================
pause
