require 'bundler'
Bundler.require

require_relative("./lib/runner.rb")

class App
  def initialize(directory = "gps_images")
    puts directory
    Runner.new(files: Dir.glob("#{directory}/**/*.jpg")).call
  end
end

App.new(ARGV)
