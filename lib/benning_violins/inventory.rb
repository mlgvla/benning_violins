class BenningViolins::Inventory

    attr_accessor :name, :url, :instruments
    @@all = []

    #BASE_PATH = "https://www.benningviolins.com/" 

    def initialize(name, url)

        @name = name
        @url = url
        @instruments =[] #an Inventory has many instruments
        save
    end

    def self.all

        BenningViolins::Scraper.scrape_inventory if @@all.empty?
        @@all 
    end

    def get_instruments #an Inventory has many instruments - calls Scraper to create instruments
       BenningViolins::Scraper.scrape_instruments(self) if @instruments.empty? 
    end
    
    def save
        @@all << self
    end
end

