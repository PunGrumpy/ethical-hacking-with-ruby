require 'etc'
require 'pp'

Etc.group do |group|
  pp group
end
