require "rexml/document"
require "net/http"
require "nokogiri"

xml = Net::HTTP.get(URI('https://blog.raw.pm/rss.xml'))
rss = REXML::Document.new(xml)

rss.elements.each('rss/channel/item') do |item|
  title = item.elements['title'].text
  link = item.elements['link'].text
  puts "#{title}: #{link}"
end

# maybe not unique categories
# rss.root.get_elements('//item/category').each do |category|
#   puts category.text
# end

# unique
rss.root.get_elements('//item/category').map(&:text).uniq.each do |category|
  puts category
end

puts rss.root.get_elements('//item/category').uniq { |category| category.text}.each { |category| puts "#{category.text} - #{category.attributes['domain']}" }

puts "=" * 50

rss2 = Nokogiri::Slop(xml)
rss2.search('item').each do |item|
  puts item.title.text
end

rss2.search('item/category').map { |category| category.text }.uniq.each do |category|
  puts category
end
