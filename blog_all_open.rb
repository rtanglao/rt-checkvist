#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'amazing_print'
require 'time'
require 'date'
require 'logger'
require 'pry'
require 'typhoeus'
require 'json'
require 'uri'

logger = Logger.new($stderr)
logger.level = Logger::DEBUG

def get_checkvist_response(url, params, logger)
  logger.debug url
  logger.debug params
  try_count = 0
  begin
    result = Typhoeus::Request.get(
      url,
      params: params
    )
    x = JSON.parse(result.body)
  rescue JSON::ParserError
    try_count += 1
    if try_count < 4
      $stderr.printf("JSON::ParserError exception, retry:%d\n",\
                     try_count)
      sleep(10)
      retry
    else
      $stderr.printf("JSON::ParserError exception, retrying FAILED\n")
      x = nil
    end
  end
  x
end

all_tasks = get_checkvist_response('https://checkvist.com/checklists/742486/tasks.json', '', logger)
all_tasks.each do |t|
  next if t['status'] == 1

  puts "Blog the following?:"
  puts '------'
  puts "#{t['content']}"
  puts '------'
  yes_no = gets.chomp
  next if yes_no.downcase == 'n'

  puts "let's do this"
  system_str = "./blogthis.rb https://checkvist.com/checklists/742486/tasks/#{t['id']}"
  system(system_str)
end
