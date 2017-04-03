require 'bundler'
Bundler.require

require_relative("./lib/runner.rb")

class App
  def initialize(*args)
    Runner.new(*args).call
  end
end

App.new
