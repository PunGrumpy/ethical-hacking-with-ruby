# Create a file
file = File.new('create.txt', 'w+')

# Write to a file
file.puts('some text')
file.puts('second line')

file.write('some other stuff without new line')
file.write('on the same line')

# Operations
file.close

# File modes
# r: read-only, starts at beginning of file (default mode).
# r+: read-write, starts at beginning of file.
# w: write-only, truncates existing file to zero length or creates a new file for writing.
# w+: read-write, truncates existing file to zero length or creates a new file for reading and writing.
# a: write-only, starts at end of file if file exists, otherwise creates a new file for writing.
# a+: read-write, starts at end of file if file exists, otherwise creates a new file for reading and writing.
