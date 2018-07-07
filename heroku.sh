#!/usr/bin/env bash

set -Eeuo pipefail

query="$1"
cache_file=".appscache"

update_apps_list() {
  /usr/local/bin/heroku apps --all | \
    grep -v '===' | \
    awk '{print $1}' | \
    awk NF > $cache_file
}

if [[ $query == "--refresh" ]]; then
  update_apps_list
else
  [ ! -e $cache_file ] && update_apps_list

  items=""
  for app in $(cat $cache_file | grep -i "$query"); do
    item="{\"uid\":\""$app"\", \"title\":\""$app"\", \"arg\":\""$app"\", \"valid\": true}"
    if [[ $items == "" ]]; then
      items="$item"
    else
      items="$items,$item"
    fi
  done

  echo -e "{ \"items\": [$items]}"
fi
