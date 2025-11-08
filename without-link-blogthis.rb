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
require 'tzinfo'
require 'pragmatic_tokenizer'
require 'babosa'

logger = Logger.new($stderr)
logger.level = Logger::DEBUG

if ARGV.empty?
  puts "usage: #{$PROGRAM_NAME} checkvist_url_to_blog_using_lc_or_tc_checkvist_command"
  exit
end

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

URL = ARGV[0].freeze
# from https://checkvist.com/auth/api
# e.g. https://checkvist.com/checklists/742486/tasks/67162153
# get /checklists/checklist_id/tasks/task_id.(json|xml)
# GET https://checkvist.com/checklists/742486/tasks/67162153.json
task_api_url = "#{URL}.json"
json = get_checkvist_response(task_api_url, '', logger)
logger.debug "json: #{json.ai}"
content = json[0]['content']
created_at = json[0]['created_at']
# Read UTC date and time from checkvist API instead of Pacific from the checkvist outline
#
# "Dec 4, 2024 07:19 [Greg Wilson:: The Third Bit: Afraid of Change](https://third-bit.com/2018/11/24/afraid-of-change/) <-- **QUOTE**: `I think
# thought leaders in Silicon Valley started recommending it to each other for two reasons. First, it allows them to blame subordinates for not
# speaking out (again, ignoring the experience some of those subordinates may have had of bosses who say “I want to hear what you think” but really
# don’t). Second, it satisfies tech bros’ need to talk about something other than sexual harassment, racial discrimination, and pay inequity—in
# other words, their need to talk about things that sound important but won’t make them uncomfortable or undermine the system that they hope will
# make them rich.`",
# filename 2024-12-04-p0719-afraid-of-change.md
# Assume format of date and then markdown link i.e. mmm n, YYYY hh:mm [link text](https://link) rest of text
# split_at_markdown_leftsquarebracket = content.split('[', 2)
# date_str = split_at_markdown_leftsquarebracket[0]
# Hardcode since 99% of the time I will be in Vancouver, change to another timezone if the list item was added in a different timezone
# ENV['TZ'] = 'America/Vancouver'
# t = Time.parse(date_str)
# filename = t.strftime('%Y-%m-%d-p%H%M')
logger.debug "content #{content.ai}"

t = Time.parse(created_at)
logger.debug("created_at: #{t.ai}")
time_discovered_slug = t.getlocal.strftime('%Y-%m-%d-p%H%M')
content_array = content.split("\r\n\r\n")
title = content_array[0]
rest_of_content = content_array[1..].join("\n")
logger.debug "title: #{title.ai}"
logger.debug "rest of content: #{rest_of_content.ai}"
tokenizer = PragmaticTokenizer::Tokenizer.new(
  language: :en, remove_stop_words: true, punctuation: :none, clean: true, classic_filter: true, minimum_length: 4
)
tokens = tokenizer.tokenize(title).uniq
slug = tokens.join ' '
slug = slug.to_slug.normalize.to_s
logger.debug "slug without timestamp: #{slug}"
slug = "#{time_discovered_slug}-#{slug}"
slug.downcase!
logger.debug("slug:#{slug}")
filename = "#{time_discovered_slug}-#{slug}.md"
logger.debug "filename: #{filename}"
filestr = "---\n"
filestr += "layout: post\n"
filestr += "title: \"#{title}\"\n"
filestr += "---\n"
filestr += "#{rest_of_content.gsub('|', '¦')}\n"
File.write(filename, filestr)
