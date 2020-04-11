require "open-uri"


class BenningViolins::Scraper

    #Rename some of the instance variables to make some sense!

    def self.scrape_inventory()
      #scrapes inventory names and links
      #creates Inventory objects in each.do
    end

    def self.scrape_instruments(inventory_url)
        instrument_hash_array = []

        site = inventory_url
        doc = Nokogiri::HTML(open(site))

        things = doc.css("div.djc_items .djc_item")

        things.each do |thing|
            hash = {
            :name => thing.css("a").text.strip,
            :url => thing.css("a").attr("href").text
            }   
            instrument_hash_array << hash
         end
         
         instrument_hash_array
    end

    def self.scrape_details_page(instrument_url)
        #returns details hash to CLI (add_instrument_details)
        #type, year, price, maker, description, terms(might eliminate category later)

        instrument_details_hash = {}
        
        site = instrument_url
      
        doc = Nokogiri::HTML(open(site))
        
        things = doc.css("div.djc_fulltext p")
      
        things.each do |thing|
            nbsp = Nokogiri::HTML("&nbsp;").text #convert HTML nbsp to text nbsp
            old_details = thing.text.sub(/^[^:]+:\s*/, "") #delete label
            details = old_details.sub(nbsp, "") #delete text nbsp
           #Rename detail_one "label"
            detail_one = thing.css("strong").text.strip #details label is in <strong> tag
            #convert label to lower case
            if detail_one.include?("Type")
              instrument_details_hash[:type]= details
            elsif detail_one.include?("Year")
              instrument_details_hash[:year]= details.to_i 
            elsif detail_one.include?("Price")
              instrument_details_hash[:price]= details            
            elsif detail_one.include?("Description")
              instrument_details_hash[:description]= details            
            elsif detail_one.include?("Terms")
              instrument_details_hash[:terms]= details 
            end
       end
      return instrument_details_hash
    end
end





