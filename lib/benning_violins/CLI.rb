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
            if inv.name.downcase == "benning"
                puts "#{index}. ".colorize(:light_blue) + "#{inv.name}" + " Instruments" 
            else      
                puts "#{index}. ".colorize(:light_blue) + "#{inv.name}" 
            end       
        end
    end

    def get_user_inventory
        puts ""
        prompt = "Please enter a number between 1 and #{@inventories.length} to see the inventory for your selection or 'exit' to finish browsing.".colorize(:light_magenta)
        puts prompt
        inventory_choice = gets.strip.to_i
        valid_input?(@inventories, inventory_choice)? show_instruments_for(inventory_choice) : get_user_inventory
    end

    def valid_input?(array, choice)
        choice.to_i <= array.length && choice.to_i > 0        
    end

    def show_instruments_for(inventory_choice)
        inventory = @inventories[inventory_choice - 1]
        inventory.get_instruments
        puts ""
        puts "Here is our current inventory of #{inventory.name}:".colorize(:light_magenta)
        puts ""
        inventory.instruments.each.with_index(1) do |ins, index|
            puts "#{index}. ".colorize(:light_blue) + "#{ins.name}"
        end
        get_user_instrument(inventory)
    end

    def get_user_instrument(inventory)
        puts ""
        prompt = "Please enter a number between 1 and #{inventory.instruments.length} to get more details.".colorize(:light_magenta)
        puts prompt
        #puts "Please enter a number to get more details.".colorize(:light_magenta)
        instrument_choice = gets.strip
       
        if valid_input?(inventory.instruments, instrument_choice)
            instrument = inventory.instruments[instrument_choice.to_i - 1] # selects Instrument object
            instrument.get_instrument_details #fills out Instrument object details
            show_instrument_details(instrument)
        else
             get_user_instrument(inventory)
        end   
    end

    def show_instrument_details(instrument)
        puts ""
        puts "#{instrument.name}".colorize(:light_magenta)
        puts ""
        puts "Year: ".colorize(:light_blue) +  (instrument.year == "" || instrument.year == nil ? "N/A" : "#{instrument.year}")
        puts ""
        puts "Price: ".colorize(:light_blue) + (instrument.price == "" || instrument.price == nil ? "N/A" : "#{instrument.price}")
        puts ""
        puts "Maker: ".colorize(:light_blue) + (instrument.maker == "" || instrument.maker == nil  ? "N/A" : "#{instrument.maker}")
        puts ""
        puts "Description: ".colorize(:light_blue) + (instrument.description == "" || instrument.description == nil ? "N/A" : "#{instrument.description}".wrap)
        puts ""
        puts "Terms: ".colorize(:light_blue) + (instrument.terms == "" || instrument.terms == nil ? "N/A" : "#{instrument.terms}".wrap)
        puts ""
        puts "To view images of this item, please visit:".colorize(:light_magenta)
        puts ""
        puts "https://www.benningviolins.com".colorize(:light_blue) + "#{instrument.url}".colorize(:light_blue)
    end

    def next_move
        puts ""
        puts "Please hit any key to check out more of our collection or 'exit' to finish browsing.".colorize(:light_magenta)
        @input = gets.strip
    end 

    def sign_off
        puts ""
        puts "Thank you for visiting Benning Violins!".colorize(:light_blue)
        puts ""
    end
end