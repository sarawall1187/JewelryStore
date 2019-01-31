#https://www.jewelry.com/ -site to be scraped
#Scrape rings, earrings, necklaces
#each category has div.pl-designer-name, h5.pl-description, p span.smaller-price
#second level scrape will return "the about this product" block

class JewelryStore::Scraper
  
  def self.scrape_jewelry(url, type)
    doc = Nokogiri::HTML(open(url))
    doc.css("div.pl-product-info").each.with_index(1) do |item, i|
    jewelry_piece = JewelryStore::Jewelry_Piece.new(type)
    jewelry_piece.description = item.css("h5.pl-description").text
  
   #binding.pry
   end
  end
  
  def self.scrape_more_info(url)
  end

end