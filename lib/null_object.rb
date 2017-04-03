class NullObject
  include Virtus.model

  attribute :filename, String,  default: "unreadable"
  attribute :latitude, String,  default: "unreadable"
  attribute :longitude, String, default: "unreadable"
end
