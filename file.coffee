class exports.ETLData
    constructor: (@syslocation, @readComplete) ->

        @fs = require 'fs'
        @parser = require 'csv-parser'
        @fileData = []
        @read()
        
    read: ->
        
        @fs.createReadStream @syslocation
            .pipe @parser()
            .on('data', (data) => @fileData.push(data))
            .on('err', (err) => console.log "Some error")
            .on('end', () => @readComplete(@fileData))

    getData: ->
        @fileData


