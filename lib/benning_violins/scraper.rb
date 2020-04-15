class BenningViolins::Scraper
  BASE_PATH = "https://www.benningviolins.com/"

  def self.scrape_inventory
    
    site = BASE_PATH + "Fine-Instrument-Catalog-Violins-Violas-Cellos-Bows.html"
    doc = Nokogiri::HTML(open(site))

    inventories = doc.css("div.djc_clearfix div.djc_subcategory")

    inventories.each do |inventory|
        name = inventory.css("h3 a").text.strip
        if name.downcase == "bows"
          self.scrape_bows
        else
          url = inventory.css("a").attr("href").value
          BenningViolins::Inventory.new(name, url)
        end
    end
  end

  def self.scrape_bows
    #additional method called by scrape_inventory to scrape the nested menu choice of bow type

    site = BASE_PATH + "Fine-Bows-Catalog-Fine-Violin-Viola-Cello-Bows-for-Sale.html"
    doc = Nokogiri::HTML(open(site))

    inventories = doc.css("div.djc_clearfix  div.djc_subcategory")

    inventories.each do |inventory|
      name = inventory.css("h3 a").text.strip
      url = inventory.css("a").attr("href").value
      BenningViolins::Inventory.new(name, url)
    end
  end

  def self.scrape_instruments(inventory)
    
    site = BASE_PATH + inventory.url
    doc = Nokogiri::HTML(open(site))

    instruments = doc.css("div.djc_items .djc_item")

    instruments.each do |instrument|
          
      name = instrument.css("a").text.strip
      url = instrument.css("a").attr("href").text
      BenningViolins::Instrument.new(name, inventory, url)
    end
  end

  def self.scrape_instrument_details(instrument)
      #tyear, price, maker, description, terms(might eliminate category later)
      
    site = BASE_PATH + instrument.url
    
  
    doc = Nokogiri::HTML(open(site))
    
    details = doc.css("div.djc_fulltext p")
  
    details.each do |detail|

      nbsp = Nokogiri::HTML("&nbsp;").text #convert HTML nbsp to text nbsp
      new_detail = detail.text.sub(/^[^:]+:\s*/, "") #delete label
      final_detail = new_detail.sub(nbsp, "") #delete text nbsp
      
      label = detail.css("strong").text.strip.downcase #details label is in <strong> tag
      #convert label to lower case
      
      # If a value is empty, add N/A?
      if label.include?("maker")
      instrument.maker = final_detail 
      elsif label.include?("year") || label.include?("circa")
        instrument.year = final_detail
      elsif label.include?("price")
        instrument.price = final_detail            
      elsif label.include?("description")
        instrument.description = final_detail            
      elsif label.include?("terms")
        instrument.terms = final_detail 
      end
    end
  end
end





