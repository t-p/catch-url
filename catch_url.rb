#!/usr/bin/ruby -rubygems

require 'net/http'
require "addressable/uri"

QUEUE_FILE = "/home/tp/.newsbeuter/queue"
WATCH_DIR = "/home/tp/.rtorrent/watch"

File.open(QUEUE_FILE) do |file|
  while line = file.gets
    url, path = line.chomp.split(" ")
    uri = Addressable::URI.parse(url)
    http = Net::HTTP.new(uri.host, 80)
    puts "Fetching: #{uri.host}"
    resp = http.get(uri.path)
    open(WATCH_DIR + "#{uri.path}", "wb") do |to_save|
      to_save.write(resp.body)
    end
    puts "Got #{url}: #{resp.message}"
  end
end
# emptying queue file
File.open(QUEUE_FILE, 'w+')
