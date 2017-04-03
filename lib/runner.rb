require 'bundler'
Bundler.require

class Runner
  attr_reader :files, :stdout, :env, :image_data

  def initialize(
    files: Dir.glob("gps_images/**/*.jpg"),
    stdout: $stdout,
    env: "production")
    @files = files
    @stdout = stdout
    @env = env
    @image_data = image_data
  end

  def call
    if env != "test"
      File.open("./index.html", "w") do |f|
        f.write(export_files_to_html)
      end
    else
      stdout.puts export_files_to_html
    end
  end

  private
  def export_files_to_html
    "test"
  end
end
