class JewelryStore::CLI 
  
 def start 
  diamond
  puts "Welcome to my Jewelry Store!"
  puts "Are you Shopping or in need of a Repair?" 
  puts "Choose 'S' or 'R'"
  
  input = gets.strip.upcase
    if input == 'S'
      shop_menu
    elsif input == 'R'
      repair
    else 
     puts "\nI did not understand your input."
      start
    end
  end
  
  def shop_menu
   puts "Are you shopping for a ring, earrings, or necklace?"
   puts "Choose 'R', 'E', or 'N'"
   input = gets.strip.upcase
   case input
     when 'R'
       url = "https://www.jewelry.com/rings"
       if JewelryStore::Jewelry_Piece.all_rings == []
        JewelryStore::Scraper.scrape_jewelry(url, "Ring")
       end
       list_jewelry("rings")
       jewelry_choice("rings")
       new_choice_menu
     when 'E'
       url = "https://www.jewelry.com/earrings"
       if JewelryStore::Jewelry_Piece.all_earrings == []
        JewelryStore::Scraper.scrape_jewelry(url, "Earrings")
       end
       list_jewelry("earrings")
       jewelry_choice("earrings")
       new_choice_menu
     when 'N'
       url = "https://www.jewelry.com/necklaces"
       if JewelryStore::Jewelry_Piece.all_necklaces == []
        JewelryStore::Scraper.scrape_jewelry(url, "Necklaces")
       end
       list_jewelry("necklaces")
       jewelry_choice("necklaces")
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
   
   def list_jewelry(type)
     JewelryStore::Jewelry_Piece.send("all_#{type}").each.with_index(1) do |type, i| 
       puts "#{i}. #{type.description}"
    end
   end
   
  def jewelry_choice(type)
   puts "Would you like more information?"
   puts "\nSelect a piece by entering its number."
   input = gets.strip.to_i 
   max_choice = JewelryStore::Jewelry_Piece.send("all_#{type}").length
   
    if input.between?(1, max_choice)
     choice = JewelryStore::Jewelry_Piece.send("all_#{type}")[input - 1]
     JewelryStore::Scraper.scrape_more_info(choice)
     display_jewelry(choice) 
    else
     puts "I did not understand your input."
     list_jewelry(type)
     jewelry_choice(type)
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
  
 def diamond
    puts "   ______   "
    puts "  /______\\  "
    puts "  \\      /  "
    puts "   \\    /   "
    puts "    \\  /    "
    puts "     \\/     "
 end
 
end