class JewelryStore::Jewelry_Piece
  
  attr_accessor :type, :description, :url
  
  @@all_rings=[]
  @@all_necklaces=[]
  @@all_earrings=[]
  
   def initialize(type, url)
     @type = type
     case type 
       when "Earrings"
         @@all_earrings << self
       when "Necklaces"
         @@all_necklaces << self 
       when "Ring"
         @@all_rings << self 
     end
     @url = "https://www.jewelry.com" + url
   end
   
   def self.all_earrings
     @@all_earrings
   end 
   
     def self.all_necklaces
     @@all_necklaces 
   end 
   
     def self.all_rings
     @@all_rings
   end 
   
end