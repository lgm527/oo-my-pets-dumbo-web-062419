class Owner

  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @cats = []
    @dogs = []

    def cats
      @cats
    end

    def dogs
      @dogs
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    @cats << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    @dogs << new_dog
  end

  def feed_cats
    Cat.all.map do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def walk_dogs
    Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def sell_pets
    Dog.all.map do |dog|
      if dog.owner == self
        dog.owner = nil
        dog.mood = "nervous"
      end
    end
    Cat.all.map do |cat|
      if cat.owner == self
        cat.owner = nil
        cat.mood = "nervous"
      end
    end
  end

  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end

end
