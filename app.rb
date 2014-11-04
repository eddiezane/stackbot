require 'hipchat'
require 'sinatra'
require 'thin'
require 'uri'

post '/' do
  hc = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], api_version: 'v2')
  question = URI.extract(params['text'])[7]
  hc['Dev Relations'].send('Stacky', "New Stack Overflow question <a href='#{question}'>#{question}</a>")
  200
end
