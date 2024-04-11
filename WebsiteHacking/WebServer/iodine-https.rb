# frozen_string_literal: true

# iodine -www /srv/http -p 8080 -t 1 -w 1 -v -b 127.0.0.2 -tls

require 'iodine'

host = '127.0.0.2'
Iodine.listen(service: :http, public: '/srv/http', port: 8080, log: 1, bind: host, tls: Iodine::TLS.new(host)) {}
Iodine.threads = 1
Iodine.workers = 1
Iodine.start
