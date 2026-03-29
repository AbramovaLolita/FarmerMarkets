FROM kasmweb/core-ubuntu-focal:1.14.0

USER root

# установка пакетов
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    build-essential \
    libpq-dev \
    # Пакеты для исправления ошибки XCB (Qt6/PySide6)
    libxcb-cursor0 \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-xfixes0 \
    libxkbcommon-x11-0 \
    libdbus-1-3 \
    libegl1 \
    libopengl0 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

#  проект
COPY . .
RUN chown -R 1000:1000 /app

# виртуальный экран
ENV DISPLAY=:1
ENV QT_QPA_PLATFORM=xcb
ENV PYTHONPATH="${PYTHONPATH}:/app/src"

# запуск
RUN echo "cd /app && python3 src/main.py &" >> /dockerstartup/vnc_startup.sh
USER 1000
