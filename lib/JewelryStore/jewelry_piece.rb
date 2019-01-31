class JewelryStore::Jewelry_Piece
  
  attr_accessor :type, :description 
  
  @@all=[]
  
   def initialize(type)
     @type = type
     save
   end
   
   def self.all
     @@all
   end 
   
   def save
     @@all << self
   end
end