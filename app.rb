require 'hipchat'
require 'sinatra'
require 'thin'
require 'uri'

post '/' do
  hc = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], api_version: 'v2')
  links = URI.extract(params['text'])

  questions = []
  links.each do |link|
    case link
    when /http:\/\/stackexchange\.com\/filters\/email-confirm\/.*/
      puts "Confirmation: #{link}"
    when /http:\/\/stackoverflow\.com\/questions\/.*/
      questions << link
    end
  end

  questions.each do |question|
    ENV['HIPCHAT_ROOMS'].split(',').each do |r|
      hc[r].send('StackBot', "New Stack Overflow question <a href='#{question}'>#{question}</a>")
    end
  end

  200
end
