#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'amazing_print'
require 'time'
require 'date'
require 'logger'
require 'pry'
require 'json'

logger = Logger.new($stderr)
logger.level = Logger::DEBUG

if ARGV.empty? || ARGV.length != 2
  puts "usage: #{$PROGRAM_NAME} title slug"
  exit
end

TITLE = ARGV[0].freeze
SLUG = ARGV[1].freeze
logger.debug("TITLE: #{TITLE} SLUG:#{SLUG}")

t = Time.now
logger.debug("created_at: #{t.ai}")
time_created_slug = t.getlocal.strftime('%Y-%m-%d-p%H%M')
filename = "#{time_created_slug}-#{SLUG}.md"
logger.debug "filename: #{filename}"
filestr = "---\n"
filestr += "layout: post\n"
filestr += "title: \"#{TITLE}\"\n"
filestr += "---\n"
filestr += "## Previously\n"
filestr += "* \n"
File.write(filename, filestr)
