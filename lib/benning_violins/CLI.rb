
require_relative "./scraper.rb"

class BenningViolins::CLI

    BASE_PATH = "https://www.benningviolins.com/" #move into Inventory, Instrument, or Scraper Class

    def run
        puts "Welcome to Benning Violins"
        #until "exit"
            #get_inventories
            #list_inventories
            #get_user_inventory
        #next?
        puts "Thank you for visiting Benning Violins!"
        #end

        make_inventory # move this method into Inventory Class
        add_details_to_instruments # move this method into Instrument Class
    end

   

    
    end
end