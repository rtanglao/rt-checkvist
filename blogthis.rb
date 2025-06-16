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
# Hardcode since 99% of the time I will be in Vancouver, change to another timezone if the list item was added in a different timezone

logger.debug("created_at: #{t.ai}")
t =  TZInfo::Timezone.get('America/Vancouver').utc_to_local(DateTime.parse(created_at))
time_discovered_slug = t.strftime('%Y-%m-%d-p%H%M')
discovered = t.strftime('%b %-d, %Y %H:%M')
title = content.split('[')[1].split(']')[0]
content_starting_with_link_url = content.delete_prefix("[#{title}](")
link_url = content_starting_with_link_url.split(')')[0]
title = title.gsub('|', '¦')
title = title.gsub('"', "'")
parsed_uri = URI.parse(link_url)
logger.debug "parsed_uri.path: #{parsed_uri.path}"
if parsed_uri.path == '/'
  slug = parsed_uri.host.gsub('.', '-')
else
  slug = parsed_uri.path.split('/').last
  slug = slug.sub(/.*\K\.\D+$/, '') # https://stackoverflow.com/a/59597812
end
slug.downcase!
logger.debug("slug:#{slug}")
filename = "#{time_discovered_slug}-#{slug}.md"
logger.debug "filename: #{filename}"
filestr = "---\n"
filestr += "layout: post\n"
filestr += "title: \"#{title}\"\n"
filestr += "---\n"
filestr += "[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): #{discovered} "
filestr += "#{content.gsub('|', '¦')}\n"
File.write(filename, filestr)
