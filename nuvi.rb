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
redis.flushall
#redis.get("Germany agonises over role of army at home after attacks")
    i = 5
    while i<=10 do
        open(a[i], 'wb') do |file|
            file.write open('http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/'+a[i]).read
            Zip::File.open(a[i]) do |zipfile|
                zipfile.each do |file|
                    xml = zipfile.read(file)
                    doc = Nokogiri::XML(xml)
                    title = doc.at_xpath('//discussion_title').text
                    text = doc.at_xpath('//topic_text').text
                    puts title
                    redis.set(title,text)
                    #redis.get("Germany agonises over role of army at home after attacks")
                    puts i
                    puts"entered"
                    #puts xml

                end
            end
        end
        i=i+1
    end
end