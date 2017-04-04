require 'bundler'
require 'csv'
Bundler.require

require_relative("./image_data.rb")
require_relative("./export_to_html.rb")

class Runner
  attr_reader :directory, :stdout, :env, :image_data, :format, :files

  def initialize(
    directory: "gps_images",
    stdout: $stdout,
    env: "production",
    format: "csv",
    image_data: ImageData)

    @directory = "#{directory}/**/*.jpg"
    @stdout = stdout
    @env = env
    @image_data = image_data
    @format = format
  end

  def call(dir: Dir)
    @files = dir.glob(@directory)
    if env != "test"
      write_file
    else
      stdout.puts export_files_to_html
    end
  end

  private

  def write_file
    if format == "html"
      File.open("./index.html", "w"){|f| f.write(export_files_to_html) }
    else
      CSV.open("./index.csv", "wb"){ |f| export_files_to_csv_rows(f) }
    end
  end

  def export_files_to_html
    rows = files.map { |filename| read_exif(filename) }
    ExportToHtml.new(rows: rows).call
  end

  def export_files_to_csv_rows(csv)
    rows = files.map { |filename| read_exif(filename) }
    rows.map do |row|
      csv << [row.filename, row.latitude, row.longitude]
    end
    csv
  end

  def read_exif(filename)
    image_data.new(filename: filename).call
  end
end
