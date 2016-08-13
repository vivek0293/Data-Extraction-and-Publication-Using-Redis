require "redis"
require "open-uri"

begin
    redis = Redis.new(:url => "redis://h:pbnn2v7e09sgt05d7qbaed9sp39@ec2-54-163-236-211.compute-1.amazonaws.com:11909")
    puts "Connected"
    
    open('1470844744092.zip', 'wb') do |fo|
        fo.print open('http://bitly.com/nuvi-plz/1470844744092.zip').read
    end

end