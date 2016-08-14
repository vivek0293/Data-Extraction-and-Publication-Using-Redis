require "redis"
require "open-uri"
require "json"
require "nokogiri"
require "zip"
begin
    redis = Redis.new(:url => "redis://h:pbnn2v7e09sgt05d7qbaed9sp39@ec2-54-163-236-211.compute-1.amazonaws.com:11909")
    puts "Connected"
    
#    request_uri = 'http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/'
#    request_query = ''
#    url = "#{request_uri}#{request_query}"
#    buffer = open(url).read
#    result = JSON.parse(buffer)
#    #puts result
#    h = {}
#    doc.xpath('//a[@href]').each do |result|
#        h[result.text.strip] = result['href']
#    end
#    puts h
    a = []
    page = Nokogiri::HTML(open("http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/"))
    links = page.css("a")
    #msg = links.text
    links.each do |item|
        a.push(item.text)
    end
    #link = Nokogiri::HTML(open(links))
    #puts a[0]
    length = a.length
    puts length
    puts a[5]

#page = Nokogiri::HTML(open(""))
##links = page.css("a")[5]
##link = Nokogiri::HTML(open(links))
#puts page
    i =
    open(a[i], 'wb') do |file|
        file.write open('http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/1470885081404.zip').read
        Zip::File.open("1470885081404.zip") do |zipfile|
            zipfile.each do |file|
                xml = zipfile.read(file)
                #redis.hmset("DATA",xml)
                puts"entered"
                #puts xml
                
#                file = file.to_s
#                puts file
#                puts"helo"
#                page = Nokogiri::XML(File.open(file))
#                #page = page.to_s
#                puts page
#                #doc = File.open(fil) { |f| Nokogiri::XML(f) }

            end
        end
    end
end