#https://www.jewelry.com/ -site to be scraped
#Scrape rings, earrings, necklaces
#each category has div.pl-designer-name, h5.pl-description, p span.smaller-price
#second level scrape will return "the about this product" block

class JewelryStore::Scraper
  
  def self.scrape_jewelry(url)
    doc = Nokogiri::HTML(open(url))
    description = doc.css("h5.pl-description").text
    description.each.with_index(1) do |item, i|
    binding.pry
   puts "#{i}. #{item.description}" 
   end
  end

end