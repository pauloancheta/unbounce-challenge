require 'bundler'
Bundler.require

require_relative("./lib/runner.rb")

class App
  def initialize(*args)
    defaults = parse_args(args)
    if defaults
      Runner.new(defaults).call
    else
      Runner.new.call
    end
  end

  private
  def parse_args(args)
    return nil if args.empty?
    return args.first if args.first.is_a?(Hash)

    hash = Hash.new
    args.each do |a|
      hash.merge! option_string_to_hash(a)
    end
    p hash
  end

  def option_string_to_hash(option_string)
    option_array = option_string.split("--").reject { |o| o.empty? }
    option_array = option_array.map{ |opt| opt.split("=") }.flatten

    option_hash = Hash[*option_array]

    option_hash.keys.each do |key|
      option_hash[key.to_sym] = option_hash.delete(key)
    end

    option_hash
  end
end
App.new(*ARGV)
