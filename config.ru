require 'rubygems'
require 'bundler'

Bundler.require

set :run, false

require 'pjaxhole'
run Sinatra::Application