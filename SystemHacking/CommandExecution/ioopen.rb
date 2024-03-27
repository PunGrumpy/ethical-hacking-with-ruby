out = IO.popen('python', 'r+') do |pipe|
  pipe.puts('import sys')
  pipe.puts('print(sys.version)')
  pipe.puts('ver_short = (sys.version_info[0], sys.version_info[1])')
  pipe.puts('print(".".join(map(str, ver_short)))')
  pipe.close_write
  pipe.read
end

puts out 
