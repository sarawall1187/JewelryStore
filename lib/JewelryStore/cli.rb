class JewelryStore::CLI 
  
  def start 
    puts "Welcome to my Jewelry Store!"
    puts "Are you shopping or in need of a repair?" 
    puts "Choose 'shop' or 'repair'"
    input = gets.strip
    if input == 'shop'
      shop_menu
    elsif input == 'repair'
     repair
   else 
     puts "\nI did not understand your input."
     start
   end
  end
  
  def shop_menu
    puts "Are you shopping for a ring, earrings, or necklace?"
    puts "Choose 'ring', 'earrings', or 'necklace'"
    input = gets.strip
    case input
     when 'ring', 'rings'
       url = "https://www.jewelry.com/rings"
       JewelryStore::Scraper.scrape_jewelry(url, "Ring")
        list_rings
        ring_choice
        new_choice_menu
     when 'earrings', 'earring'
       url = "https://www.jewelry.com/earrings"
       JewelryStore::Scraper.scrape_jewelry(url, "Earrings")
       list_earrings
       earring_choice
       new_choice_menu
     when 'necklace', 'necklaces'
       url = "https://www.jewelry.com/necklaces"
       JewelryStore::Scraper.scrape_jewelry(url, "Necklaces")
       list_necklaces
       necklace_choice
       new_choice_menu
     else 
       puts "I did not understand your input."
       shop_menu
     end
  end
  
   def repair
     t = DateTime.now
    puts "Our Jeweler is on site, we can have this ready in #{t + 7}"
    puts "What else can I help you with?"
    puts "Shop, another Repair, or Exit?"
    puts "Type 'S' or 'R', 'E'"
    input = gets.strip.upcase 
     if input == 'S'
      shop_menu
      elsif input == 'R'
      repair
      elsif input == 'E'
      puts "Goodbye!"
      else 
       puts "I did not understand your input."
       repair
     end
   end
   
   def list_rings
     JewelryStore::Jewelry_Piece.all_rings.each.with_index(1) do |type, i|
     puts "#{i}. #{type.description}"
    end
   end
   
    def list_earrings
     JewelryStore::Jewelry_Piece.all_earrings.each.with_index(1) do |type, i|
     puts "#{i}. #{type.description}"
    end
   end
   
    def list_necklaces
     JewelryStore::Jewelry_Piece.all_necklaces.each.with_index(1) do |type, i|
     puts "#{i}. #{type.description}"
    end
   end
   
  def ring_choice
    puts "Would you like more information?"
    puts "\nSelect a ring by entering its number."
      input = gets.strip.to_i 
      max_choice = JewelryStore::Jewelry_Piece.all_rings.length
      if input.between?(1, max_choice)
        ring_choice = JewelryStore::Jewelry_Piece.all_rings[input - 1]
        JewelryStore::Scraper.scrape_more_info(ring_choice)
        display_jewelry(ring_choice) 
      else
        puts "I did not understand your input."
        list_rings
        ring_choice
      end
    end
    
     def earring_choice
      puts "Would you like more information?"
      puts "\nSelect an earring by entering its number."
      input = gets.strip.to_i 
      max_choice = JewelryStore::Jewelry_Piece.all_earrings.length
      if input.between?(1, max_choice)
        earring_choice = JewelryStore::Jewelry_Piece.all_earrings[input - 1]
        JewelryStore::Scraper.scrape_more_info(earring_choice)
        display_jewelry(earring_choice) 
      else
        puts "I did not understand your input."
        list_earrings
        earring_choice
      end
    end
    
    def necklace_choice
    puts "\nWould you like more information?"
    puts "\nSelect a necklace by entering its number."
      input = gets.strip.to_i 
      max_choice = JewelryStore::Jewelry_Piece.all_necklaces.length
      if input.between?(1, max_choice)
        necklace_choice = JewelryStore::Jewelry_Piece.all_necklaces[input - 1]
        JewelryStore::Scraper.scrape_more_info(necklace_choice)
        display_jewelry(necklace_choice) 
      else
        puts "I did not understand your input."
        list_necklaces
        necklace_choice
      end
    end
    
    def display_jewelry(jewelry_item)
      JewelryStore::Scraper.scrape_more_info(jewelry_item)
      puts "Here is more information about your selection:\n"
       puts jewelry_item.more_info 
       puts jewelry_item.price
    end
    
    def new_choice_menu
      puts "\nWould you like to see another piece?"
      puts "Choose new Selection, Repair, or Exit"
      puts "Type 'S', 'R', or 'E'"
      input = gets.strip.upcase
        if input == 'S'
          shop_menu
        elsif input == 'E'
          puts "Goodbye!"
          elsif input == 'R'
          repair
        else 
         puts "I did not understand your input."
         new_choice_menu
        end
    end
end