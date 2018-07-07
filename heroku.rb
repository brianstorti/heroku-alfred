#!/usr/bin/env ruby

require 'json'

CACHE_FILE = '.appscache'

def update_apps_list
  app_names = `/usr/local/bin/heroku apps --all | grep -v '===' | awk '{print $1}' | awk NF`
  File.open(CACHE_FILE, 'w') { |f| f.write(app_names) }
  apps_list_cached
end

def apps_list_cached
  File.read(CACHE_FILE).split("\n") if File.exist?(CACHE_FILE)
end

def apps_list
  apps = apps_list_cached
  return apps if apps && !apps.empty?

  update_apps_list
end

if ARGV.first == "--refresh"
  update_apps_list
else
  apps = apps_list.map do |app|
    {
      "uid": app,
      "title": app,
      "subtitle": "open app in your browser",
      "arg": app,
      "valid": true
    }
  end

  print({ items: apps }.to_json)
end
