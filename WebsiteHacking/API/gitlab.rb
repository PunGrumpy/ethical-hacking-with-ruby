require 'json'
require 'open-uri'

API_URL = 'https://gitlab.com/api/v4/'

# Recently created public projects
#=begin
# projects = JSON.parse(URI.open(API_URL + 'projects').read)
# projects.each do |project|
#   puts "#{project['path_with_namespace']} - #{project['description']}"
# end
#=end

# List user projects
#=begin
projects = JSON.parse(URI.open(API_URL + 'users/arnaudr/projects').read)
projects.each do |project|
  puts "#{project['name']} (#{project['star_count']} stars)"
  puts "Last activity: #{project['last_activity_at']}"
  puts project['topics'] unless project['topics'].empty?
  puts
end
