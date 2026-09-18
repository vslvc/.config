#!/bin/sh

# Цвета в формате #RRGGBBAA (AA — прозрачность: 00 прозрачный, FF непрозрачный)
BLANK='#00000000'      # полностью прозрачный
CLEAR='#ffffff22'      # полупрозрачный белый (для "внутренностей" индикатора)
DEFAULT='#00897bE6'    # основной цвет (бирюзовый)
TEXT='#eeffffEE'       # цвет текста (часы, дата)
WRONG='#880000bb'      # красный при неверном пароле
VERIFYING='#00564dE6'  # цвет во время проверки пароля

i3lock \
  --insidever-color=$CLEAR     \
  --ringver-color=$VERIFYING   \
  --insidewrong-color=$CLEAR   \
  --ringwrong-color=$WRONG     \
  --inside-color=$BLANK        \
  --ring-color=$DEFAULT        \
  --line-color=$BLANK          \
  --separator-color=$DEFAULT   \
  --verif-color=$TEXT          \
  --wrong-color=$TEXT          \
  --time-color=$TEXT           \
  --date-color=$TEXT           \
  --layout-color=$TEXT         \
  --keyhl-color=$WRONG         \
  --bshl-color=$WRONG          \
  --blur 8                     \
  --clock                      \
  --indicator                  \
  --time-str="%H:%M"           \
  --date-str="%A, %d %B"       \
  --nofork
