require_relative "./null_object.rb"

class ImageData
  include Virtus.model

  attribute :filename
  attribute :latitude
  attribute :longitude
  attribute :exif_data, Object, default: Exif::Data

  def call
    exif = exif_data.new(filename)
    @latitude = !!exif.gps_latitude ? exif.gps_latitude : "not found"
    @longitude = !!exif.gps_longitude ? exif.gps_longitude : "not found"
    self
  rescue RuntimeError
    NullObject.new
  end

end
