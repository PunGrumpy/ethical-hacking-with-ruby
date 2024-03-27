require "json"
require "net/http"

data = JSON.parse(Net::HTTP.get(URI('https://inventory.raw.pm/api/api.json')))
cracking_tools = data['tools']['cracking']['tools']
count = 0
cracking_tools.each do |tool|
  puts "#{tool['name']} is written in #{tool['language']}"
  count += 1
end

puts "Total cracking tools: #{count}"
