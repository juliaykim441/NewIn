class Item
    attr_accessor :brand, :name, :price, :url
    @@all = []

    def initialize(brand, name, price, url)
        @brand = brand 
        @name = name 
        @price = price
        @url = url
        @@all << self
    end 

    def self.all
        @@all
    end 
end
