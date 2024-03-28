require 'ctf_party'

puts 'Super long string'.to_b64
puts 'UnVieQ=='.from_b64
puts

puts "SGVsbG8gd29ybGQh is #{'SGVsbG8gd29ybGQh'.b64?}"
puts "SGVsbG8g@@d29ybGQh is #{'SGVsbG8g@@d29ybGQh'.b64?}"
