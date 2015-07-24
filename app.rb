require 'hipchat'
require 'sinatra'
require 'thin'
require 'uri'

CONFIRMATION = /http:\/\/stackexchange\.com\/filters\/email-confirm\/\w*/
QUESTION = /http:\/\/stackoverflow\.com\/questions\/.*/

post '/' do
  links = URI.extract(params['text'])

  links.each do |link|
    case link
    when CONFIRMATION
      post_message("StackBot confirmation <a href='#{link.scan(CONFIRMATION)[0]}'>link</a>")
    when QUESTION
      post_message("New Stack Overflow question <a href='#{link}'>#{link}</a>")
    end
  end

  200
end

def post_message(message)
  ENV['HIPCHAT_ROOMS'].split(',').each do |r|
    hc[r].send('StackBot', message)
  end
end

def hc
  @hc ||= HipChat::Client.new(ENV['HIPCHAT_TOKEN'], api_version: ENV['HIPCHAT_API_VERSION'])
end
