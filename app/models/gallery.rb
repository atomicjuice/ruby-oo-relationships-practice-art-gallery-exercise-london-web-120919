class Gallery

  attr_reader :name, :city

  def initialize(name:, city:)
    @name = name
    @city = city
    @@all << self
  end

  @@all = []

  def self.all
    @@all
  end

  def paintings
    Painting.all.select{|painting|painting.gallery == self}
  end

  def artists
    paintings.map{|painting|painting.artist}
  end

  def artist_name
    artists.map{|artist|artist.name}
  end

  def most_expensive_painting
    paintings.max_by{|painting|painting.price}
  end

end 
