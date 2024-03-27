require 'etc'

group = Etc.getgrgid(1000)
puts "Group name: #{group.name} (gid: #{group.gid})"

group2 = Etc.getgrnam('nogroup')
puts "Group name: #{group2.name} (gid: #{group2.gid})"
