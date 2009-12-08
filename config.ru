root_dir = File.dirname(__FILE__)
$:.unshift File.join(root_dir, 'lib')
Dir.entries('vendor').reject{|x| x == '.' || x == '..'}.each{|y| $:.unshift File.join(root_dir, 'vendor', y, 'lib') }

require 'rubygems'
require 'sinatra'
require 'sinatra/authorization'
require 'haml'
require 'ruby_mk'

$config = YAML.load_file(File.join(File.dirname(__FILE__), 'config', 'app.yml'))

set :authorization_realm, "ruby.mk admin" 
set :views, File.join(root_dir, 'views')

run Sinatra::Application
