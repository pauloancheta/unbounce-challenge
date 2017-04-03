class IODouble
  def initialize
    @content = ""
  end

  def puts(msg)
    @content = msg
  end

  def to_s
    @content
  end
end
