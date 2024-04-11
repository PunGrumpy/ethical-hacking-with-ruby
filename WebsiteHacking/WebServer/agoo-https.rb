# frozen_string_literal: true

# agoo -d /srv/http -b http://127.0.0.2:8080 -p 8080 -t 2 -w 1 -v

require 'agoo'

# Optionally configure what you want to be displayed
# https://rubydoc.info/gems/agoo/Agoo/Log#configure-class_method
Agoo::Log.configure(dir: '.',
                    console: true,
                    classic: true,
                    colorize: true,
                    states: {
                      ERROR: true,
                      WARN: true,
                      INFO: true,
                      DEBUG: true,
                      connect: false,
                      request: true,
                      response: false,
                      eval: false,
                      push: false
                    })

# https://rubydoc.info/gems/agoo/Agoo/Server#init-class_method
Agoo::Server.init(8080, '/srv/http', thread_count: 2, worker_count: 1, bind: ['http://:8080', 'https://127.0.0.2:4343'], ssl_cert: 'server.crt', ssl_key: 'server.key')

class DataLogger
  def call(_req)
    [200, {}, ['codered']]
  end
end

handler = DataLogger.new
Agoo::Server.handle(:GET, '/**/*', handler)
Agoo::Server.handle(:POST, '/data', handler)
Agoo::Server.start
