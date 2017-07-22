require 'nokogiri'
require 'open-uri'
require 'set'
require 'byebug'

def find_links(start_link)
  response = Nokogiri::HTML(open(start_link))
  count = 0
  response.css('a').each do |link|
    sub_response = nil
    begin
      sub_response = Nokogiri::HTML(open(link['href']))
    rescue
    end
    if sub_response
      puts link['href']
    end
    count += 1
    puts count if count % 1000 === 0
  end
end

def web_crawler(start_link)
  stack = [start_link]
  seen_links = Set.new

  while !stack.empty?
    current_link = stack.pop
    if stack.length % 1000 == 0
      puts stack.length
    end
    seen_links << current_link
    response = nil
    begin
      response = Nokogiri::HTML(open(current_link))
    rescue
    end
    if response
      response.css('a').each do |link|
        stack << link['href'] if !seen_links.include?(link['href'])
      end
      if response.css('a').empty?
        puts current_link
      end
    end
  end
end
