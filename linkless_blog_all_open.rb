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
require 'parseconfig'

logger = Logger.new($stderr)
logger.level = Logger::DEBUG

# credentials="somebody@example.com:Open API key e.g. kdkdkdk3%" <- api key from https://checkvist.com/auth/profile#status
# encoded_credentials = Base64.strict_encode64(credentials)
# authorization_header = "Basic #{encoded_credentials}"
checkvist_config = ParseConfig.new('checkvist.conf').params
basic_auth  = checkvist_config['basic_auth']
def get_checkvist_response(url, params, basic_auth, logger)
  logger.debug url
  logger.debug params
  try_count = 0
  begin
    request = Typhoeus::Request.new(
      url,
      method: :get,
      headers: {
        'Authorization' => basic_auth
      }
    )

    # Run the request
    result = request.run

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

all_tasks = get_checkvist_response('https://checkvist.com/checklists/936619/tasks.json', '', basic_auth, logger)
logger.debug "all_tasks: #{all_tasks.ai}"
all_tasks.each do |t|
  logger.debug "t: #{t.ai}"
  next if t['status'] == 1

  puts 'LINKLESS: Blog the following?:'
  puts '------'
  puts "#{t['content']}"
  puts '------'
  yes_no = gets.chomp
  next if yes_no.downcase == 'n'

  puts "let's do this"
  system_str = "./without-link-blogthis.rb https://checkvist.com/checklists/936619/tasks/#{t['id']}"
  system(system_str)
end
