# frozen_string_literal: true

# iodine -www /srv/http -p 8080 -t 1 -w 1 -v

require 'iodine'

Iodine.listen(service: :http, public: '/srv/http', port: 8080, log: 1) {}
Iodine.threads = 1
Iodine.workers = 1
Iodine.start
