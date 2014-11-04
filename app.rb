require 'hipchat'
require 'sinatra'
require 'thin'
require 'uri'

post '/' do
  hc = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], api_version: 'v2')

  hc['Dev Relations'].send('Stacky', "New Stack Overflow question <a href='#{URI.extract(params['text'])[7]}'>#{URI.extract(params['text'])[7]}</a>")
  200
end
