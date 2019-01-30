class JewelryStore::CLI 
  
  def start 
    puts "Welcome to my Jewelry Store!"
    puts "Are you shopping or in need of a repair? Choose 'shop' or 'repair'"
    input = gets.strip
    if input == 'shop'
      puts "Are you shopping for a ring, earrings, or necklace? Choose 'ring', 'earrings', or 'necklace'"
      input = gets.strip
    elsif input == 'repair'
     puts "Our Jeweler is on site, we can have this ready in #{Time.now + 7}"
   else 
     puts "I did not understand your input, please choose 'shop' or 'repair'"
   end
  end
  
end