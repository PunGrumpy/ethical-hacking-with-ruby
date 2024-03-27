require 'etc'
require 'pp'

puts "Temporary directory: #{Etc.systmpdir}"
puts "System configuration: #{Etc.sysconfdir}"

pp Etc.uname
