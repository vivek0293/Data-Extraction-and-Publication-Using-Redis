require "redis"
require "open-uri"
require "json"
require "nokogiri"
require "zip"
begin
    redis = Redis.new(:url => "redis://h:pbnn2v7e09sgt05d7qbaed9sp39@ec2-54-163-236-211.compute-1.amazonaws.com:11909")
    puts "Connected"
    

    a = []
    page = Nokogiri::HTML(open("http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/"))
    links = page.css("a")
    links.each do |item|
        a.push(item.text)
    end
    #To find the number of zip files
    length = a.length
    
    redis.flushall

    i = 5

    puts "Enter Choice as '1' for running testCase; '2' for running the entire data:"
    choice = gets.chomp.to_i

    if choice == '1'
        while i<=8 do
            open(a[i], 'wb') do |file|
                file.write open('http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/'+a[i]).read
                Zip::File.open(a[i]) do |zipfile|
                    zipfile.each do |file|
                        xml = zipfile.read(file)
                        doc = Nokogiri::XML(xml)
                        title = doc.at_xpath('//discussion_title').text
                        text = doc.at_xpath('//topic_text').text
                        redis.set(title,text)
                    end
                end
            end
            i=i+1
        end
    if choice == '2'
        while i<=length do
            open(a[i], 'wb') do |file|
                file.write open('http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/'+a[i]).read
                Zip::File.open(a[i]) do |zipfile|
                    zipfile.each do |file|
                        xml = zipfile.read(file)
                        doc = Nokogiri::XML(xml)
                        title = doc.at_xpath('//discussion_title').text
                        text = doc.at_xpath('//topic_text').text
                        redis.set(title,text)
                    end
                end
            end
            i=i+1
        end
    else
        puts"invalid choice"
    end
  end
end