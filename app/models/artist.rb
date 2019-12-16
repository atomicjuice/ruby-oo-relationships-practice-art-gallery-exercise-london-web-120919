class Artist

  attr_reader :name, :years_experience

  def initialize(name:, years_experience:)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  @@all = []

  def self.all
    @@all
  end

  def paintings
    Painting.all.select{|paintings|paintings.artist == self}
  end

  def galleries
    paintings.map{|paintings|paintings.gallery}.uniq
  end

  def cities
    galleries.map{|paintings|paintings.city}
  end

  def self.total_experience
    all.map{|artists|artists.years_experience}.reduce(:+)
  end

  def self.most_prolific
    self.all.max_by{|artist|artist.paintings.count / artist.years_experience.to_f}
  end

  def create_painting(title:, price:, gallery:)
    Painting.new(title: title, price: price, artist:self, gallery: gallery)
  end

end 
