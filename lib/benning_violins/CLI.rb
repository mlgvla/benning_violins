class BenningViolins::CLI

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
        @inventories = BenningViolins::Inventory.all
        
    end

    def list_inventories
        puts "Please select an instrument to see our current collection."

        @inventories.each.with_index(1) do |inv, index|
            puts "#{index}. #{inv.name}"        
        end
    end

    def get_user_inventory
        inventory_choice = gets.strip.to_i
        show_instruments_for(inventory_choice) if valid_input?(inventory_choice)
    end

    def valid_input?(choice)
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
     
        puts "Please enter a number to get more details."
        instrument_choice = gets.strip
        instrument = inventory.instruments[instrument_choice.to_i - 1] #Instrument object
      
        instrument.get_instrument_details #fills out Instrument object details
       # show_instrument_details(instrument)
       
      
    end

    # def show_instrument_details()
    # end

end