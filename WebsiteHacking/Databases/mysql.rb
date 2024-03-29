# docker run -d --name mariadb-ruby-course --env MARIADB_USER=ruby --env MARIADB_PASSWORD=oSAy49NiooLUhke9 --env MARIADB_ROOT_PASSWORD=gPYYPxRtg4XXRNK9Ng5J -p 3306:3306 mariadb:latest

require 'mysql2'

# Establish database connection
client = Mysql2::Client.new(
  host: '0.0.0.0',
  port: 3306,
  username: 'root',
  password: 'gPYYPxRtg4XXRNK9Ng5J',
)

# Create a database
client.query <<-SQL
  CREATE DATABASE IF NOT EXISTS ruby CHARACTER SET 'utf8';
SQL

# Grant privileges (permissions) to the user
client.query <<-SQL
  GRANT ALL PRIVILEGES ON ruby.* TO ruby@'%';
SQL

db_user = Mysql2::Client.new(
  host: '0.0.0.0',
  port: 3306,
  username: 'ruby',
  password: 'oSAy49NiooLUhke9',
  database: 'ruby'
)

# Create a table
db_user.query <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(64) NULL,
    first_name VARCHAR(32) NULL,
    last_name VARCHAR(32) NULL,
    password VARCHAR(64) NULL,
    username VARCHAR(32) NULL,
    UNIQUE(username, email)
  );
SQL

[
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
].each do |u|
  # Insert entries
  statement = db_user.prepare('INSERT IGNORE INTO users (email, first_name, last_name, password, username)
              VALUES (?, ?, ?, ?, ?)') # Use IGNORE to avoid duplicate entries
  statement.execute(u[:email], u[:first_name], u[:last_name], u[:password], u[:username])
end

# Find entries
puts 'Users:'
db_user.query('SELECT username, email FROM users WHERE first_name LIKE \'N%\'' ).each do |row|
  p row
end
puts

# List all tables
puts 'Tables:'
db_user.query('SELECT table_schema,table_name FROM information_schema.tables WHERE table_schema != \'mysql\' AND table_schema != \'information_schema\'').each do |row|
  p row
end
