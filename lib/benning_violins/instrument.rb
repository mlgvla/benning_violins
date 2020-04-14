class BenningViolins::Instrument

    attr_accessor :name, :url, :inventory, :year, :price, :maker, :description, :terms
    @@all = []

    def initialize(name, inventory, url)      
        @name = name
        @url = url
        @inventory = inventory #inventory object
        add_to_inventory #Instrument belongs to an Inventory
        save
    end

    def self.all
        @@all
    end

    def add_to_inventory
        @inventory.instruments << self unless @inventory.instruments.include?(self)
    end

    def get_instrument_details #scrapes and adds details.
        BenningViolins::Scraper.scrape_instrument_details(self) if @maker == nil
    end

    def save
        @@all << self
    end
end






