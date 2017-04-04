require_relative("../app.rb")
require_relative("./support/io_double.rb")
require_relative("./support/image_data_double.rb")

describe App do
  let(:io_double) { IODouble.new }

  def unreadable(image_data: ImageData)
    Runner.new(stdout: io_double, env: "test", image_data: image_data).call(dir: DirDouble)
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

class DirDouble
  def self.glob(param)
    ["test.jpg"]
  end
end
