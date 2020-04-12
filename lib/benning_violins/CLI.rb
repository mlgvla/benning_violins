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
        show_inventory(inventory_choice) if valid_input?(inventory_choice) #call show_inventory if valid input
    end

    def valid_input?(choice)
        choice.to_i <= @inventories.length && choice.to_i > 0
        
    end

    def show_inventory(choice)
        inventory = @inventories[choice - 1]
        #inventory.get_instruments

    end

end