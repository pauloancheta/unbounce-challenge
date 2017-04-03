require 'bundler'
Bundler.require

class App
  def initialize(*args)
    Runner.new(*args).call
  end
end

App.new
