class ImageDataDouble
  def initialize(file)
  end

  def call
    OpenStruct.new(filename: "test.jpg", latitude: "123", longitude: "123")
  end
end
