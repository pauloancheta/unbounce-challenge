require 'bundler'
Bundler.require

require_relative("./lib/runner.rb")

class App
  def initialize(*args)
    if args.first.is_a? String
      directory = "#{args.first}/**/*.jpg"
      Runner.new(files: Dir.glob(directory)).call
    else
      Runner.new(*args).call
    end
  end
end

App.new(*ARGV)
