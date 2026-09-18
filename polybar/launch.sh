#!/usr/bin/env bash

# Закрываем старые процессы Polybar
killall -q polybar

# Ждем, пока они полностью закроются
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запускаем вашу панель example
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

