class BenningViolins::Instrument

    attr_accessor :name, :url, :inventory, :year, :price, :maker, :description, :terms #might eliminate :type
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
        binding.pry
        BenningViolins::Scraper.scrape_instrument_details(self) if @maker == nil

        # Maybe scrape returns hash and use send to fill attributes?
    end

    def save
        @@all << self
    end



# def add_details_to_instruments
#     #hard code now - eventually grab url from iterating thorough Inventory? or Instrument @@all
#     #eventually add avcategory attribute to Instrument to link it to a specific Inventory. Do that
#     #in Instrument Class
#     instrument_choice = "Fine-Violin-Catalog-Fine-Violins-for-Sale-Sergio-Peresson-violin-552.html"
#     instrument_details = BenningViolins::Scraper.scrape_details_page(BASE_PATH + instrument_choice)
#     puts instrument_details
# end
end






