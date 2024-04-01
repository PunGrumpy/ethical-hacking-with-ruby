require 'json'
require 'open-uri'

# API_URL = 'https://iplist.cc/api/' # Not working
API_URL = 'https://ip.guide/'

# IPv6
ip = JSON.parse(URI.open(API_URL + '2a00:d880:5:509::face').read)
puts "IPv6: #{ip}"

# IPv4
ip = JSON.parse(URI.open(API_URL + '54.39.46.56').read)
puts "IPv4: #{ip}"

# Hostname
host = JSON.parse(URI.open(API_URL + 'pwn.by').read)
puts "Hostname: #{host}"

# Your IP
ip = JSON.parse(URI.open(API_URL).read)
puts "Your IP: #{ip}"
