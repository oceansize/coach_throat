require 'rubygems'
require File.join(File.dirname(__FILE__), 'server.rb')

run BookmarkMangler

require './app/models/link'

DataMapper.finalize
DataMapper.auto_upgrade!
