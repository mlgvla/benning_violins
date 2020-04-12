
require_relative "./scraper.rb"

class BenningViolins::CLI

    BASE_PATH = "https://www.benningviolins.com/" #move into Inventory, Instrument, or Scraper Class

    def call
        puts "Welcome to Benning Violins"
        #until "exit"
            get_inventories
            list_inventories
            get_user_inventory
        #next?
        #puts "Thank you for visiting Benning Violins!"
        #end
    end

    def get_inventories
        @inventories = ["vi", "vla", "cel", "bass"] # will get from Inventory.all, which will call Scraper
    end

    def list_inventories
        puts "Please select an instrument to see our current collection."

        @inventories.each.with_index(1) do |inv, index|
            puts "#{index}. #{inv}"        
        end
    end

    def get_user_inventory
        inventory_choice = gets.strip.to_i
        valid_input?(inventory_choice) #call show_inventory if valid input
    end

    def valid_input?(choice)
        binding.pry
        choice.to_i <= @inventories.length && choice.to_i > 0
        
    end

end