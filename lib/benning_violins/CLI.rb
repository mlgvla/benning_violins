class BenningViolins::CLI

    def call
        puts ""
        puts "Welcome to Benning Violins".colorize(:light_blue)
        @input = "" #user either continues or exits program
        until @input == "exit"
            get_inventories
            list_inventories
            get_user_inventory
            next_move
        end
        sign_off
    end

    def get_inventories  
        @inventories = BenningViolins::Inventory.all #where things start!
        
    end

    def list_inventories
        puts ""
        puts "Please select an instrument to see our current collection.".colorize(:light_magenta)
        puts ""
        @inventories.each.with_index(1) do |inv, index|
            puts "#{index}. #{inv.name}"        
        end
    end

    def get_user_inventory
        inventory_choice = gets.strip.to_i
        show_instruments_for(inventory_choice) if valid_input?(inventory_choice)
    end

    def valid_input?(choice) # generalize this to valid all inputs. Add array argument.
        choice.to_i <= @inventories.length && choice.to_i > 0        
    end

    def show_instruments_for(inventory_choice)
        inventory = @inventories[inventory_choice - 1]
        inventory.get_instruments
        puts "Here is our current inventory of #{inventory.name}:"
        inventory.instruments.each.with_index(1) do |ins, index|
            puts "#{index}. #{ins.name}"
        end
        get_user_instrument(inventory)
    end

    def get_user_instrument(inventory)
        puts ""
        puts "Please enter a number to get more details.".colorize(:light_magenta)
        instrument_choice = gets.strip
        instrument = inventory.instruments[instrument_choice.to_i - 1] # selects Instrument object
      
        instrument.get_instrument_details #fills out Instrument object details
        show_instrument_details(instrument)       
    end

    def show_instrument_details(instrument)
        puts ""
        puts "#{instrument.name}".colorize(:light_magenta)
        puts ""
        puts "Year: #{instrument.year}"
        puts ""
        puts "Price: #{instrument.price}"
        puts ""
        puts "Maker: #{instrument.maker}"
        puts ""
        puts "Description: #{instrument.description}"
        puts ""
        puts "Terms: #{instrument.terms}"
        puts ""
        puts "To view images of this item, please visit:"
        puts ""
        puts "https://www.benningviolins.com" + "#{instrument.url}"
        puts ""

    end

    def next_move
        puts "Please hit any key to check out more of our collection or 'exit' to finish browsing."
        @input = gets.strip
    end 

    def sign_off
        puts "Thank you for visiting Benning Violins!"
    end
end