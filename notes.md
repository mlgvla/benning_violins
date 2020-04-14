1. CLI/User Experience
2. Inventory (Months)
3. Instrument (Events)
4. Scraper



1. CLI/User Experience Class
    - User opens program without having to type Ruby
    - Welcomes User to Benning Violins
    - Make Inventory objects?
    - Loads Inventory names into menu from website from Inventory Objects
    - User selects instrument inventory or exit
    - Program loads brief title of each instrument from Inventory Class
    - User selects instrument for details or exit
    - Program displays details of selected instrument
    - User has option to revisit inventory menu (reload) or return to main menu or exit

2. Inventory Class
    - An Inventory has many Instruments
    - Separate instance for each type of instrument


3. Instrument Class
    - Creates instances of Instrument Objects
    - Calls on Scraper Class to fill Instrument Objects attributes
    - Instrument object has a :name, :maker,:year :price, :description, :terms
    - Class stores an array of Instrument Objects (@@all)
    - Class can retrive its stored objects
    - An Instrument belongs to a Category

4. Scraper Class
    - Scrapes Benning Violin website sales page for inventory choices
    - Scrapes inventory page when called and makes key/value pairs with scraped data
    - Scrapes details 
    - Creates Inventory and Instrument Objects to hold scraped data





