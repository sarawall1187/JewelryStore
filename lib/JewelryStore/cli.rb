class JewelryStore::CLI 
  
  def start 
    puts "Welcome to my Jewelry Store!"
    puts "Are you shopping or in need of a repair? Choose 'shop' or 'repair'"
    input = gets.strip
    if input == 'shop'
      shop_menu
    elsif input == 'repair'
     repair
   else 
     puts "I did not understand your input."
     start
   end
  end
  
  def shop_menu
    puts "Are you shopping for a ring, earrings, or necklace? Choose 'ring', 'earrings', or 'necklace'"
    input = gets.strip
     if input == 'ring'
      puts "I will have your info about rings shortly."
     elsif input == 'earrings'
      puts "I will have your info about earrings shortly."
     elsif input == 'necklace'
      puts "I will have your info about necklaces shortly."
     else 
       puts "I did not understand your input."
       shop_menu
     end
  end
  
   def repair
     t = DateTime.now
    puts "Our Jeweler is on site, we can have this ready in #{t + 7}"
    puts "What else can I help you with? Choose 'shop' or 'repair'"
    input = gets.strip 
    if input == 'shop'
      shop_menu
    elsif input == 'repair'
      repair
     else 
       puts "I did not understand your input."
       repair
     end
   end
end