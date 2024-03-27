require 'pty'

PTY.spawn('printenv', 'SHELL') do |r, w, pid|
  puts r.gets
end
