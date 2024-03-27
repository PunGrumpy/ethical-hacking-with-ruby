require 'find'

path = ARGV[0]

search = Find.find(path)
puts "Searching in #{path} for potential EoP files..."

def potential_eop_files(search)
  search.each do |file|
    File.file?(file) && File.executable?(file) && File.writable?(file) && File.readable?(file) ? puts("Weak permissions found in #{file}") : puts("No weak permissions found in #{file}")
  end
end

potential_eop_files(search)
