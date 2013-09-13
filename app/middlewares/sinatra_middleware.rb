class MySinatraApp < Sinatra::Base
  get "/" do
    "Hello from Sinatra"
  end
end

class SinatraMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] =~ %r{^/sinatra}
      env["PATH_INFO"].sub! %r{^/sinatra}, '' # /sinatra/home/index => /home/index
      MySinatraApp.call(env)
    else
      @app.call(env)
    end
  end
end