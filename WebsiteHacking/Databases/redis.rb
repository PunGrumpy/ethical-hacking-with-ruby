# docker run -d --name redis-ruby-course -e REDIS_PASSWORD=guuCVk3CDp2ZwwheSSKW -p 6379:6379 bitnami/redis:latest

require 'redis'

# Establish database connection
redis = Redis.new(
  host: '0.0.0.0',
  port: 6379,
  db: 1,
  password: 'guuCVk3CDp2ZwwheSSKW',
)

config = {
  color_accent: '#FF5050',
  color_background: '##33363B',
  name: 'PunGrumpy Cybersecurity Inventory',
  website: 'https://inventory.raw.pm/',
  source: 'https://gitlab.com/rawsec/rawsec-cybersecurity-list'
}.each do |key, value|
  # Insert entries
  redis.setnx(key.to_s, value)
end

# Get a key, value
puts "Name:"
puts redis.get('name')
puts

# Get several keys
puts "URL:"
puts redis.mget('website', 'source').map { |x| puts x if x }
puts

# Get all keys
puts 'Keys:'
p redis.keys
puts

# Get all keys matching a pattern
puts 'Colors:'
p redis.mapped_mget(*redis.keys('color_*'))
puts

# Time to live (TTL) is the remaining time before a key expires

# Set the time to live (TTL) in seconds of a key
redis.setex('PunGrumpy', '3600', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Im5vcmFqIiwiaWF0IjoxNTE2MjM5MDIyfQ.BwdZeBBepT9pAj16G2IEGL0TmDI510fwVY8NIYilNs0')

# Get the TTL in seconds of a key
puts 'PunGrumpy JWT TTL:'
puts redis.ttl('PunGrumpy')

# Check TTL remaining time
sleep 2
puts 'PunGrumpy JWT TTL:'
puts redis.ttl('PunGrumpy')

# Remove the existing TTL of a key
redis.persist('PunGrumpy')
puts 'PunGrumpy JWT TTL:'
puts redis.ttl('PunGrumpy')
