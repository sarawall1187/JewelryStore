class JewelryStore::Scraper
  
  def self.scrape_jewelry(url, type)
    doc = Nokogiri::HTML(open(url))
    doc.css("div.pl-product-info").each.with_index(1) do |item, i|
      
    jewelry_piece = JewelryStore::Jewelry_Piece.new(type)
    jewelry_piece.description = item.css("h5.pl-description").text
    jewelry_piece.url = "https://www.jewelry.com" + item.css("a").attr("href").value
   
    jewelry_piece
    end
  end
  
  def self.scrape_more_info(jewelry_piece)
    doc = Nokogiri::HTML(open(jewelry_piece.url)) 
    jewelry_piece.price = doc.css("span#product-price").text.strip
    jewelry_piece.more_info = doc.css("div.product-desc").text.strip
  end

end