require_relative("../app.rb")
require_relative("./support/io_double.rb")
require_relative("./support/image_data_double.rb")

describe App do
  let(:io_double) { IODouble.new }

  def unreadable(files: ["test.jpg"], image_data: ImageData)
    App.new(stdout: io_double, env: "test", files: files, image_data: image_data)
  end

  it "supports unreadable format" do
    unreadable
    expect(io_double.to_s).to include "unreadable"
  end

  it "adds the valid data" do
    unreadable(image_data: ImageDataDouble)
    expect(io_double.to_s).to include "test.jpg"
    expect(io_double.to_s).to include "123"
  end
end
