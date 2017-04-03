require 'bundler'
Bundler.require

class Runner
  attr_reader :files, :stdout, :env, :image_data

  def initialize(
    files: Dir.glob("gps_images/**/*.jpg"),
    stdout: $stdout,
    env: "production",
    image_data: ImageData)
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
    rows = files.map { |filename| read_exif(filename) }
    ExportToHtml.new(rows: rows).call
  end

  def read_exif(filename)
    image_data.new(filename: filename).call
  end

end
