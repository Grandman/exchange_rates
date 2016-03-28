require 'faye'
require 'figaro'

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['data']['auth_token'] != Figaro.env.faye_auth_token
        message['error'] = 'Invalid authentication token'
      end
    end
    callback.call(message)
  end
end

Figaro.application = Figaro::Application.new(path: 'config/application.yml')
Figaro.load

Faye::WebSocket.load_adapter('thin')
faye_server = Faye::RackAdapter.new(mount: '/faye', timeout: 45)
faye_server.add_extension(ServerAuth.new)
run faye_server
