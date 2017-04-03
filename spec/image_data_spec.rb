require_relative("../lib/image_data.rb")
require_relative("./support/exif_double.rb")

describe ImageData do
  let(:exif) { ExifDouble }

  it "defaults to not found" do
    expect(
      ImageData.new(exif_data: exif, filename: "test.jpg").call.attributes
    ).to include(filename: "test.jpg", latitude: "not found", longitude: "not found")
  end
end
