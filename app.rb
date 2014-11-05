require 'hipchat'
require 'sinatra'
require 'thin'
require 'uri'

post '/' do
  hc = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], api_version: 'v2')
  links = URI.extract(params['text'])

  question = nil
  links.each do |l|
    next unless l =~ /http:\/\/stackoverflow\.com\/questions\/.*/
    question = l
    break
  end

  unless question.nil?
    ENV['HIPCHAT_ROOMS'].split(',').each do |r|
      hc[r].send('Stacky', "New Stack Overflow question <a href='#{question}'>#{question}</a>")
    end
  end

  200
end
