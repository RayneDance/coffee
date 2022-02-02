class ETL

    constructor: (@fileLocation) ->
        @ETLData = require('./file').ETLData
        @file = new @ETLData @fileLocation, @readComplete

    readComplete: (fileData) ->
        @data = fileData
        
        for obj in @data

            # Names will almost never be this simple to parse
            # Simple solution for a simple example
            obj['first_name'] = obj['full_name'].split(" ")[0]
            obj['last_name'] = obj['full_name'].split(" ")[1]
            delete obj['full_name']

            obj['phone_number'] = obj['phone_number'].split('-').join('')

            switch obj['gender']
                when "Male" then obj['gender'] = "MM"
                when "Female" then obj['gender'] = "FF"
                when "Non-binary" then obj['gender'] = "NB"
                when "" then obj['gender'] = "NA"
                else obj['gender']= "OG"
            
            console.log obj

etl = new ETL 'D:/coffee/build/MOCK_DATA.csv'