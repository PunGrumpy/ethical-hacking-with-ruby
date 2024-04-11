# frozen_string_literal: true

# agoo -d /srv/http -p 8080 -t 2 -w 1 -v

require 'agoo'

# https://rubydoc.info/gems/agoo/Agoo/Server#init-class_method
Agoo::Server.init(8080, '/srv/http', thread_count: 2, worker_count: 1)

class DataLogger
  def call(_req)
    [200, {}, ['codered']]
  end
end

handler = DataLogger.new
Agoo::Server.handle(:GET, '/**/*', handler)
Agoo::Server.handle(:POST, '/data', handler)
Agoo::Server.start
