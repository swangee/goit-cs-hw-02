#!/usr/bin/env bash

sites=("https://github.com" "https://www.pravda.com.ua/" "https://goit.global/ua/")

logfile="checker.log"

for url in "${sites[@]}"; do
  status=("$(curl -I -s "$url" | head -n 1 | awk  '{print $2}')")

  status_text="DOWN"

  if [ $status == "200" ]; then
    status_text="UP"
  fi

  echo "$url is $status_text" >> "$logfile"
done
