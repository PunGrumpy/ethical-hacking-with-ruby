require 'etc'
require 'pp'

current_username = Etc.getlogin
curruent_user = Etc.getpwnam(current_username)
pp curruent_user

puts Etc.getpwuid(0).name
