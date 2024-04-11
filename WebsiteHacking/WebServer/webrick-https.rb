# frozen_string_literal: true

# ruby -run -e httpd /srv/http -p 8080 --ssl-certificate=CERT --ssl-private-key=KEY

require 'webrick'
require 'webrick/https'

cert = [
  %w[CN example.org]
]

server = WEBrick::HTTPServer.new(Port: 8080, DocumentRoot: '/srv/http',
                                 SSLEnable: true, SSLCertName: cert)
# Starting the server blocks the current thread
trap('INT') { server.shutdown }
server.start
