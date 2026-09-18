#!/bin/bash

# Проверяем, запущен ли cmus
if ! pgrep -x cmus > /dev/null; then
    echo "󰎆 Off"
    exit 0
fi

# Получаем статус плеера
STATUS=$(cmus-remote -Q 2>/dev/null | grep status | cut -d ' ' -f 2)

# Если плеер остановлен или на паузе
if [ "$STATUS" = "stopped" ] || [ "$STATUS" = "paused" ]; then
    echo "󰏤 Paused"
    exit 0
fi

# Получаем информацию о треке
ARTIST=$(cmus-remote -Q 2>/dev/null | grep 'tag artist' | cut -d ' ' -f 3-)
TITLE=$(cmus-remote -Q 2>/dev/null | grep 'tag title' | cut -d ' ' -f 3-)

# Если теги не найдены, берем имя файла
if [ -z "$ARTIST" ] && [ -z "$TITLE" ]; then
    FILE=$(cmus-remote -Q 2>/dev/null | grep 'file' | head -1 | rev | cut -d '/' -f 1 | rev)
    echo "󰎆 $FILE"
    exit 0
fi

# Выводим название
if [ -n "$ARTIST" ] && [ -n "$TITLE" ]; then
    echo "󰎆 $ARTIST - $TITLE"
elif [ -n "$ARTIST" ]; then
    echo "󰎆 $ARTIST"
elif [ -n "$TITLE" ]; then
    echo "󰎆 $TITLE"
else
    echo "󰎆 Playing"
fi
