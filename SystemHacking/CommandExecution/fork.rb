cpid = fork do
  out = `sleep 5 && date`
  puts out
end

puts "Child pid: #{cpid}"
