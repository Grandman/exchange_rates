module PublishService
  extend self

  def perform(data)
    Thread.new { EM.run } unless EM.reactor_running?
    Thread.pass until EM.reactor_running?

    client = Faye::Client.new('http://localhost:9292/faye')
    client.publish('/rate', 'text' => data, 'auth_token' => FAYE_TOKEN)
  end
end
