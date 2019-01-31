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
    case input
     when 'ring' || 'rings'
       url = "https://www.jewelry.com/rings"
       JewelryStore::Scraper.scrape_jewelry(url, "Ring")
        list_jewelry
      puts "I will have your info about rings shortly."
     when 'earrings' || 'earring'
       url = "https://www.jewelry.com/earrings"
       JewelryStore::Scraper.scrape_jewelry(url, "Earrings")
       list_jewelry
      puts "I will have your info about earrings shortly."
     when 'necklace' || 'necklaces'
       url = "https://www.jewelry.com/necklaces"
       JewelryStore::Scraper.scrape_jewelry(url, "Necklaces")
       list_jewelry
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
   
   def list_jewelry
     JewelryStore::Jewelry_Piece.all.each.with_index(1) do |type, i|
     puts "#{i}. #{type.description}"
    end
   end
   
end