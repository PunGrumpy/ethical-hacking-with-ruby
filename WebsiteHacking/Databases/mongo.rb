# docker run -d --name mongodb-ruby-course -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=c7dNC2phtmkZDc7cow45 -p 27017:27017 mongo:latest

require 'mongo'

# Establish database connection
client = Mongo::Client.new(
  ['0.0.0.0:27017'],
  database: 'admin',
  user: 'root',
  password: 'c7dNC2phtmkZDc7cow45',
)

# Create a database
Mongo::Database.new(client, :ruby)

client = client.with(
  database: 'ruby',
  user: 'root',
  password: 'c7dNC2phtmkZDc7cow45'
)

# Create a collection
collection = client[:users]
# ALTERNATIVE METHOD:
# db = client.database
# Mongo::Collection.new(db, 'users')

datas = [
  {
    email: 'pungrumpy@pwn.by',
    first_name: 'Noppakorn',
    last_name: 'GRUMPY',
    password: '2$UEq@$uLWj%$jdu',
    username: 'pungrumpy'
  },
  {
    email: 'dridri@pwn.by',
    first_name: 'Adrien',
    last_name: 'DEUTROA',
    password: 'YH5MvE^j3e3o`cbc',
    username: 'adri'
  },
  {
    email: 'clecle@pwn.by',
    first_name: 'Clément',
    last_name: 'TINE',
    password: 'khKfxz9XWStMQ~u4',
    username: 'cle42'
  },
  {
    email: 'doggie@pwn.by',
    first_name: 'Nogard',
    last_name: 'EIDDOG',
    password: '3z7z2z7z2z7z2z7z',
    username: 'doggie'
  }
]

datas.each do |data|
  collection.replace_one(
    { username: data[:username] },
    data,
    { upsert: true } # Insert if not exists
  )
end

# Find documents
puts 'Users:'
regex = Regexp.new('^N')
collection.find({ first_name: regex }, projection: { _id: 0, username: 1, email: 1 }).each do |document|
  puts document
end
puts

# List all collections
puts 'Collections:'
db = client.database
p db.collection_names
