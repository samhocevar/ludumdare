#!/bin/sh

sed '/-- xxx: begin remove/,/-- xxx: end remove/d' \
  | sed '6,${s/ *--.*//}' \
  | sed 's/  *\([^_a-zA-Z0-9]\|$\)/\1/g' \
  | sed 's/\(^\|[^a-zA-Z0-9]\)  */\1/g' \
  | grep .

