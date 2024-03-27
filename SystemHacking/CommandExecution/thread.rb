thread = Thread.new do
  out = `sleep 5 && date`
  puts out
end

puts thread.join
