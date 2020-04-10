require "open-uri"
require "nokogiri"
require "pry"

class BenningViolins::Scraper

    

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
end





