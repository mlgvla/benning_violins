class BenningViolins::Instrument

    attr_accessor :type, :year, :price, :maker, :description, :terms #might eliminate :type
    @@all = []



# def add_details_to_instruments
#     #hard code now - eventually grab url from iterating thorough Inventory? or Instrument @@all
#     #eventually add avcategory attribute to Instrument to link it to a specific Inventory. Do that
#     #in Instrument Class
#     instrument_choice = "Fine-Violin-Catalog-Fine-Violins-for-Sale-Sergio-Peresson-violin-552.html"
#     instrument_details = BenningViolins::Scraper.scrape_details_page(BASE_PATH + instrument_choice)
#     puts instrument_details
# end
end






