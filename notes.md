1. CLI/User Experience
2. Menu
3. Instrument
4. Scraper



1. CLI/User Experience Class
    - User opens program without having to type Ruby
    - Welcomes User to Benning Violins
    - Loads instrument menu from website (hard code to begin with)
    - User selects instrument category or exit
    - Program loads inventory of instruments from Instrument Class
    - User selects instrument for details or exit
    - Program displays details of selected instrument
    - User has option to revisit inventory menu (reload) or return to main menu or exit

2.  Menu Class (maybe)
    - Displays instrument categories menu in main menu (calls Scraper Class)
    - Displays instrument inventory
    - Displays instrument details

3. Instrument Class
    - Creates instances of Instrument Objects
    - Calls on Scraper Class to fill Instrument Objects attributes
    - Instrument object has a :name, :maker, :price, :description, :terms
    - Class stores an array of Instrument Objects (@@all)
    - Class can retrive its stored objects
    - Class can reset its array to an empty array for next user category selection

4. Scraper Class
    - Scrapes Benning Violin website sales page for menu choices (called by Menu Class)
    - Scrapes inventory page when called by Instrument Class and fills attributes with scraped   data
    - returns Instrument Object to Instrument Class

