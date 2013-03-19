class Talk
  attr_reader :title, :author_name, :author_screenname
  attr_accessor :image
  

  def initialize(data = {})
    @title = data[:title].gsub(%r{</?[^>]+?>}, '')
    @author_name = data[:author_name]
    @author_screenname = data[:author_screenname]
    @image = nil
  end

  def initWithCoder(decoder)
    self.init

    @title = decoder.decodeObjectForKey("title")
    @author_name = decoder.decodeObjectForKey("author_name")
    @author_screenname = decoder.decodeObjectForKey("author_screenname")
    
    self
  end

  # called when saving an object to NSUserDefaults
  def encodeWithCoder(encoder)
    encoder.encodeObject(@title, forKey: "title")
    encoder.encodeObject(@author_name, forKey: "author_name")
    encoder.encodeObject(@author_screenname, forKey: "author_screenname")
  end

end