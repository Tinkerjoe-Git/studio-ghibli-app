class GhibliData
    @@all =[]
  def initialize(ghibli_hash)
    ghibli_hash.each do  |key, value|
      self.class.attr_accessor(key)
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end
end