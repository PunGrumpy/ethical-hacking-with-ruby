require "yaml"
require "net/http"

template = YAML.load(Net::HTTP.get(URI('https://raw.githubusercontent.com/projectdiscovery/nuclei-templates/main/http/cves/2024/CVE-2024-0204.yaml')))
# puts template.dig('info', 'author')
# puts template.dig('info', 'description')
references = template.dig('info', 'reference')
references.each do |reference|
  puts "Reference: #{reference}"
end

puts template.dig('info', 'classification', 'cwe-id').split(',')
