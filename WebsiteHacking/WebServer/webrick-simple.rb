# frozen_string_literal: true

# ruby -run -e httpd /srv/http -p 8080

require 'webrick'

server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: '/srv/http')
# Strarting the server blocks the current thread
trap('INT') { server.shutdown }
server.start
