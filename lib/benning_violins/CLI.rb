require "pry"
require_relative "./scraper.rb"

class BenningViolins::CLI

    BASE_PATH = "https://www.benningviolins.com/"

    def run
        make_inventory
    end

    def make_inventory
        menu_choice = "Fine-Violin-Catalog-Fine-Violins-for-Sale.html"
        instrument_inventory = BenningViolins::Scraper.scrape_instruments(BASE_PATH + menu_choice)
        puts instrument_inventory
    end

end