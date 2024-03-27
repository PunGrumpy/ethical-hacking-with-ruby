require 'etc'

Etc.passwd do |user|
  puts "#{user.name}:#{user.uid}:#{user.gid}:#{user.gecos}:#{user.dir}:#{user.shell}"
end
