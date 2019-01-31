class JewelryStore::Jewelry_Piece
  
  attr_accessor :type, :description 
  
  @@all_rings=[]
  @@all_necklaces=[]
  @@all_earrings=[]
  
   def initialize(type)
     @type = type
     case type 
     when "Earrings"
       @@all_earrings << self
     when "Necklaces"
       @@all_necklaces << self 
     when "Rings"
       @@all_rings << self 
     end
   end
   
   def self.all
     @@all
   end 
   
   def save
     @@all << self
   end
end